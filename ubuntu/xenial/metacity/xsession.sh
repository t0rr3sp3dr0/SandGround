#!/bin/bash

/usr/lib/gnome-session/gnome-session-binary --session=ubuntu &

for indicator in /usr/lib/x86_64-linux-gnu/indicator-*; do
  basename=`basename ${indicator}`
  dirname=`dirname ${indicator}`
  service=${dirname}/${basename}/${basename}-service
  ${service} &
done

nautilus &
metacity
