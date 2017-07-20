#!/bin/bash

set -e

found=1
for i in x86 armeabi-v7a;do
	[ ! -f build-$i/lib/libboost_system-gcc-mt-1_55.a ] && found=0
done

[ "$found" == 1 ] && exit 0


for i in x86 armeabi-v7a;do
	[ -d boost_1_55_0-$i ] && mv boost_1_55_0-$i boost_1_55_0
	bash build-android.sh --boost=1.55.0 --arch="$i" --without-libraries=python "$android_ndk"
	mv boost_1_55_0 boost_1_55_0-$i
done
