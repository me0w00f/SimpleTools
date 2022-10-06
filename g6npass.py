# /usr/bin/python
# -*- coding: utf-8 -*-

f = open("pass.txt", "x")
for i in range(100000,1000000):
    f.write(str(i) + "\n")
    

# Generate 6 bit number password.