set -e

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\u001b[31m'
NC='\033[0m'

echo -e "${YELLOW}Preparing to configure Grafana${NC}"
cd ../configure-grafana/playbooks

echo -e "${YELLOW} Preparing to Creating Service Account...${NC}"
ansible-playbook -i ../inventory/hosts create-service-account.yml
echo -e "${GREEN}Successfully created a service account${NC}"

echo -e "${YELLOW}Preparing to add prometheus data source to grafana${NC}"
ansible-playbook -i ../inventory/hosts add-prometheus-datasource.yml
echo -e "${GREEN}Successfully added Minecraft prometheus data to grafana!${NC}"

