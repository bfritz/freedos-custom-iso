# Build Custom [FreeDOS](http://www.freedos.org/) Boot ISO

Modify FreeDOS ISO image to run DOS .exe files like BIOS updates, HDD diagnostics, etc.

## Instructions

Grab the repo:

```sh
git clone https://github.com/bfritz/freedos-custom-iso.git
cd freedos-custom-iso
```

Download and prepare the base ISO image:

```sh
curl -O http://www.ibiblio.org/pub/micro/pc-stuff/freedos/files/distributions/1.0/fdbasecd.iso
sudo mount -o ro fdbasecd.iso /mnt

rsync -avSP /mnt/* image/
sudo umount /mnt

# patch to exit the installer early
patch -p0 < setup.patch
```

Drop files into `image/extras/`.  Best to pre-extract zip files.

Recreate the ISO:

```sh
# sudo pacman -S mkisolinux
(cd image; sudo ./mkiso.sh)
```

Burn the ISO, for example with `wodim`:

```sh
# sudo pacman -S cdrkit
wodim -v -data -eject freedos_custom.iso
```

Test with:

```sh
# sudo pacman -S qemu
qemu-system-i386 -cdrom freedos_custom.iso
```

## Credit

Based on Sean Reifschneider's [article on tummy.com](http://www.tummy.com/blogs/2008/09/21/using-freedos-cd-for-bios-updates/).
