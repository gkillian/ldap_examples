#include <stdio.h>
#include <stdlib.h>
#include <lber.h>
#include <ldap.h>


int main(int argc, char *argv[])
{
    int rc = -1;
    LDAP *ld = NULL;
    char *ldapuri = NULL;
    char *base = NULL;
    char *PROGNAME = argv[0];

    if(argc < 2)
    {
       printf("usage: %s SERVER BASE\n", PROGNAME);
       printf("ex:  %s ldap://ldap.forumsys.com dc=example,dc=com\n", PROGNAME);
       return EXIT_SUCCESS;
    }
    ldapuri = argv[1];
    base = argv[2];

    rc = ldap_initialize( &ld, ldapuri );
    if( rc != LDAP_SUCCESS )
    {
        fprintf( stderr,
                "Could not create LDAP session handle for URI=%s (%d): %s\n",
                ldapuri, rc, ldap_err2string(rc) );
        exit( EXIT_FAILURE );
    }
    else { printf("DEBUG: %s\n", ldap_err2string(rc)); }

    return(EXIT_SUCCESS);
}
