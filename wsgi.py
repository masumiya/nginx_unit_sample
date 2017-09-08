#!/usr/bin/env python

from flask import Flask

application = Flask(__name__)

@application.route("/")
def index():
    return "<h1>Hello world from Python</h1>"
