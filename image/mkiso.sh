#!/bin/sh

# From: http://www.tummy.com/blogs/2008/09/21/using-freedos-cd-for-bios-updates/

mkisofs -o ../freedos_custom.iso -q -l -N \
   -boot-info-table -iso-level 4 -no-emul-boot \
   -b isolinux/isolinux.bin \
   -publisher "FreeDOS - www.freedos.org" \
   -A "FreeDOS 1.0" -V FDOS_10 -v .
