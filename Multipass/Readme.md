```
snap install multipass
```

```
multipass launch 23.10  --name your-vm-name --cloud-init cloud-config.yaml --verbose 
```


```
# cloud-config.yaml
# Set the default user and its password
users:
  - name: your_username
    passwd: your_password
    lock_passwd: false
    sudo: ALL=(ALL) NOPASSWD:ALL
    ssh_authorized_keys:
      - your_public_ssh_key
```

```
multipass mount /var/www/html my-vm:/var/www/html
```

```
multipass exec your-vm-name  -- sudo ufw allow 8080
```

```
multipass shell your-vm-name
netcat -l -p 8080


multipass info your-vm-name | grep "IPv4"
IPv4:           10.148.124.117

echo test | nc -u  10.148.124.117  8080
```
