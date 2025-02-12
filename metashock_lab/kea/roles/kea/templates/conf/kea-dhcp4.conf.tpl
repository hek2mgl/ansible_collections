{
  "Dhcp4": {
    <?include "{{ kea_config_dir }}/include/dhcp4-option-def.conf"?>,
    <?include "{{ kea_config_dir }}/include/dhcp4-ddns-options.conf"?>

    "interfaces-config": {
      "interfaces": {{ kea_dhcp4_listen_interfaces | ansible.builtin.to_json() }}
    },

    // needed by kea-admin
    "control-socket": {
      "socket-type": "unix",
      "socket-name": "/run/kea/kea4-ctrl-socket"
    },

    "valid-lifetime": 4000,
    "renew-timer": 1000,
    "rebind-timer": 2000,

    "host-reservation-identifiers": [
      "hw-address"
    ],

    <?include "{{ kea_config_dir }}/include/dhcp4-client-classes.conf"?>,

    "option-data": [
      {
          "name": "domain-name-servers",
          "data": "192.168.178.11"
      }
    ],

    "subnet4": [
    {% set sep = joiner(",\n") %}
    {% for subnet in kea_dhcp4_config.subnets %}
      {{ sep() }}<?include "{{ kea_config_dir }}/include/dhcp4_subnets/{{ subnet.network_address | replace('/', '_') }}.conf"?>
    {% endfor %}
    ],

    # Now loggers are inside the DHCPv4 object.
    "loggers": [
      {
        "name": "kea-dhcp4",
        <?include "{{ kea_config_dir }}/include/logging.conf"?>
      }
    ]
  }
}
