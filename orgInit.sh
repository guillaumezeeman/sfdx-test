# Parse variables
CONSUMERKEY="$(heroku config:get CONSUMERKEY -a ntv-scratch-org-manager)"
HUB_USERNAME="$(heroku config:get HUB_USERNAME -a ntv-scratch-org-manager)"

# Create JWTKEY file
heroku config:get JWTKEY -a ntv-scratch-org-manager > /app/tmp/server.key

sfdx force:auth:jwt:grant --clientid $CONSUMERKEY --username $HUB_USERNAME --jwtkeyfile /app/tmp/server.key
# sfdx force:org:create -f config/project-scratch-def.json -d 30 -s