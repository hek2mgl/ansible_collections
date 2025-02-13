{
  "id": {{ subnet.subnet_id }},
  "pools": [
    {% for pool in subnet.pools %}
    {
      "pool": "{{ pool }}"
    }
    {% endfor %}
  ],
  {% if 'relay' in subnet %}
  "relay": {{ subnet['relay'] | ansible.builtin.to_json(indent=2) | indent(2) }},
  {% endif %}
  "subnet": "{{ subnet.network_address }}",
  "next-server": "192.168.178.11",
  {% if 'option-data' in subnet %}
  "option-data": {{ subnet['option-data'] | ansible.builtin.to_json(indent=2) | indent(2) }}, 
  {% endif %}
  {% if 'reservations' in subnet %}
  "reservations": {{ subnet['reservations'] | ansible.builtin.to_json(indent=2) | indent(2) }}
  {% endif %}
}
