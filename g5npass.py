# /usr/bin/python
# -*- coding: utf-8 -*-

f = open("pass.txt", "x")
for i in range(10000,100000):
    f.write(str(i) + "\n")
    

# Generate 5 bit number password.