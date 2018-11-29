#!/bin/bash          
        SRVNAME="NEOWEB7"
        DTK=7
        BKPDIRNAME="neoweb7-fs"
        TOADDR="backup-report@neotericuk.com"
        ADMINADDR="kurian@neotericuk.co.uk vishal@neotericuk.com"
            SRCD="/var/named/"
            TGTD="/backup/$BKPDIRNAME/named-zones/"
            mkdir -p $TGTD
            OF=named-bck-$(date +%Y%m%d).tgz
            EXL=""
        cd $TGTD
        find $TGTD -type f -mtime +"$DTK" -iname "*.tgz" -exec rm -vf {} \;
            tar -czf $EXL $TGTD$OF $SRCD
            [ $? = 0 ] && echo "Backup done." | mail -s "DNS Zones $SRVNAME" "$TOADDR" || echo "ERROR in DNS backup" | mail -s "ERROR DNS Zone - 
$SRVNAME" "$ADMINADDR" "$TOADDR"

            cd /backup/
