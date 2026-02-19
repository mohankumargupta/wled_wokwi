# WLED on Wokwi


## Clone wled repo locallly

```sh
git clone --depth=1 https://github.com/wled/WLED

```

## Copy cfg.json and presets.json

copy to the **wled00/data** directory

## use justfile to build wled

just all

## Use wokwiwg to port forward tcp and udp ports

https://github.com/wokwi/wokwigw/releases