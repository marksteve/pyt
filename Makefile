all: pyt.love
clean:
	rm pyt.love
adb-push: pyt.love
	adb push pyt.love /sdcard/pyt.love
	adb shell am start -S -n "org.love2d.android/.GameActivity" -d "file:///sdcard/pyt.love"
.PHONY: all clean
pyt.love: main.lua conf.lua
	zip -9 -q -r pyt.love .

