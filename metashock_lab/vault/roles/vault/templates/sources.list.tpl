deb [arch={{ dpkg_architecture }} signed-by={{ vault_apt_gpg_key_filename }} ] {{ vault_apt_releases_url }} {{ ansible_lsb.codename }} main
