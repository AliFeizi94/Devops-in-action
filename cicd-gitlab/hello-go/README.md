# Runner (192.168.4.50)
```
ssh-keygen 

cat ~/.ssh/id_rsa |  base64 -w0
# Copy the Output in to Gitlab ci Variable $SSH_PRIVATE_KEY
```



# Destination Server
------------------------
#### ssh config Destination (192.168.4.210)  

#### Copy Server ***Runner's Public key*** into ~/.ssh/authorized_keys


```
PermitRootLogin yes
PubkeyAuthentication yes
AuthorizedKeysFile      .ssh/authorized_keys 

```

