set -e

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\u001b[31m'
NC='\033[0m'

echo -e "${YELLOW}Installing dependencies for autossh...${NC}"
sudo apt-get install autossh
echo -e "${GREEN}Autossh installed Succesfully...${NC}"

echo -e "${YELLOW}Preparing to set up ssh tunnel...${NC}"
autossh -M 0 -N -R 9091:localhost:9090 -N vchen7629@164.92.97.22 &

echo -e "${YELLOW}Configuring Socat...${NC}"
cd ../vps-configuration
ansible-playbook -i inventory/newuser.yml playbooks/socat.yml --extra-vars "ansible_become_password={{ New_User_Password }}" --extra-vars "@../vps-configuration/.env.yml"



