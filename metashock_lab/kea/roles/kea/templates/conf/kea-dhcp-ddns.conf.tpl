{
  "DhcpDdns": {
    "ip-address": "{{ kea_dhcp_ddns_listen_address }}",
    "port": {{ kea_dhcp_ddns_listen_port }},
    "control-socket": {
      "socket-type": "unix",
      "socket-name": "/run/kea/kea-ddns-ctrl-socket"
    },

    <?include "{{ kea_config_dir }}/include/tsig-keys.conf"?>,

    "forward-ddns": {
      "ddns-domains": {{ kea_dhcp_ddns_forward_domains | ansible.builtin.to_json(indent=2) | indent(6) }}
    },

    "reverse-ddns" : {
      "ddns-domains": {{ kea_dhcp_ddns_reverse_domains | ansible.builtin.to_json(indent=2) | indent(6) }}
    },

    "loggers": [
      {
        // This specifies the logging for D2 (DHCP-DDNS) daemon.
        "name": "kea-dhcp-ddns",
        <?include "{{ kea_config_dir }}/include/logging.conf"?>
      }
    ]
  }
}
