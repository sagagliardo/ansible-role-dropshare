#!/usr/bin/env python

import testinfra

def test_nginx_is_installed(Package):
    nginx = Package("nginx")
    assert nginx.is_installed
