#!/bin/bash
# Adds:
#  - Repositories for "CEPH luminous for Debian 9/Proxmox 5"
#  - Repositories for "No subscription for Proxmox"
#  - Repositories for "HPE SDR - Software Delivery Repository"
#  - Keys for above repositories

apt update
apt install curl ca-certificates lsb-core mc

# Add repositories
echo "# CEPH luminous for Debian 9/Proxmox 5" > /etc/apt/sources.list.d/ceph.list
echo "deb http://download.proxmox.com/debian/ceph-luminous stretch main" >> /etc/apt/sources.list.d/ceph.list

echo "# No subscription for Proxmox" > /etc/apt/sources.list.d/pve-enterprise.list 
echo "deb http://download.proxmox.com/debian stretch pve-no-subscription" >> /etc/apt/sources.list.d/pve-enterprise.list 

echo "# HPE SDR - Software Delivery Repository" > /etc/apt/sources.list.d/hp-sdr.list
echo "# https://downloads.linux.hpe.com/" >> /etc/apt/sources.list.d/hp-sdr.list
echo "# https://downloads.linux.hpe.com/SDR/add_repo.sh" >> /etc/apt/sources.list.d/hp-sdr.list
echo "# " >> /etc/apt/sources.list.d/hp-sdr.list
echo "# Project Repositories" >> /etc/apt/sources.list.d/hp-sdr.list
echo "# mcp   - Management Component Pack for ProLiant - Agent software for Ubuntu, Oracle and community distros" >> /etc/apt/sources.list.d/hp-sdr.list
echo "# fwpp  - Firmware Pack for ProLiant             - Firmware updates for ProLiant Servers (auth required)" >> /etc/apt/sources.list.d/hp-sdr.list
echo "# sut   - HP Smart Update Tools                  - HPE OneView utilities for firwmare/driver updates" >> /etc/apt/sources.list.d/hp-sdr.list
echo "# lsrrb - Linux Software RAID Redundant Boot     - Tools to manage redundant boot volumes on ProLiant Servers" >> /etc/apt/sources.list.d/hp-sdr.list
echo "# ip    - Intelligent Provisioning               - Intelligent Provisioning update packages" >> /etc/apt/sources.list.d/hp-sdr.list
echo "# stk   - HPE ProLiant Scripting Toolkit         - Useful commands for scripting/automating ProLiant hardware" >> /etc/apt/sources.list.d/hp-sdr.list


echo "deb http://downloads.linux.hpe.com/SDR/repo/mcp jessie/current non-free" >> /etc/apt/sources.list.d/hp-sdr.list

# Add keys
# --------
# HPE SDR PGP key
curl http://downloads.linux.hpe.com/SDR/hpPublicKey1024.pub | apt-key add -
curl http://downloads.linux.hpe.com/SDR/hpPublicKey2048.pub | apt-key add -
curl http://downloads.linux.hpe.com/SDR/hpPublicKey2048_key1.pub | apt-key add -
curl http://downloads.linux.hpe.com/SDR/hpePublicKey2048_key1.pub | apt-key add -

# Proxmox pgp key
curl http://download.proxmox.com/debian/key.asc | apt-key add -

apt update


# apt install hpacucli hponcfg hp-health
# hp-snmp-agents hpssa
