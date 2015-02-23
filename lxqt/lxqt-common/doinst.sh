config() {
  NEW="$1"
  OLD="$(dirname $NEW)/$(basename $NEW .new)"
  # If there's no config file by that name, mv it over:
  if [ ! -r $OLD ]; then
    mv $NEW $OLD
  elif [ "$(cat $OLD | md5sum)" = "$(cat $NEW | md5sum)" ]; then
    # toss the redundant copy
    rm $NEW
  fi
  # Otherwise, we leave the .new copy for the admin to consider...
}

config etc/xdg/lxqt/windowmanagers.conf.new
config etc/xdg/lxqt/lxqt.conf.new
config etc/xdg/lxqt/session.conf.new
config etc/xdg/pcmanfm-qt/lxqt/settings.conf.new

if [ -x usr/bin/update-desktop-database ]; then
  usr/bin/update-desktop-database usr/share/applications >/dev/null 2>&1
fi

if [ -x usr/bin/update-mime-database ]; then
  usr/bin/update-mime-database usr/share/mime >/dev/null 2>&1
fi

