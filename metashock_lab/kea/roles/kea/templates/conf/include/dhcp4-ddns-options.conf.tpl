"dhcp-ddns": {
  "enable-updates": {{ kea_dhcp4_ddns_enable_updates | ansible.builtin.to_json() }}
},

// This is the default value. Globally enable updates. They can be disabled
// at any lower level of the configuration
"ddns-send-updates": {{ kea_dhcp4_ddns_send_updates | ansible.builtin.to_json()}},

// Ignore client delegation requests
// See: https://kea.readthedocs.io/en/kea-2.2.0/arm/dhcp4-srv.html#when-does-the-kea-dhcp4-server-generate-a-ddns-request
"ddns-override-client-update": {{ kea_dhcp4_ddns_override_client_update | ansible.builtin.to_json() }},
"ddns-override-no-update": {{ kea_dhcp4_ddns_override_no_update | ansible.builtin.to_json() }},

// Replace the name the client sent. If the client sent no name, generate one for the client
"ddns-replace-client-name": {{ kea_dhcp4_ddns_replace_client_name | ansible.builtin.to_json() }},
"ddns-generated-prefix": {{ kea_dhcp4_ddns_generated_prefix | ansible.builtin.to_json() }},
"ddns-qualifying-suffix": {{ kea_dhcp4_ddns_qualifying_suffix | ansible.builtin.to_json() }},

// Useful for debugging. Can be disabled in production
"ddns-update-on-renew" : {{ kea_dhcp4_ddns_update_on_renew | ansible.builtin.to_json() }},

// Should be set in environments where clients may send hostnames
// containing special characters with their DHCPREQUESTS
// "hostname-char-set": "[^A-Za-z0-9.-]",
// "hostname-char-replacement": "x",
