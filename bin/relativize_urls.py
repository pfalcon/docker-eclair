#!/usr/bin/env python3
import sys
import re
import os
import glob


os.chdir(sys.argv[1])
for fn in glob.iglob("**/*.html", recursive=True):
    depth = fn.count("/")
    relp = "/".join([".."] * depth)
    if relp:
        relp += "/"
    #print(fn, relp)
    with open(fn) as f:
        txt = f.read()
    txt = txt.replace("/opt/bugseng/eclair-3.12.0/", relp)
    #os.rename(fn, fn + ".bak")
    with open(fn, "w") as f:
        f.write(txt)
