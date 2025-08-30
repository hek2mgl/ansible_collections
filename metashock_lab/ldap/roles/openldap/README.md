Ansible Role: metashock_lab.ldap.openldap
=========================================

A brief description of the role goes here.

Requirements
------------

Any pre-requisites that may not be covered by Ansible itself or the role should be mentioned here. For instance, if the role uses the EC2 module, it may be a good idea to mention in this section that the boto package is required.

Role Variables
--------------

### `openldap_admin_password`

The admin password (`olcRootPW`) for `cn=admin,dc=ORGNAME,dc=TLD`

The password must be hashed. Use `slappasswd` to generate a hashed password, like this:

```console
$ slappasswd 
New password: 
Re-enter new password: 
{SSHA}5KNjoFnSCAZUbfv0AQs1Yam4KaM2y8VX
```

### `openldap_base_dn`

required
type: string

Base dn for the organization.

Example:

```yaml
openldap_base_dn: "dc=metashock,dc=net"
```

### `openldap_domain`

required
type: string

Base domain for the organization.

For example:

```yaml
openldap_domain: "metashock.net"
```

### `openldap_organization_name`

required Orgnization name

Dependencies
------------

A list of other roles hosted on Galaxy should go here, plus any details in regards to parameters that may need to be set for other roles, or variables that are used from other roles.

Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

    - hosts: servers
      roles:
         - { role: username.rolename, x: 42 }

License
-------

[Apache License 2.0](https://spdx.org/licenses/Apache-2.0.html)

Author Information
------------------

Have fun
