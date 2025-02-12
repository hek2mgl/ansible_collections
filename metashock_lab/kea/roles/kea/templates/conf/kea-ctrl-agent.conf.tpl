{
  "Control-agent": {
      "http-host": "127.0.0.1",
      // If enabling HA and multi-threading, the 8000 port is used by the HA
      // hook library http listener. When using HA hook library with
      // multi-threading to function, make sure the port used by dedicated
      // listener is different (e.g. 8001) than the one used by CA. Note
      // the commands should still be sent via CA. The dedicated listener
      // is specifically for HA updates only.
      "http-port": 8000,

      // Specify location of the files to which the Control Agent
      // should connect to forward commands to the DHCPv4, DHCPv6
      // and D2 servers via unix domain sockets.
      "control-sockets": {
          "dhcp4": {
              "socket-type": "unix",
              "socket-name": "/run/kea/kea4-ctrl-socket"
          },
          "d2": {
              "socket-type": "unix",
              "socket-name": "/run/kea/kea-ddns-ctrl-socket"
          }
      },

      // Specify hooks libraries that are attached to the Control Agent.
      // Such hooks libraries should support 'control_command_receive'
      // hook point. This is currently commented out because it has to
      // point to the existing hooks library. Otherwise the Control
      // Agent will fail to start.
      "hooks-libraries": [
  //     {
  //        "library": "/usr/lib/aarch64-linux-gnu/kea/hooks/control-agent-commands.so",
  //         "parameters": {
  //            "param1": "foo"
  //        }
  //     }
      ],

      "loggers": [
      {
          // This specifies the logging for Control Agent daemon.
          "name": "kea-ctrl-agent",
          <?include "{{ kea_config_dir }}/include/logging.conf"?>
      }
    ]
  }
}
