rule NionSpy
{

meta:
author="McAfee"
reference = "https://securingtomorrow.mcafee.com/mcafee-labs/taking-a-close-look-at-data-stealing-nionspy-file-infector/"
description = "Triggers on old and new variants of W32/NionSpy file infector"

strings:

$variant2015_infmarker = "aCfG92KXpcSo4Y94BnUrFmnNk27EhW6CqP5EnT"
$variant2013_infmarker = "ad6af8bd5835d19cc7fdc4c62fdf02a1"
$variant2013_string = "%s?cstorage=shell&comp=%s"

condition:

uint16(0) == 0x5A4D and uint32(uint32(0x3C)) == 0x00004550 and 1 of ($variant*)

}
