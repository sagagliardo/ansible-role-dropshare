### Ansible role for installing Dropshare

This role looks for server.crt and server.key, so make sure to have one available or generate your own.

Example playbook:
```
- hosts: dropshare
  remote_user: root
  roles:
    - { role: dropshare }

  vars:
    server_hostname: 'myserver.internal'
    pub_key_location: '~/.ssh/dropshare.pub'
    ssl_files:
      - ~/Documents/server.crt
      - ~/Documents/server.key
```
