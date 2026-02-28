# Ansible collections

The collections can be installed with `ansible-galaxy`

*requirements.yml*

```yaml
---
collections:
  - name: metashock_lab.bind9
    source: git+https://github.com/hek2mgl/ansible_collections.git#/metashock_lab/bind9
    type: git

  - name: metashock_lab.ldap
    source: git+https://github.com/hek2mgl/ansible_collections.git#/metashock_lab/ldap
    type: git

  - name: metashock_lab.kea
    source: git+https://github.com/hek2mgl/ansible_collections.git#/metashock_lab/kea/
    type: git

  - name: metashock_lab.observability
    source: git+https://github.com/hek2mgl/ansible_collections.git#/metashock_lab/observability/
    type: git

  - name: metashock_lab.terminal_toolchain
    source: git+https://github.com/hek2mgl/ansible_collections.git#/metashock_lab/terminal_toolchain/
    type: git
```

```bash
ansible-galaxy collection install -r requirements.yml
```
