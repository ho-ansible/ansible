# ansible
Ansible roles for VM configuration,
mostly for Debian VPS.

## Prerequisites
+ IP address
+ default root password
+ sshd listening on port 22
+ name for new host (e.g., `HOST`)

## Inventory
+ Add to `inv/*.yml`: HOST ansible_host=IP
+ Add HOST to groups as needed

## SSH/sudo access
+ `plays/access.yml -k -l HOST`
+ if NAT, add `-e ansible_port=NATPORT`

## Setup
+ `site.yml -l HOST`

## Manual setup
+ Create entry on burp server
+ Add DNS records: A, AAAA, CNAME

## SSH jump host
If the ansible host cannot reach the target host directly, try:
+ `site.yml -l HOST --ssh-common-args '-o ProxyCommand="ssh -W %h:%p -q JUMPHOST"'`
