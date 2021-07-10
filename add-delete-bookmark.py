#!/usr/bin/env python3

import sys

# CHANGE TO BE PATH TO BOOKMARKS FILE.
bookmarks = "..."

if len(sys.argv) != 3:
    raise ValueError(f"{sys.argv[0]} takes two arguments.")

mode = sys.argv[1]
location = sys.argv[2].strip()

if mode == "-a":
    with open(bookmarks, "a+") as f:
        f.seek(0)
        if all(line.strip() != location for line in f):
            f.write(location.strip() + "\n")
        exit()
elif mode == "-d":
    with open(bookmarks, "r+") as f:
        lines = f.readlines()
        f.seek(0)
        for i in lines:
            if i.strip() != location:
                f.write(i)
        f.truncate()
else:
    raise ValueError(f"Invalid argument: {mode}")
