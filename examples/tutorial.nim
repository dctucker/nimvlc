import std/os
import nimvlc

proc main() =
    # Load the VLC engine
    var inst = newInstance()

    # Create a new item
    #m = inst.libvlc_media_new_location("file:///home/casey/Videos/iCloud/IMG_1716.MOV")
    var m = inst.newMedia("file:///home/casey/Videos/iCloud/IMG_1716.MOV")
    #m = inst.newMediaPath("/path/to/test.mov")

    # Create a media player playing environement
    var mp = m.newMediaPlayer()

    when false:
        # This is a non working code that show how to hooks into a window,
        mp.setXwindow (mp, xid)    # if we have a window around
        mp.setHwnd (mp, hwnd)      # or on windows
        mp.setNsObject (mp, view)  # or on mac os

    # play the media_player
    mp.play()

    os.sleep(10*1000) # Let it play a bit

    # Stop playing
    mp.stop()

    # free the media_player as variable goes out of scope

when isMainModule:
    main()
