Dropshare
=========

An Ansible role for installing Dropshare

Requirements
------------

This role looks for server.crt and server.key, so make sure to have one available or generate your own. It is also based around Centos 7 at the moment, with support for more server types coming soon.

Role Variables
--------------

server_hostname -- The hostname of your server
pub_key_location -- Where Ansible can find the pub key for Dropshare, to add to authorized_keys for the dropshare user
ssl_files -- The SSL crt and key files. Add them similar to the example playbook below, as an array.

Dependencies
------------

Not dependent on other roles.

Example Playbook
----------------

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

License
-------

BSD

Author Information
------------------

Stephen Gagliardo
