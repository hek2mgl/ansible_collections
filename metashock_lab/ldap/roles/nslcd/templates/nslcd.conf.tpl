# /etc/nslcd.conf
# nslcd configuration file. See nslcd.conf(5)
# for details.

# !!! Note: This file was written by Ansible. It will be overriden
# each time the metashock_lab.ldap.nslcd role gets applied. !!!
# Change the role, not this file!

# The user and group nslcd should run as.
uid {{ nslcd_user }}
gid {{ nslcd_group }}

# The location at which the LDAP server(s) should be reachable.
uri {{ nslcd_ldap_uri }}

# The search base that will be used for all queries.
base passwd {{ nslcd_search_base_passwd }}
base shadow {{ nslcd_search_base_shadow }}
base group {{ nslcd_search_base_group }}

# The LDAP protocol version to use.
#ldap_version 3

# The DN to bind with for normal lookups.
binddn {{ nslcd_binddn }}
bindpw {{ nslcd_bindpw }}

# The DN used for password modifications by root.
#rootpwmoddn cn=admin,dc=example,dc=com

# SSL options
#ssl off
#tls_reqcert never
tls_cacertfile /etc/ssl/certs/ca-certificates.crt

# The search scope.
#scope sub
