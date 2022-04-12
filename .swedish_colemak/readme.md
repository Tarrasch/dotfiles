## What makes this "Swedish colemak"?

It simply squeezes in `åäö` comfortably on the **home row** through `AltGr`.
It tries in no way to edit anything else on colemak, so it's still
optimized for English and not Swedish.

Additionally I've squeezed a lot of other fancy stuff through `AltGr`,
which are independent of the language.

## Installation (most linux systems)

Paste this in your terminal

TODO: use the dated "us.xkb" file????

    GISTDIR='https://gist.githubusercontent.com/Tarrasch/1293692/raw'
    sudo cp /usr/share/X11/xkb/symbols/us{,-backup}
    curl "$GISTDIR/us.xkb" | sudo tee /usr/share/X11/xkb/symbols/us > /dev/null
    cd /var/lib/xkb/
    sudo rm *.xkm

Now log in and out and select the `English (Colemak)` layout from the GUI menus.

## About this layout:

    AltGr+a --> ä
    AltGr+l --> å
    AltGr+ö --> ö

where a, l, ö are the physical positions on qwerty.

Note it's just a movedown of the colemak keys except for `å` since it's
a vowel and should not be placed at the same key as the non-vowel `r`!
(Think of words like *råtta* and *år*)

Also I've put arrow keys on home row and put esc there as well for vim
users. Furthermore I've put home/end and pgup/pgdn on the buttons
where the long fingers can reach comfortably while your thumb is
holding down AltGr. I srongly recommend these tricks to everyone, even
those not wanting a Swedish layout or are using QWERTY.

## Feedback

I would love to discuss this, feel free to comment on this gist!

## Typical errors

I just noticed that to get the arrow keys to also work. You just need to "play around" choosing another layout then switching back to the colemak one.

I found that the issue might be fixed by doing

    cd /var/lib/xkb/
    sudo rm *.xkm

and then just reselecting your keyboard layout (hint taken from [here](https://help.ubuntu.com/community/Custom%20keyboard%20layout%20definitions))

## Debugging

There's been a recent article
[here](https://medium.com/@damko/a-simple-humble-but-comprehensive-guide-to-xkb-for-linux-6f1ad5e13450)
(it's from 2016, I wrote this in 2019). Not everything applies but it's a
worthwhile refresher since it's so recent and written in a humble way.

To run a manually updated file: 

    sudo cp us-2019-06-03.xkb /usr/share/X11/xkb/symbols/us && setxkbmap -layout us -variant colemak
    
I also tried to get the AltGr to be more "deep down" so more programs respect my arrow keys (see commits 1-2 years ago). To work on that one can run:   

    sudo cp us-2019-06-03.xkb /usr/share/X11/xkb/symbols/us && xkbcomp keymap.xkb :0

`xkbcomp` seems to both "reload everything" and compile and use `keymap.xkb`.

## Note to self when pushing to gist

I need a personal access token. I just create one for each push as I push so seldom: https://github.com/settings/tokens, I need that instead of entering my pw as stated in GitHub docs.

[instructions]: http://ubuntuforums.org/showthread.php?t=18876
