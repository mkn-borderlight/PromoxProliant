# PromoxProliant
Scrip that will prepare a HPE ProLiant server with HPE addons.

<h3>Sudoers</h3>

http://www.debiantutorials.com/adding-a-sudoer-to-use-sudo-on-debian/


<h3>proxmox-proliant.sh</h3>

- Add Proxmox no subscription repository and removes the subscription repository
- Adds HPE "Software Delivery Repository"
- Adds PGP keys to above repositories


<h3>debian-lang.sh</h3>

------------------------------------------------
<pr>#!/bin/bash

# Configure timezone and locale to Swedish settings
echo "Europe/Stockholm" > /etc/timezone && \
    dpkg-reconfigure -f noninteractive tzdata && \
    sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
    sed -i -e 's/# sv_SE.UTF-8 UTF-8/sv_SE.UTF-8 UTF-8/' /etc/locale.gen && \
    echo 'LANG="en_US.UTF-8"'>/etc/default/locale && \
    dpkg-reconfigure --frontend=noninteractive locales && \
    update-locale LANG=en_US.UTF-8</pre>

------------------------------------------------

Define TZ and language settings.
