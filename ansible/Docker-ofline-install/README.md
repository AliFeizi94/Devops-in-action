## in this scenario Ansible will Connect to You Desierd Server by SSH PASS and User that You Provided in ./hosts and install Docekr 

## Download Dockerfile Deb File 
```
mkdir ./file/docker && cd file/docker 
wget "https://download.docker.com/linux/ubuntu/dists/jammy/pool/stable/amd64/containerd.io_1.6.9-1_amd64.deb"
wget "https://download.docker.com/linux/ubuntu/dists/jammy/pool/stable/amd64/docker-ce-cli_23.0.1-1~ubuntu.22.04~jammy_amd64.deb"
wget "https://download.docker.com/linux/ubuntu/dists/jammy/pool/stable/amd64/docker-buildx-plugin_0.10.2-1~ubuntu.22.04~jammy_amd64.deb"
wget "https://download.docker.com/linux/ubuntu/dists/jammy/pool/stable/amd64/docker-compose-plugin_2.10.2~ubuntu-jammy_amd64.deb"
wget "https://download.docker.com/linux/ubuntu/dists/jammy/pool/stable/amd64/docker-scan-plugin_0.23.0~ubuntu-jammy_amd64.deb" 
wget "https://download.docker.com/linux/ubuntu/dists/jammy/pool/stable/amd64/docker-ce_23.0.1-1~ubuntu.22.04~jammy_amd64.deb"
```

## Run the Playbook 
```
 ansible-playbook  -i hosts  docker-install.yml
```

