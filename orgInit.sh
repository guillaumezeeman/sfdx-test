# Create JWTKEY file
heroku config:get JWTKEY -a ntv-scratch-org-manager > /tmp/server.key

sfdx force:auth:jwt:grant --clientid "$(heroku config:get CONSUMERKEY -a ntv-scratch-org-manager)" --username "$(heroku config:get HUB_USERNAME -a ntv-scratch-org-manager)" --jwtkeyfile /tmp/server.key -a hubOrg -d

sfdx force:org:create -f config/project-scratch-def.json -d 30 -s