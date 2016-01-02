#!/bin/bash

echo "Syncing with jedcn.com.."

#
# When you run `npm run build` the static site ends up here:
LOCAL_BUILD_DIR='build/'

#
# This file isn't checked into source control. It contains lines like:
#
# DEPLOY_HOST=the-server-where-jedcn.com-is-hosted
# DEPLOY_USER=the-user-that-can-rsync-into-DEPLOY_HOST
source ~/.jedcn.com.rc

DEPLOY_HOST_DIR=/home/public

#
# This command will make DEPLOY_HOST_DIR contain the same files as
# LOCAL_BUILD_DIR

#
# If you want to experiment with changes, add "--dry-run" to be sure
# it is working as you expect.
#
rsync --verbose -r $LOCAL_BUILD_DIR $DEPLOY_USER@$DEPLOY_HOST:$DEPLOY_HOST_DIR
