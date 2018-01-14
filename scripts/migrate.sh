# Custom bash commands go here.

#!/bin/bash
cd /var/www/public/wp-content/ai1wm-backups
ls -1 *.wpress 2>/dev/null | xargs --no-run-if-empty wp ai1wm restore