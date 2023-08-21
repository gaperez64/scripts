#!/usr/bin/env python3

import pandas as pd
import sys


def process(fname):
    frame = pd.read_csv(fname, header=0, sep=';', quotechar='"')

    # Removing the first two rows which were just tests by me
    frame = frame[~frame["ID"].isin([1, 2])]

    # Hardcoding amounts and status of me, students, Benny
    # and people who have been sent an invoice
    us = frame["ID"].isin([3, 4, 6, 8, 15, 45,
                           141, 65, 108, 137, 37])
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
    print(f"No. of participants who paid already: {frame.shape[0]}")

    total = frame["Bedrag"].sum()
    print(f"Total amount received: {total}eur")

    # Fetching information about who attends what
    print("# Attendance numbers (recall +8 guests)")
    print("# (and Christian reg'd for workshop, not FORMATS last day)")
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
