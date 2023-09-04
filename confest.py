#!/usr/bin/env python3

import pandas as pd
import sys


def regdfor(row):
    regd = []
    if (row["Student_pre"] or
            row["Student_pre_early"] or
            row["Regular_pre"] or
            row["Regular_pre_early"]):
        regd.append("B")
    if (row["Student_reception"] == "yes" or
            row["Regular_reception"] == "yes"):
        regd.append("R")
    if (row["Student"] or
            row["Student_early"] or
            row["Regular"] or
            row["Regular_early"]):
        regd.append("C")
    if (row["Student_extra_yes"] or
            row["Student_extra_yes_early"] or
            row["Regular_extra_yes"] or
            row["Regular_extra_yes_early"]):
        regd.append("X")
    if (row["Student_post"] or
            row["Student_post_early"] or
            row["Regular_post"] or
            row["Regular_post_early"]):
        regd.append("A")
    return " ".join(regd)


def process(fname):
    frame = pd.read_csv(fname, header=0, sep=';', quotechar='"')

    # Removing the first two rows which were just tests by me
    frame = frame[~frame["ID"].isin([1, 2])]

    # Hardcoding amounts and status of me, students, Benny
    # and people who have been sent an invoice
    # and invited speakers who attend for free
    us = frame["ID"].isin([3, 4, 6, 8, 15, 45,
                           141, 65, 108, 137, 37,
                           115,
                           ])
    frame.MultiSafePayStatus[us] = "completed"
    students = frame["ID"].isin([4, 6, 8, 15])
    frame.Bedrag[students] = 580

    # Obtain counts of food restrictions
    food = frame[["Diet", "ID"]].groupby("Diet").nunique()
    print("# Dietary restrictions")
    print(food)
    # And special food restrictions
    food = frame[frame["Diet"] == "Diet_other"]
    food = food[["ID", "Diet_other"]]
    print("# Specific food restrictions")
    print(food)

    # Restricting to payed status now
    print("# Paying registrants")
    frame = frame[frame["MultiSafePayStatus"] == "completed"]
    # Having a single name field will come in handy
    frame["Fullname"] = frame.apply(lambda row:
                                    row["Firstname"] + " " + row["Familyname"],
                                    axis=1)
    print(f"No. of participants who paid already: {frame.shape[0]}")

    # Dumping to file the information for tags
    f = open("parts.tex", "w")
    i = 0
    for _, row in frame.iterrows():
        if i % 10 == 0:
            f.write("\\tagpage")
        if i % 2 == 0:
            (name1, affil1) = (row["Fullname"],
                               row["Affiliation"].replace("&", "\\&"))
            regd1 = regdfor(row)
        else:
            (name2, affil2) = (row["Fullname"],
                               row["Affiliation"].replace("&", "\\&"))
            regd2 = regdfor(row)
            f.write("{"
                    f"{{{name1}}}/{{{affil1}}}/{{{regd1}}}/"
                    f"{{{name2}}}/{{{affil2}}}/{{{regd2}}}"
                    "}%\n")
        i += 1
    print(f"Value of i before mod = {i}, {i % 10}")
    if i % 10 != 0:
        while i % 10 != 0:
            if i % 2 == 0:
                (name1, affil1) = ("", "")
                regd1 = ""
            else:
                (name2, affil2) = ("", "")
                regd2 = ""
                f.write("{"
                        f"{{{name1}}}/{{{affil1}}}/{{{regd1}}}/"
                        f"{{{name2}}}/{{{affil2}}}/{{{regd2}}}"
                        "}%\n")
            i += 1
    f.close

    # Dumping to file the food restrictions of paying registrants
    frame["Diet restr"] = frame.apply(lambda row:
                                      row["Diet"] if
                                      row["Diet"] != "Diet_other"
                                      else row["Diet_other"],
                                      axis=1)
    food = frame[["Fullname", "Diet restr"]]
    food.to_csv("diet.csv")

    # Information about money
    total = frame["Bedrag"].sum()
    print(f"Total amount received: {total}eur")

    # Fetching information about who attends what
    print("# Attendance numbers (recall +8 guests)")
    recep = frame[(frame["Student_reception"] == "yes") |
                  (frame["Regular_reception"] == "yes")]
    print(f"No. of participants going to reception: {recep.shape[0]}")
    prewk = frame[(frame["Student_pre"]) |
                  (frame["Student_pre_early"]) |
                  (frame["Regular_pre"]) |
                  (frame["Regular_pre_early"])]
    print(f"participants going to pre-workshops: {prewk.shape[0]}")
    confs = frame[(frame["Student"]) |
                  (frame["Student_early"]) |
                  (frame["Regular"]) |
                  (frame["Regular_early"])]
    print(f"participants going to main confs: {confs.shape[0]}")
    extra = frame[(frame["Student_extra_yes"]) |
                  (frame["Student_extra_yes_early"]) |
                  (frame["Regular_extra_yes"]) |
                  (frame["Regular_extra_yes_early"])]
    print(f"extra tickets for social event: {extra.shape[0]}")
    poswk = frame[(frame["Student_post"]) |
                  (frame["Student_post_early"]) |
                  (frame["Regular_post"]) |
                  (frame["Regular_post_early"])]
    print(f"participants going to post-workshops: {poswk.shape[0]}")


if __name__ == "__main__":
    process(sys.argv[1])
    exit(0)
