
CC=gcc
RM=rm -fv
RMDIR=rm -rfv

LDAP_URI= ldap://ldap.forumsys.com 
LDAP_BASE = dc=example,dc=com
LDAP_INCDIR= /opt/local/include       
LDAP_LIBDIR= /opt/local/lib

LDAP_INCPATH= -I$(LDAP_INCDIR)

DEFS = $(LDAP_INCPATH)
CFLAGS = -Wall -pedantic -std=c99 -g
LDFLAGS = $(LDAP_LIBPATH)
LIBS = -lldap -llber

all : clean init run

init : init.c
	$(CC) $(CFLAGS) $(LDAP_INCPATH) $< -o $@ $(LIBS)

.PHONY : run
run: init
	./init  $(LDAP_URI) $(LDAP_BASE)

clean : lean
	-@$(RM) init

lean :
	-@$(RM) *~
	-@$(RM) ?
	-@$(RM) init.o
	-@$(RMDIR) init.dSYM
