
f_ldapsearch() {
    docker exec ldap1 ldapsearch -Y EXTERNAL -LLLQ -H ldapi:/// "${@}"
}

#alias a_ldapsearch='docker exec -it ldap1 ldapsearch -Y EXTERNAL -LLLQ -H ldapi:///'

export -f f_ldapsearch

f_ldapsearch -s base -b "" "(objectClass=*)" subschemaSubentry | awk '/subschemaSubentry:/ {print $2}' | xargs -I{} bash -c 'f_ldapsearch -b "{}" "(objectClass=*)" objectClasses attributeTypes'
