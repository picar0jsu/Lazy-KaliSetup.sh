# Setup.sh
A simple script to allow for quick deployment of fresh Virtual Machines. Performs the following:
- Configures SMB Shared Folder
- Mounts VMWare Shared Folder (Adds mount script to Crontab)
- Creates Symlink on Desktop to VMWare Shared Folder
- Adds aliases to ZSH
- Adds Powerlevel10k
- Configures Apache Web Server (World-writable)
- Configures Proxychains
- Installs APT Packages
- Installs GEM Packages
- Installs PIP Packages
- Enable SSH Access
- Enable RDP Access

# Usage
Run the script with the following:
```
curl -L https://raw.githubusercontent.com/picar0jsu/Lazy-KaliSetup.sh/main/run.sh | sh
```
