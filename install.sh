log () {
    echo [*] $@
}

log Alpine4droid installer ver 1.0
log Preparing...
mkdir tmp
rm tmp/target.tar.gz
log Getting target arch...

#arch=$(uname -m)
export arch=armv8l

case $arch in
  x86_64|amd64)
    export target=x86_64;;
  i?86)
    export target=x86;;
  arm*)
    export target=armv7;;
esac


log Target: $target

log Please tell where install alpine linux container\(path starts with /data ex: typed: alpine path: /data/alpine\)

read installpath
export instpath=/data/$installpath
log Ok, install path $instpath

log Downloading image using curl...
curl https://dl-cdn.alpinelinux.org/alpine/v3.17/releases/armv7/alpine-minirootfs-3.17.2-$target.tar.gz --output tmp/target.tar.gz