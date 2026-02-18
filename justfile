set shell := ["sh", "-c"]
set windows-shell := ["cmd", "/c"]

_main:
    @just --list

setup:
  npm install

build:
  uvx --python=3.13 --with=pip platformio run --environment my_esp32c6dev

targets:
  uvx --python=3.13 --with=pip platformio --list-targets -v

merge_bin:
    uvx --python=3.13 --with=pip platformio run -t buildfs
    uvx --python=3.13 --with=pip platformio run -t mergebin
