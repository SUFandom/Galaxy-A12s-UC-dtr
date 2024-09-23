#!/system/bin/sh


# Credits to TDD788 for idea


PS1=" TWRP_MZMO | a12s [\w] : "

splash() {
    cat /system/twrpinfo/art.txt
}

space() {
    # Dead space
    echo ""
}

banner() {
    space
    echo " TWRP FOR GALAXY A12s "
    echo " $(cat /system/twrp_version.note) "
    space
}

splash
banner &

