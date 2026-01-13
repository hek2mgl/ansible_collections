metashock_lab.bind9.bind9
=========================

Installation and basic configuration of the bind9 dns service.

Basic configuration means all configuration except of DNS zones. DNS zones are managed by the role `metashock_lab.bind9.dns_zone`.

Requirements
------------

```bash
pip install ansible-core
```

Role Variables
--------------

### `bind9_options_forwarders`

- [Bind9 manual](https://bind9.readthedocs.io/en/latest/reference.html#namedconf-statement-forwarders)

#### Default value

`<empty list>` (Forwarding is disabled)

---

### `bind9_options_directory`

- [Bind9 manual](https://bind9.readthedocs.io/en/latest/reference.html#namedconf-statement-directory)

#### Default value

`"/var/cache/bind"`

---

### `bind9_options_dnssec_validation`

- [Bind9 manual](https://bind9.readthedocs.io/en/latest/reference.html#namedconf-statement-dnssec-validation)

#### Default value

`"auto"`

---

### `bind9_statistics_channels`

- [Bind9 manual](bind9.readthedocs.io/en/latest/reference.html#statistics-channels-block-grammar)

#### Default value

`<empty list>` (No statistics will be exposed) 

#### Example

Expose statistics for `bind_exporter` at `127.0.0.1:8053`

```yaml
bind9_statistics_cannels:
 - listen-address: 127.0.0.1
   listen-port: 8053
   allow:
     - localhost
```

Dependencies
------------

No galaxy dependencies.

Example Playbook
----------------

```yaml
- hosts: dns
  roles:
     - metashock_lab.bind9.bind9
```

License
-------

Apache

Author Information
------------------

Have fun!
