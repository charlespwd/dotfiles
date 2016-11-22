#!/bin/bash

# fix the fucking synaptic driver.. this should be in
# /etc/X11/xorg.conf.d/70-synaptics.conf but it's just not
# fucking working properly. Moreover, while it's here I can
# have this stuff get reloaded by i3 rather than rebooting
# i3 every time.

# Sensitivity
synclient AccelFactor=0.0275
synclient MinSpeed=3.5
synclient MaxSpeed=10.75

# Controls
synclient TapButton1=1
synclient TapButton2=3
synclient TapButton3=2

# Scrolling
synclient VertTwoFingerScroll=1
synclient HorizTwoFingerScroll=1
synclient VertScrollDelta=265
synclient CoastingSpeed=2
synclient CoastingFriction=125

# Palm Detection while typing
synclient PalmDetect=1

# Misc
synclient TapAndDragGesture=0

## Dual screen config
# xrandr --output DP-2 --scale 2x2 --fb 3840x3960 --pos 0x0
# xrandr --output eDP-2 --scale 1x1 --pos 0x2160
