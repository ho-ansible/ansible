# Prompt:
#   If not pipe(?f), then print filename(%f), endif (.)
#   If first prompt in new input file(?n),
#     If multiple input files(?m), then
#       print " (file " file index (%i) " of " total # files(%m) ")"
#     endif(.)
#   endif(.)
#   If at EOF(?e), then
#     If current file is not last(?x), then
#       print " - Next: " next file(%x)
#     endif(.)
#   Else(:),
#     If line # of bottom line of screen is known(?lb), then
#       print " line " current line #(%lb)
#       If line number of last line is known(?L), then
#         print "/" last line #(%L)
#       endif(.)
#     endif(.)
#     print " byte " current byte # (%bb)
#     If size of current file is known(?s), thn
#       print "/" tot. size of whole file(%s)
#     endif(.)
#     If percent into file of bottom line is known(?pb), then
#       print " " that percent(%pb) and "%"
#     endif(.)
#   endif(.)
#   remove trailing spaces(%t)
#   print " "
LESS='-d -e -F -i -M -q -R -s -W -X -j3 -PM?f%f.?n?m (file %i of %m)..?e?x Next %x.:?lb line %lb?L/%L.. byte %bb?B/%B.?pb %pb\%..%t .'

# print binary chars as backslash underlined capital hexadecimal
LESSBINFMT='*u\%X'

LESSOPEN="|/usr/bin/lesspipe %s"

export LESS LESSBINFMT LESSOPEN
