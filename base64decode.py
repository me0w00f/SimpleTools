# /usr/bin/python
# -*- coding: utf-8 -*-

import argparse
import base64

parser = argparse.ArgumentParser(description="A base64 decoder script made by WeepingDogel for CTF.")
parser.add_argument('-d', '--decode', help="decode some strings.")
args = parser.parse_args()
r = base64.b64decode(args.decode).decode("utf-8")
print(r)

