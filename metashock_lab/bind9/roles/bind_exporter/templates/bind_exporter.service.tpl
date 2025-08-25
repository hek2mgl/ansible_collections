[Unit]
Description=bind9 Prometheus exporter

[Service]
Type=simple
User={{ bind_exporter_os_username }}
ExecStart=/usr/local/bin/bind_exporter --web.listen-address="{{ bind_exporter_listen_address }}" --bind.stats-url="{{ bind_exporter_bind9_status_address }}"

[Install]
WantedBy=multi-user.target
After=named.service
