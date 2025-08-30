Ansible Collection: metashock_lab.ldap
======================================

This collections has been created to deploy and configure LDAP based authentiation in a network of Linux servers.

Features include:

- Deployment and configuration of an LDAP service on bare metal (or vms).
- Provisioning of LDAP resources, such as users, groups, etc.
- Configuration of pam_ldap on servers to support LDAP based logins

Roles
-----

- [metashock_lab.ldap.openldap](roles/openldap/README.md)
- [metashock_lab.ldap.ldap_data](roles/ldap_data/README.md)
