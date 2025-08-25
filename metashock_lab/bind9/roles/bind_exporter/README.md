metashock_lab.bind9.bind_exporter
=========

Installs and configures [bind_exporter](https://github.com/prometheus-community/bind_exporter)

So far, the installation supports Linux amd64/arm64 targets. Support for other platforms can be addded.

Requirements
------------

- ansible-core

Role Variables
--------------

| name | description | default value | possible values
|--- |--- |--- |---
| `bind_exporter_download_url_tpl` | Template for the url from where bind exporter should be downloaded | `"https://github.com/prometheus-community/bind_exporter/releases/download/v{{ bind_exporter_version }}/bind_exporter-{{ bind_exporter_version }}."` |
| `bind_exporter_version` | version of bind_exporter | 0.8.0 |
| `bind_exporter_os_type` | type of the target os || linux
| `bind_exporter_os_arch` | arch of the target os || arm64, amd64
| `bind_exporter_os_username` | OS username for the service | bind_exporter ||
| `bind_exporter_listen_address` | Listen address for bind exporter | ":9119" ||
| `bind_exporter_bind9_status_address` | Url of the bind9 status endpoint | "http://localhost:8053" ||

No `host_vars` or `group_vars` are needed to be set.

Dependencies
------------

No galaxy dependencies.

Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

```yaml
---
- hosts: dns
  roles:
    - metashock_lab.bind9.bind_exporter
```

License
-------

Apache

Author Information
------------------

Have fun
