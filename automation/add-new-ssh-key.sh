set -e

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\u001b[31m'
NC='\033[0m'

echo -e "${YELLOW}Bringing docker containers down...${NC}"
cd ../vps-configuration
ansible-playbook -i inventory/newuser.yml start-grafana.yml --extra-vars "ansible_become_password={{ New_User_Password }}" --extra-vars "@../vps-configuration/.env.yml"
echo -e "${GREEN}Docker Containers Successfully brought down${NC}"

echo -e "${YELLOW}Preparing to rebuild droplet...${NC}"
cd ../add-new-ssh-key

terraform init 
terraform apply -auto-approve
echo -e "${GREEN}Droplet Successfully rebuilt with new ssh key added!${NC}"
