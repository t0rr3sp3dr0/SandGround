#!/bin/bash

if [ `whoami` != 'user' ]
then
    cp $0 /home/user/.xsession
    su - user -c "bash /home/user/.xsession"
else
    export container=docker
    export DEBIAN_FRONTEND=noninteractive
    export DISPLAY=:11
    export LANG=C.UTF-8

    gsettings set com.canonical.Unity.Launcher favorites "['application://ubiquity.desktop', 'application://org.gnome.Nautilus.desktop', 'application://firefox.desktop', 'application://gnome-terminal.desktop', 'unity://running-apps', 'unity://expo-icon', 'unity://devices']"
	gsettings set org.compiz.core:/org/compiz/profiles/unity/plugins/core/ hsize 2
	gsettings set org.compiz.core:/org/compiz/profiles/unity/plugins/core/ vsize 2
	gsettings set org.gnome.desktop.default-applications.terminal exec 'gnome-terminal'
	gsettings set org.gnome.desktop.screensaver lock-enabled false
    gsettings set org.gnome.desktop.session idle-delay 0

    timeout 10 firefox --headless

    for CRT in /usr/share/ca-certificates/extra/*.crt
    do
        for DB in $(find $HOME -name cert8.db)
        do
            certutil -A -n $(basename $CRT) -t 'CT,C,c' -i $CRT -d dbm:$(dirname $DB)
        done

        for DB in $(find $HOME -name cert9.db)
        do
            certutil -A -n $(basename $CRT) -t 'CT,C,c' -i $CRT -d sql:$(dirname $DB)
        done
    done
    
    echo 'user_pref("browser.startup.homepage", "");' >> $HOME/.mozilla/firefox/*.default/prefs.js
    echo 'user_pref("browser.startup.homepage_override.mstone", "ignore");' >> $HOME/.mozilla/firefox/*.default/prefs.js
    echo 'user_pref("startup.homepage_welcome_url.additional", "about:blank");' >> $HOME/.mozilla/firefox/*.default/prefs.js
    echo 'user_pref("browser.tabs.remote.autostart", false);' >> $HOME/.mozilla/firefox/*.default/prefs.js
    
    cat << EOF > $(echo $HOME/.mozilla/firefox/*.default)/cert_override.txt
# PSM Certificate Override Settings file
# This is a generated file!  Do not edit.
EOF

    apt-get remove libnss3-tools
    apt-get -y clean
    apt-get -y autoremove
    rm -fRv /var/lib/apt/lists/*

    /usr/lib/gnome-session/gnome-session-binary --session=ubuntu &

    for INDICATOR in /usr/lib/x86_64-linux-gnu/indicator-*; do
        BASENAME=`basename $INDICATOR`
        DIRNAME=`dirname $INDICATOR`
        $DIRNAME/$BASENAME/$BASENAME-service &
    done

    sleep 15

    cat << EOF > $HOME/Desktop/Unity.desktop
[Desktop Entry]
Name=Unity
Exec=bash -c 'rm $HOME/Desktop/Unity.desktop && killall -9 unity && sleep 1 && unity'
Terminal=false
Type=Application
EOF
    chmod +x $HOME/Desktop/Unity.desktop

    unity
fi
