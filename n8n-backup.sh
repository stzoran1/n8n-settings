  GNU nano 7.2                                                                                            n8n-backup.sh                                                                                                     
#!/bin/bash
set -e

# Load NVM
export NVM_DIR="/home/forge/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

# Use the desired version of Node
nvm use 24.4.1

# Add Node binary path to PATH
export PATH="$NVM_DIR/versions/node/v24.4.1/bin:$PATH"

# Backup folder
BACKUP_ROOT="/home/forge/n8n-backups"
TIMESTAMP=$(date +%Y-%m-%d_%H-%M-%S)
BACKUP_DIR="$BACKUP_ROOT/$TIMESTAMP"

# Create folder
mkdir -p "$BACKUP_DIR"

# Environment variables for n8n
export WEBHOOK_URL="https://n8n.yourdomain.com"
export N8N_SECURE_COOKIE=false
export N8N_PUSH_BACKEND=sse
export N8N_EDITOR_BASE_URL="https://n8n.yourdomain.com"
export N8N_ENFORCE_SETTINGS_FILE_PERMISSIONS=true
export DB_SQLITE_POOL_SIZE=2
export N8N_RUNNERS_ENABLED=true

# DB config for SQLite
export DB_TYPE=sqlite
export DB_SQLITE_DATABASE="/home/forge/n8n.conimext.co.rs/.n8n/database.sqlite"

# Load n8n environment
export $(grep -v '^#' /home/forge/n8n/.env | xargs)


# Export workflows & credentials
n8n export:workflow --all --output="$BACKUP_DIR/workflows.json"
n8n export:credentials --all --output="$BACKUP_DIR/credentials.json"

# Compress into tar.gz
tar -czf "$BACKUP_DIR.tar.gz" -C "$BACKUP_ROOT" "$TIMESTAMP"

# Remove uncompressed directory
rm -rf "$BACKUP_DIR"

echo "Backup created: $BACKUP_DIR.tar.gz"

echo "Uploading to S3..."

aws s3 cp "$BACKUP_DIR.tar.gz" s3://n8n-conimex-backup/

echo "Uploaded to S3."

# -------------------------
# Local cleanup (keep last 30)
# -------------------------
ls -1t $BACKUP_ROOT/*.tar.gz | tail -n +31 | xargs -r rm --
echo "🧹 Cleaned up local backups, keeping last 30."

# -------------------------
# S3 cleanup (keep last 30)
# -------------------------
aws s3 ls "$S3_BUCKET/" \

^G Help         ^O Write Out    ^W Where Is     ^K Cut          ^T Execute      ^C Location     M-U Undo        M-A Set Mark    M-] To Bracket  M-Q Previous    ^B Back         ^◂ Prev Word    ^A Home
^X Exit         ^R Read File    ^\ Replace      ^U Paste        ^J Justify      ^/ Go To Line   M-E Redo        M-6 Copy        ^Q Where Was    M-W Next        ^F Forward      ^▸ Next Word    ^E End
