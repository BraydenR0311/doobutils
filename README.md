# doobutils

Like Gnu coreutils but for me. Just some convenience scripts to make life easier.

Some make use of dmenu, which is helpful for running commands in a lightweight menu application.

Some also use dunstify, a command to send dunst notifications.

## To install
```
chmod u+x ./install.sh
./install.sh
```

## Utilities



### bt
Way for me to connect or disconnect to my bluetooth devices. Uses python to run subprocesses and parse text.

### wp
Apply wallpaper to a directory by selecting it in dmenu.
![image](https://github.com/user-attachments/assets/4179ce97-8f32-4b07-aa26-93b8c215bf4b)
### change[bright|vol]
Convenience script to change brightness and volume while sending a notification.

I bind this to my volume and brightness keys in .xbindkeys

### bat.sh
Run by dwm's slstatus every couple seconds to display battery status. Updates icon and sends notification if battery is running low

