## in this scenario Ansible will Connect to You Desierd Server by SSH PASS and User that You Provided in ./hosts and install Docekr 

## Download Dockerfile Deb File 
```
mkdir ./file/docker && cd file/docker 
wget https://download.docker.com/linux/ubuntu/dists/focal/pool/stable/amd64/containerd.io_1.6.4-1_amd64.deb
wget https://download.docker.com/linux/ubuntu/dists/focal/pool/stable/amd64/docker-ce-cli_24.0.4-1~ubuntu.20.04~focal_amd64.deb
wget https://download.docker.com/linux/ubuntu/dists/focal/pool/stable/amd64/docker-ce_24.0.2-1~ubuntu.20.04~focal_amd64.deb
wget https://download.docker.com/linux/ubuntu/dists/focal/pool/stable/amd64/docker-compose-plugin_2.5.0~ubuntu-focal_amd64.deb
wget https://download.docker.com/linux/ubuntu/dists/focal/pool/stable/amd64/docker-scan-plugin_0.9.0~ubuntu-focal_amd64.deb
```

## Run the Playbook 
```
 ansible-playbook  -i hosts  docker-install.yml
```

