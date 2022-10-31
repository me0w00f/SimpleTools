#!/usr/bin/env python
import SimpleHTTPServer
import argparse

class MyHTTPRequestHandler(SimpleHTTPServer.SimpleHTTPRequestHandler):
    def end_headers(self):
        self.send_my_headers()
        SimpleHTTPServer.SimpleHTTPRequestHandler.end_headers(self)

    def send_my_headers(self):
        self.send_header("Cache-Control", "no-cache, no-store, must-revalidate")
        self.send_header("Pragma", "no-cache")
        self.send_header("Expires", "0")

if __name__ == '__main__':
    parser = argparse.ArgumentParser(prog='python3 serveit.py',description='Serve a no-cache web service in current directory')
    parser.add_argument('port', help='port you want the web server to run on')
    args = parser.parse_args()
    SimpleHTTPServer.test(HandlerClass=MyHTTPRequestHandler)
