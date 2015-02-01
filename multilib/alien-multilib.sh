#!/bin/sh

# Install script for alienBOB's multilibs.

# KaMii <lacielacie@rocketmail.com>
# All your wrongs are belong to me PirateLeft 2015
#
# I dont give a flying fuck what you do with this script.  Hack it, sell it, compile it,
# delete it, fap to it.
#
# 1. Redistribution consequences:
#
# YOU MUST GIVE CREDIT TO THE ORIGINAL AUTHOR OF THIS SCRIPT WITH A COPY OF THIS MESSAGE.
# USING THIS SCRIPT IS YOUR BUSINESS.  NO ONE IS FORCING YOU TO USE IT, SO IF YOUR COMPUTER
# BLOWS UP AND EVERYONE ON PLANET EARTH IS KILLED IN THE PROCESS, DO NOT BLAME ANYONE BUT
# YOURSELF FOR BEING TOO STUPID TO RTFM BEFORE EXECUTING THIS SCRIPT.  I WILL STOP WRITING
# DISCLAIMER INFORMATION NOW IN CAPITAL LETTERS BECAUSE I KNOW NO ONE EVEN READS THIS SHIT
# ANYMORE.

# HOMEPAGE="http://alien.slackbook.org/dokuwiki/doku.php?id=slackware:multilib"

########## USER ACTIONS REQUIRED BELOW ##########
## Select a version below by uncommenting then ##
## save the file, exit, and execute.           ##

#Variables
#SLACKVER=13.0
#SLACKVER=13.1
#SLACKVER=13.37
#SLACKVER=14.0
#SLACKVER=14.1
#SLACKVER=current

##
## DO NOT EDIT BELOW THIS LINE UNLESS YOU KNOW WHAT YOU ARE DOING ##
##                     YOU HAVE BEEN WARNED                       ##
##                        NSA IS WATCHING                         ##
##

# Courtesy of Urchlay
	if [ "$SLACKVER" != "" ]; then
		echo "Using SLACKVER=$SLACKVER from environment"
		# user has it set in the environment, leave it as-is
		return
	elif [ -f /etc/slackware-version ]; then
		set $( cat /etc/slackware-version )
		if [ "$1" != "Slackware" ]; then
			echo "warning: /etc/slackware-version says this is '$1, not 'Slackware'"
		fi
		SLACKVER="$2"
		echo "Using SLACKVER=$SLACKVER from /etc/slackware-version"
	else
		echo "SLACKVER not set in environment, and I can't find /etc/slackware-version on this system!"
		exit 1
	fi

TMP=${TMP:-/tmp/alien}
OUTPUT=${OUTPUT:-/tmp}

# Sanity Check: Test if the script runs as root

if [ "$(whoami)" != root ] ; then
    echo -e "\nPlease run this script as root!\n" >&2
    exit 1
fi

mkdir -p $TMP $OUTPUT
mkdir -p $TMP/multilib
cd $TMP/multilib
lftp -c "open http://taper.alienbase.nl/mirrors/people/alien/multilib/ ; mirror -c -e ${SLACKVER}"
cd ${SLACKVER}

tail +13 CHECKSUMS.md5 | md5sum --check
# Thank you Urchlay for helping me with this.
if [ "$?" != "0" ]; 
          then echo "Checksum does not match... aborting."; exit 1;
else
	  echo "Source files verified."
fi

upgradepkg --reinstall --install-new *.t?z
upgradepkg --install-new slackware64-compat32/*-compat32/*.t?z

