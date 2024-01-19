#!/usr/bin/env bash

git clone https://github.com/limine-bootloader/limine.git --branch=binary --depth=1
gmake -C limine
