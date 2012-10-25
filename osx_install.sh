#!/bin/sh
vagrant basebox build -f demo.openconext.org &&
vagrant basebox export demo.openconext.org &&

vagrant box remove demo.openconext.org

vagrant box add demo.openconext.org demo.openconext.org.box &&
vagrant -f destroy &&
vagrant up
