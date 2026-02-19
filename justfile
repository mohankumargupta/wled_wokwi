set shell := ["sh", "-c"]
set windows-shell := ["cmd", "/c"]

_main:
    @just --list

setup:
  npm install

build:
  uvx --python=3.13 --with=pip platformio run --environment my_esp32c3dev

targets:
  uvx --python=3.13 --with=pip platformio --list-targets -v

prune:
  uvx --python=3.13 --with=pip platformio system prune

buildfs:
    uvx --python=3.13 --with=pip platformio run -t buildfs
  


[working-directory: '.pio/build/my_esp32c3dev']  
mergebin:    
  uvx esptool --chip ESP32-C3 merge-bin -o merged-flash.bin --flash-mode dio --flash-size 4MB 0x0 bootloader.bin 0x8000 partitions.bin 0x10000 firmware.bin 0x310000 spiffs.bin

all: build buildfs mergebin