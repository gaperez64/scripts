#!/usr/bin/env python3

import pandas as pd
import sys


def process(fname):
    frame = pd.read_csv(fname, sep=',', quotechar='"', header=0)

    # Removing the first two rows which were just tests by me
    frame = frame[~frame["ID"].isin([1, 2])]

    # Hardcoding amounts and status of me, students, and Benny
    us = frame["ID"].isin([3, 4, 6, 8, 15, 45])
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


if __name__ == "__main__":
    process(sys.argv[1])
    exit(0)
