# Ansible Collection - metashock_lab.kea

Install and manage the Kea DHCP server in the metashock lab

## Config

### dhcp4 main config (currently includes subnets)

*group_vars/kea/dhcp4.yml*

```console
---
kea_dhcp_option_domain_name_servers: 10.10.0.8
kea_pxe_option_next_server: 10.10.0.2

kea_dhcp4_config:
  subnets:
    - network_address: 10.10.1.0/24
      subnet_id: 1
      pools:
        - 10.10.1.1-10.10.1.127
      option-data:
        - name: routers
          data: 10.10.1.1
        - name: domain-name
          data: my.domain.com
        - name: domain-search
          data: my.domain.com
        - name: domain-name-servers
          data: "{{ kea_dhcp_option_domain_name_servers }}"
      next-server: "{{ kea_pxe_option_next_server }}"
      reservations:
        - hostname: host1
          hw-address: "de:ad:be:ef:00:01"
          ip-address: 10.10.1.200
        - hostname: host2
          hw-address: "de:ad:be:ef:00:01"
          ip-address: 10.10.1.201

# Global DHCP4 option defs (needed for PXE boot)
kea_dhcp4_option_def:
  - name: "PXEDiscoveryControl"
    code: 6
    space: "vendor-encapsulated-options-space"
    type: "uint8"
    array: false

  - name: "PXEMenuPrompt"
    code: 10
    space: "vendor-encapsulated-options-space"
    type: "record"
    array: false
    record-types: "uint8,string"

  - name: "PXEBootMenu"
    code: 9
    space: "vendor-encapsulated-options-space"
    type: "record"
    array: false
    record-types: "uint16,uint8,string"
```

### dhcp4 client classes

The example below adds a client class for a raspberry pi pxe client. 

See [Kea - DHCP4 Client Classification](https://kea.readthedocs.io/en/latest/arm/classify.html)

*group_vars/kea/dhcp4_client_classes.yml*

```yml
kea_dhcp4_client_classes:
   # These options have been taken from https://www.growse.com/2018/08/29/pxe-booting-a-raspberry-pi.html. Thank you!
  - name: rpi-pxe
    test: "option[vendor-class-identifier].text == 'PXEClient:Arch:00000:UNDI:002001'"
    option-data:
      - name: boot-file-name
        data: bootcode.bin

      - name: vendor-class-identifier
        data: PXEClient

      - name: vendor-encapsulated-options

      - name: PXEBootMenu
        csv-format: true
        data: "0,17,Raspberry Pi Boot"
        space: vendor-encapsulated-options-space

      - name: PXEDiscoveryControl
        data: "3"
        space: vendor-encapsulated-options-space

      - name: PXEMenuPrompt
        csv-format: true
        data: "0,PXE"
        space: vendor-encapsulated-options-space
```

### dhcp4 ddns

See: [Kea - The DHCP-DDNS Server](https://kea.readthedocs.io/en/latest/arm/ddns.html)

```
---
kea_dhcp_ddns_forward_domains:
  - name: "my.domain."
    dns-servers:
      - ip-address: "10.10.0.8"

kea_dhcp_ddns_reverse_domains: []

kea_dhcp4_ddns_generated_prefix: "ddns"
kea_dhcp4_ddns_qualifying_suffix: "my.domain"

# Useful for debugging. Consider to disable in production
kea_dhcp4_ddns_update_on_renew: false
```
