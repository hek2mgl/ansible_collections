#!/bin/bash
< subschema.ldif grep --color=always -i "'inetorgperson'" -A6
< subschema.ldif grep --color=always -i "'organizationalPerson'" -A5
< subschema.ldif grep --color=always -i "'person'" -A2
echo "--- Props"
< subschema.ldif grep -i "'userPassword'" -A1
