#
# Regular cron jobs for the supreme package
#
0 4	* * *	root	[ -x /usr/bin/supreme_maintenance ] && /usr/bin/supreme_maintenance
