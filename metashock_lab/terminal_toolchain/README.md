# Ansible Collection - metashock_lab.terminal_toolchain

Configure the terminal tool chain. Install fancy tools. Colorize all the things!!!

## Example Configuration

```yaml
# Note: role dependencies of this role might install additional packages.
# The packages in this list are OS packages which doesn't require extra setup
# steps and therefore doesn't need to get install by a dedeciated role.
packages:
  - bat
  - build-essential
  - curl
  - htop
  - jq
  - ioping
  - iotop
  - libwww-dict-leo-org-perl
  - lsof
  - moreutils
  - ncal
  - nmap
  - openssh-client
  - shellcheck
  - tmux
  - tree
  - vim
  - tcpdump

git:
  user_name: hek2mgl
  user_email: hek2mgl@metashock.net
```
