LDAP_INCDIR= /opt/local/include       
LDAP_LIBDIR= /opt/local/lib

LDAP_INCPATH= -I$(LDAP_INCDIR)

DEFS = $(LDAP_INCPATH)
CFLAGS = -Wall -pedantic -std=c99 -g
LDFLAGS = $(LDAP_LIBPATH)
LIBS = -lldap -llber


init : init.c
	$(CC) $(CFLAGS) $(LDAP_INCPATH) $< -o $@ $(LIBS)

clean : lean
	-@$(RM) init

lean :
	-@$(RM) *~
	-@$(RM) ?
	-@$(RM) *.o

