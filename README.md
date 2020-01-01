# ansible
Ansible roles for VM configuration,
mostly for Debian VPS.

## Prerequisites
+ Host registered in DNS
+ Known root password
+ sshd listening on port 22
+ python2 installed

## Inventory
+ Add to `inv/master.yml` under appropriate group:
  + VPN_ID is an incremental counter
```
$HOST vpn_id=$VPN_ID
```
+ Add to other groups as needed

## SSH/sudo access
+ `plays/access.yml -k -l $HOST`
+ if NAT, add `-e ansible_port=$NATPORT`

## Setup
+ `site.yml -l $HOST`

## Manual setup
+ Create entry on burp server
