#!/usr/bin/env bash

set -e

mkdir -p root
 
# Copy the relevant files over.
cp -v build/xram limine.cfg limine/limine-bios.sys \
      limine/limine-bios-cd.bin limine/limine-uefi-cd.bin root/
 
# Create the EFI boot tree and copy Limine's EFI executables over.
mkdir -p root/EFI/BOOT
cp -v limine/BOOTX64.EFI root/EFI/BOOT/
cp -v limine/BOOTIA32.EFI root/EFI/BOOT/
 
# Create the bootable ISO.
xorriso -as mkisofs -b limine-bios-cd.bin \
        -no-emul-boot -boot-load-size 4 -boot-info-table \
        --efi-boot limine-uefi-cd.bin \
        -efi-boot-part --efi-boot-image --protective-msdos-label \
        root -o xram.iso
 
# Install Limine stage 1 and 2 for legacy BIOS boot.
./limine/limine bios-install xram.iso
