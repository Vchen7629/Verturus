set -e

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\u001b[31m'
NC='\033[0m'

echo -e "${YELLOW}Preparing to initialize Grafana${NC}"

cd ../vps-configuration
ansible-playbook -i inventory/newuser.yml start-grafana.yml --extra-vars "ansible_become_password={{ New_User_Password }}" --extra-vars "@../vps-configuration/.env.yml"

echo -e "${GREEN}Grafana has been initialized Successfully!${NC}"