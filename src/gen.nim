include "private/platform.nim"

when defined(useFuthark):
    import futhark
    import std/[strutils,strformat,unicode,json]
    const Delimiters = [Rune('_'), Rune('-'), Rune(' ')]
    func toCamelCase(s: string): string =
        let s = s.strip(chars = Whitespace)
        var prev = Rune(0)
        for rune in s.runes:
            if prev in Delimiters:
                result.add rune.toUpper
            elif rune notin Delimiters:
                result.add rune
            prev = rune
    importc:
        path vlcIncludePath
        sysPath sysIncludePath
        "vlc/libvlc.h"
        "vlc/libvlc_renderer_discoverer.h"
        "vlc/libvlc_media.h"
        "vlc/libvlc_media_player.h"
        "vlc/libvlc_media_list.h"
        "vlc/libvlc_media_list_player.h"
        "vlc/libvlc_media_library.h"
        "vlc/libvlc_media_discoverer.h"
        "vlc/libvlc_events.h"
        "vlc/libvlc_dialog.h"
        "vlc/libvlc_vlm.h"
        "vlc/deprecated.h"
        outputPath "src/libvlc-new.nim"
        renameCallback proc(name: string, kind: string, partof = ""): string =
            result = name
            case kind:
            of "proc":
                if name.startsWith("libvlc_"):
                    let verb = name.split("_")[1]
                    if verb in @["new", "release", "retain", "wait"]:
                        return name.replace("libvlc_", "instance_")
                    return name.replace("libvlc_","")
                #if name.endsWith("_retain"): return "retain"
                #if name.endsWith("_release"): return "release"
            else:
                return name.replace("libvlc_","")
        addOpirCallback proc(given: JsonNode): JsonNode {.closure.} =
            result = % []
            for i in given.items:
                var o = i.copy()
                case i["kind"].getStr:
                of "enum":
                    o["fields"] = % []
                    var prefix = ""
                    if i.hasKey("name"):
                        prefix = i["name"].getStr.replace("enum_","")
                        if prefix.endsWith("_t"):
                            prefix = prefix[0..^2]
                    for f in i["fields"]:
                        let value = f["value"].getStr
                        var name = f["name"].getStr
                        name = name.replace(prefix,"").replace("libvlc_","")
                        let field = %* {"name": name, "value": value}
                        o["fields"].add(field)
                        #echo $field
                #of "typedef":
                #    let ty = i["type"]
                #    if ty["kind"].getStr == "alias" and ty["value"].getStr.startsWith("enum_"):
                #        var name = i["name"].getStr
                #        if name.endsWith("_t"):
                #            name = name[0..^3]
                #        name = name.replace("libvlc_","").toCamelCase().capitalizeAscii()
                #        o["name"] = % name
                #        echo name
                result.add(o)
