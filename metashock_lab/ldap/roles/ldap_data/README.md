Ansible Role: metashock_lab.ldap.ldap_data
==========================================

Provision the LDAP database. Currently this means users and groups for authentication.

Requirements
------------

- python3-ldap (Debian, haven't tested other distros)

The requirement gets installed by the role `metashock_lab.ldap.openldap` which is a dependency of this role.

Role Variables
--------------

### `ldap_data_users`

type: list

List of users to be created:

#### Example

```yaml
ldap_data_users:
  - cn: Firstname Lastname
    uid: flastname # defaults to the value of cn (note: in this case, cn must be a valid Unix username)
    sn: Lastname # defaults to the value of cn (note: in this case, cn must be a single word)
```

Dependencies
------------

### Roles

- `metashock_lab.ldap.openldap`
- `community.general.ldap_attrs`
- `community.general.ldap_entry`

### Inventory

- `openldap_basedn`

Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

```yaml
- hosts: servers
  roles:
     - role: metashock_lab.ldap.ldap_data
       ldap_data_groups:
            - cn: groupA
            - cn: groupB
        ldap_data_users:
            - cn: user1
              groups:
                - groupA
                - groupB
```

License
-------

[Apache License 2.0](https://spdx.org/licenses/Apache-2.0.html)

Author Information
------------------

Have fun
