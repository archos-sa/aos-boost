#!/bin/bash

for i in armeabi x86 armeabi-v7a;do # armeabi-v7a x86_64
	bash build-android.sh --boost=1.55.0 --arch="$i" --without-libraries=python "$1"
done
