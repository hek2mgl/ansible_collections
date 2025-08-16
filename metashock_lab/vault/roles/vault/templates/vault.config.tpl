ui            = true
cluster_addr  = "https://127.0.0.1:8201"
api_addr      = "https://127.0.0.1:8200"
disable_mlock = true

{% if vault_storage_type == "raft" %}
storage "raft" {
  path = "{{ vault_storage_raft_path }}"
  node_id = "{{ vault_storage_raft_node_id }}"
}
{% elif vault_storage_type == "file" %}
storage "file" {
  path = "{{ vault_storage_file_path }}"
}
{% endif %}

listener "tcp" {
  address       = "127.0.0.1:8200"
  tls_cert_file = "{{ vault_tls_cert_path }}"
  tls_key_file  = "{{ vault_tls_key_path }}"
}

telemetry {
  statsite_address = "127.0.0.1:8125"
  disable_hostname = true
}

