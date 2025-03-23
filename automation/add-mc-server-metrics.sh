set -e

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\u001b[31m'
NC='\033[0m'

cd ../configure-grafana/playbooks

echo -e "${YELLOW}Creating a Folder and importing dashboard for minecraft server metrics...${NC}"
ansible-playbook -i ../inventory/hosts add-mc-metrics.yml
echo -e "${GREEN}Successfully created folder and dashboard!${NC}"