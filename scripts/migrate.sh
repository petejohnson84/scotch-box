# Custom bash commands go here.

#!/bin/bash
cd /var/www/public/
ls -1 wp-content/ai1wm-backups/*.wpress 2>/dev/null | xargs --no-run-if-empty wp ai1wm restore