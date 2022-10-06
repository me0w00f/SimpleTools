# /usr/bin/python
# -*- coding: utf-8 -*-

f = open("pass.txt","x")
for i in range(1000,10000):
    f.write(str(i)+ "\n")

# generate 4 bit number password