# Ansible Collection - metashock_lab.terminal_toolchain

Install, configure the terminal tools for interactive command line access, across the fleet. Make sure it is up to date, in sync and can be further maintained on all hosts.

## Configuration

Example:

```console
$ cat group_vars/terminal_toolchain/main.yml 
---
terminal_toolchain_users:
  - user_name: foo
    home_dir: "/home/foo"
  - user_name: root
    home_dir: "/root"

terminal_toolchain_git_user_name: username
terminal_toolchain_git_user_email: username@organization.org
```
