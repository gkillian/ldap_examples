#!/bin/sh


# source file with settings
if [ -r ldap.conf ]
then
  . ldap.conf
else
  echo ERROR:  cannot read ldap.conf file
  return 1
fi

ldapsearch -Y PLAIN -D "${LDAP_BINDDN}" -w ${LDAP_BINDPW}  -H ${LDAP_URI} -b "${LDAP_BASEDN}"
ldapsearch -Y GSSAPI -U "dn:${LDAP_BINDDN}" -R EXAMPLE.COM -H ${LDAP_URI} -b "${LDAP_BASEDN}"
