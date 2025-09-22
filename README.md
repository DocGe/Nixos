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
```
cd /etc/nixos
git init

\# La première fois
git config user.name 'username'
git config user.email 'mail'

git commit -m "message"

git remote add master https://USER:TOKEN@github.com/USER/REPO.git

git push master master

