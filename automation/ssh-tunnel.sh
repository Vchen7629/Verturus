set -e

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\u001b[31m'
NC='\033[0m'

echo -e "${YELLOW}Installing dependencies for autossh...${NC}"
sudo apt-get install autossh
echo -e "${GREEN}Autossh installed Succesfully...${NC}"

echo -e "${YELLOW}Preparing to set up ssh tunnel...${NC}"
autossh -M 0 -N -o "ServerAliveInterval=15" -o "ServerAliveCountMax=3" -o "ExitOnForwardFailure=yes" -R 127.0.0.1:19565:localhost:19565 vchen7629@143.198.59.57 > autossh.log 2>&1  &

echo -e "${YELLOW}Configuring Socat...${NC}"
cd ../vps-configuration
ansible-playbook -i inventory/newuser.yml playbooks/socat.yml --extra-vars "ansible_become_password={{ New_User_Password }}" --extra-vars "@../vps-configuration/.env.yml"







