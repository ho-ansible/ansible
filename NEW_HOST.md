# Setting up a new host

## Prerequisites
+ IP address
+ default root password
+ sshd listening on port 22
+ name for new host (e.g., `HOST`)

## Inventory
+ Add to `inv/_master.yml`: HOST ansible_host=IP
+ Add HOST to `inv/_roles.yml` as needed

## SSH/sudo access
+ ansible-playbook -k -l HOST plays/access.yml
+ if NAT, add `-e ansible_port=NATPORT`

## Setup
+ ansible-playbook -l HOST plays/main.yml

## Manual setup
+ Create entry on burp server
+ Manually set CNAME in DNS
