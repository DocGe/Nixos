# Add grub entry on Boot
- https://nixos.wiki/wiki/Bootloader 

- Passage de systemd a Grub, l'entrée n'est pas créée
- Installer efibootmgr
- Rajouter l'entrée avec efibootmgr qui se place en 1ere
```
efibootmgr -c -d /dev/nvme0n -p 1 -L NixOS-boot -l '\EFI\NixOS-boot\grubx64.efi'
reboot
```

# GitHub



