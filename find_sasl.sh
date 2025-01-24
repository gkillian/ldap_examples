#!/bin/sh


# source file with settings
if [ -r ldap.conf ]
then
  . ldap.conf
else
  echo ERROR:  cannot read ldap.conf file
  return 1
fi

ldapsearch -x -H ${LDAP_URI} -b '' -s base -LLL supportedSASLMechanisms
