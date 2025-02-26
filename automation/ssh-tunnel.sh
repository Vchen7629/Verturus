set -e

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\u001b[31m'
NC='\033[0m'

echo -e "${YELLOW}Installing dependencies for autossh...${NC}"
sudo apt-get autossh
echo -e "${GREEN}Autossh installed Succesfully...${NC}"

echo -e "${YELLOW}Preparing to set up ssh tunnel...${NC}"
ssh -R 127.0.0.1:9090:localhost:9090 vchen7629@


