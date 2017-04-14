#!/usr/bin/env python
from livereload import Server, shell
from  pprint import pprint
from formic import formic
server = Server()
for filepath in formic.FileSet(include=["**.rb","**.pp"]):
    server.watch(filepath, shell( 'puppet apply {filepath}'.format(filepath=filepath), output='/home/ahlauncher/chaos.log', mode='a', cwd='/home/ahlauncher/'), delay=2)
server.serve(root='/home/ahlauncher/')
