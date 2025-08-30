# n8n-settings
N8N Settings for Laravel Forge

## Installation process

1. Create empty site in Forge and set NGINX according to provided nginx.conf
2. Install N8N globally following official instructions
3. Copy start_n8n_app.sh file in desired directory to run the N8N as Daemon
4. Create Supervisor Daemon to take care of N8N process
5. Create n8n-backups folder and copy n8n-backup.sh in this folder
6. Make this sh cile excutable
7. Check if aws console exists and install if not
8. Configure aws config and add IAM user with FullS3Access
9. Run backup script to test
10. Add running backup script in CRON

   

Note: Replace URLs in provided files with your actual URLs.
