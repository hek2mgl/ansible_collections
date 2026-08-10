# Testing collections

## Install test requirements

### Python requirements

```bash
pip install ansible-core molecule molecule-plugins[docker]
```

### OS requirements

Docker needs to be installed:

```bash
#!/usr/bin/env bash
sudo apt-get update && apt-get install docker.io
```

## Create a new collection

```bash
#!/usr/bin/env bash
collection_namespace="metashock_lab"
collection_name="demo"
collection_fqdn="${collection_namespace}.${collection_name}"

ansible-galaxy collection init "${collection_fqdn}"
```

## Create a molecule scenario

```bash
#!/usr/bin/env bash
cd "${collection_namespace}/${collection_name}"
mkdir -p ext && cd ext
molecule init scenario --driver-name docker
```

## Links

- [molecule configuration](https://ansible.readthedocs.io/projects/molecule/configuration/)
