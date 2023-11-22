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
