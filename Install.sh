#!/data/data/com.termux/files/usr/bin/bash

# --- Colors ---
G='\033[0;32m' # Green
B='\033[0;34m' # Blue
C='\033[0;36m' # Cyan
R='\033[0;31m' # Red
W='\033[1;37m' # White
NC='\033[0m'    # No Color

clear

# --- Banner ---
echo -e "${C}"
echo "  ███████╗███████╗██████╗ ██╗███████╗████████╗██████╗  ██████╗ "
echo "  ██╔════╝██╔════╝██╔══██╗██║██╔════╝╚══██╔══╝██╔══██╗██╔═══██╗"
echo "  █████╗  ███████╗██║  ██║██║███████╗   ██║   ██████╔╝██║   ██║"
echo "  ██╔══╝  ╚════██║██║  ██║██║╚════██║   ██║   ██╔══██╗██║   ██║"
echo "  ██║     ███████║██████╔╝██║███████║   ██║   ██║  ██║╚██████╔╝"
echo "  ╚═╝     ╚══════╝╚═════╝ ╚═╝╚══════╝   ╚═╝   ╚═╝  ╚═╝ ╚═════╝ "
echo -e "           ${W}Premium Distro Installer | v1.0${NC}\n"

# --- Helper Function ---
status() {
    echo -e "${B}[${W}*${B}]${G} $1...${NC}"
}

# --- Execution ---
status "Updating system repositories"
pkg update -y && pkg upgrade -y > /dev/null 2>&1

status "Installing core dependencies"
for pkg in git proot-distro wget; do
    echo -ne "  ${W}Installing ${C}$pkg${NC}... "
    pkg install $pkg -y > /dev/null 2>&1
    echo -e "${G}DONE${NC}"
done

pkg install termux-x11-nightly x11-repo

status "Fetching FsDistro configuration"
cd ~/
wget -q --show-progress https://github.com/FsBotzTg/FsDistro/releases/download/Version-1/fsdistro.sh

status "Moving to system binaries"
mv fsdistro.sh $PREFIX/etc/proot-distro/
chmod +x $PREFIX/etc/proot-distro/fsdistro.sh
mkdir -p ~/.shortcuts
wget -q --show-progress https://github.com/FsBotzTg/FsDistro/releases/download/Version-1/start-fsdistro.sh
mv start-fsdistro.sh ~/.shortcuts/
touch $PREFIX/bin/fsdistro
echo "proot-distro login --user firos fsdistro" >> $PREFIX/bin/fsdistro
chmod +x $PREFIX/bin/fsdistro

status "Finalizing environment"
pkg update > /dev/null 2>&1

echo -e "\n${G}SUCCESS: ${W}FsDistro is now registered.${NC}"
echo -e "${B}------------------------------------------${NC}"
proot-distro list
echo -e "${B}------------------------------------------${NC}"
pd install fsdistro
echo -e "${B}------------------------------------------${NC}"

rm $PREFIX/var/lib/proot-distro/installed-rootfs/fsdistro/etc/sudoers
mv sudoers $PREFIX/var/lib/proot-distro/installed-rootfs/fsdistro/etc/
mv final.sh $PREFIX/var/lib/proot-distro/installed-rootfs/fsdistro/home/firos/

clear
echo -e "\n${G}SUCCESS: ${W}FsDistro is now Installed.${NC}"
echo -e "${C}"
echo "  ███████╗███████╗██████╗ ██╗███████╗████████╗██████╗  ██████╗ "
echo "  ██╔════╝██╔════╝██╔══██╗██║██╔════╝╚══██╔══╝██╔══██╗██╔═══██╗"
echo "  █████╗  ███████╗██║  ██║██║███████╗   ██║   ██████╔╝██║   ██║"
echo "  ██╔══╝  ╚════██║██║  ██║██║╚════██║   ██║   ██╔══██╗██║   ██║"
echo "  ██║     ███████║██████╔╝██║███████║   ██║   ██║  ██║╚██████╔╝"
echo "  ╚═╝     ╚══════╝╚═════╝ ╚═╝╚══════╝   ╚═╝   ╚═╝  ╚═╝ ╚═════╝ "
echo -e "           ${W}Premium Distro Installer | v1.0${NC}\n"
echo -e "${B}------------------------------------------${NC}"
echo -e "${C}Run the following to login:${W} pd login fsdistro${NC}"
