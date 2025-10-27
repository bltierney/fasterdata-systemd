# My Sysctl Tuning Tools

These scripts install and manage a custom sysctl drop-in config named
`fastdata.conf`, placed under `/etc/sysctl.d/`.

## Why not modify /etc/sysctl.conf?
Editing the main file invites merge conflicts during upgrades.
Drop-ins keep your custom settings clean, self-contained, and versionable.

## Installation & Usage

Generate sysctl.conf settings based on fastdata recomendations
```
./fasterdata_sysctl.py
```

Validate your tunings:
```sh
./validate.sh fasterdata.conf.template
```

Install the tuning file:
```sh
sudo ./init.sh
```

Apply immediately:
```sh
sudo ./apply.sh
```

## Maintenance

Compare your desired values with the running kernel:
```sh
./diff.sh
```

Disable tunings temporarily:
```sh
sudo ./disable.sh
```

Edit `/etc/sysctl.d/fasterdata.conf`, then:
```sh
sudo ./apply.sh
```

## Notes
• Reloading uses `sysctl --system` for full drop-in activation  
• Only keys in the config file are checked for diffs  
• Tested on modern Ubuntu & Debian-based distros
