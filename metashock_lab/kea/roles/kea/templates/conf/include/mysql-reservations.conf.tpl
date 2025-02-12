"hosts-database": {
    "type": "mysql",
    "host": "localhost",
    "port": 3306,
    "name": "kea",
    "user": "kea",
    "password": "kea"
},

"config-control": {
    "config-databases": [{
        "type": "mysql",
        "host": "localhost",
        "port": 3306,
        "name": "kea",
        "user": "kea",
        "password": "kea",
        "reconnect-wait-time": 3000, // expressed in ms
        "max-reconnect-tries": 3
    }]
},

"hooks-libraries": [
  {
    "library": "/usr/lib/aarch64-linux-gnu/kea/hooks/libdhcp_mysql_cb.so"
  }
],
