# Package

version       = "0.1.0"
author        = "nimvlc"
description   = "Nim wrapper for libvlc"
license       = "MIT"
srcDir        = "src"

# Dependencies

requires "nim >= 1.6.6" # or lower maybe

# Tasks

include "src/private/platform.nim"

task examples, "examples":
    exec "nim c -o:bin/tutorial examples/tutorial.nim"

task copyIncludes, "copyIncludes":
    rmDir("include")
    mkDir("include")
    const srcdir = vlcLibPath & "/../include"
    cpDir(srcdir & "/vlc", "include/vlc")

task post, "post-processing":
    var source = readFile("src/libvlc-new.nim")
    source = source.replace("{.size: sizeof(cuint).} = enum", "{.size: sizeof(cuint), pure.} = enum")
    source = source.replace("{.size: sizeof(cint).} = enum",   "{.size: sizeof(cint), pure.} = enum")
    source = source.replace("_enumval "," ")
    writeFile("src/libvlc.nim", source)
    rmFile("src/libvlc-new.nim")

task futhark, "futhark":
    const arg = futharkCompilerArgs($getCurrentDir())
    exec "nim c " & arg & " -c -d:useFuthark -d:futharkRebuild -d:nodeclguards src/gen.nim"
    postTask()

