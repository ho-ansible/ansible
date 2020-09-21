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
```
$HOST
```
+ Add to groups in `inv/roles.yml` as needed
  + e.g., if part of VPN, add last quartet of VPN IP:
```
$HOST vpn_id=$VPN_ID
```

## SSH/sudo access
+ `plays/access.yml -k -l $HOST`
+ if ssh listening on non-standard port (e.g., NAT), add `-e ansible_port=$SSHPORT`

## Setup
+ `site.yml -l $HOST`

## Manual setup
+ Create entry on burp server
