#!/bin/bash

set -e

for i in armeabi x86 armeabi-v7a;do # armeabi-v7a x86_64
	[ -d boost_1_55_0-$i ] && mv boost_1_55_0-$i boost_1_55_0
	bash build-android.sh --boost=1.55.0 --arch="$i" --without-libraries=python "$android_ndk"
	mv boost_1_55_0 boost_1_55_0-$i
done
