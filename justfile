set shell := ["sh", "-c"]
set windows-shell := ["powershell", "-c"]

_main:
    @just --list



merge_bin:
    pio run -t buildfs
    pio run -t mergebin

