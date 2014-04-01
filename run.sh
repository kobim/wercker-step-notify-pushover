#!/bin/bash

if [ ! -n "$WERCKER_NOTIFY_PUSHOVER_TOKEN" ]; then
  fail 'Missing token property'
fi

if [ ! -n "$WERCKER_NOTIFY_PUSHOVER_USER" ]; then
  fail 'Missing user property'
fi

if [ ! -n "$WERCKER_NOTIFY_PUSHOVER_DEVICE" ]; then
  export DEVICE=""
else
  export DEVICE="&device=$WERCKER_NOTIFY_PUSHOVER_DEVICE"
fi

if [ ! -n "$WERCKER_NOTIFY_PUSHOVER_TITLE" ]; then
  export TITLE=""
else
  export TITLE="&title=$WERCKER_NOTIFY_PUSHOVER_TITLE"
fi

if [ ! -n "$DEPLOY" ]; then
  export WERCKER_NOTIFY_PUSHOVER_ACT="build"
  export WERCKER_NOTIFY_PUSHOVER_URL="$WERCKER_BUILD_URL"
else
  export WERCKER_NOTIFY_PUSHOVER_ACT="deploy"
  export WERCKER_NOTIFY_PUSHOVER_URL="$WERCKER_DEPLOY_URL"
fi

export WERCKER_NOTIFY_PUSHOVER_MESSAGE="$WERCKER_APPLICATION_NAME $WERCKER_NOTIFY_PUSHOVER_ACT #${WERCKER_DEPLOY_ID:0:5} by $WERCKER_STARTED_BY $WERCKER_RESULT."

payload="token=$WERCKER_NOTIFY_PUSHOVER_TOKEN&user=$WERCKER_NOTIFY_PUSHOVER_USER&url=$WERCKER_NOTIFY_PUSHOVER_URL&message=$WERCKER_NOTIFY_PUSHOVER_MESSAGE$DEVICE$TITLE"

RESULT=`curl -d "$payload" -s  "https://api.pushover.net/1/messages.json" --output $WERCKER_STEP_TEMP/result.txt -w "%{http_code}"`

if [ "$RESULT" != "200" ]; then
  if grep -Fqx "user identifier is invalid" $WERCKER_STEP_TEMP/result.txt; then
    fail "Bad user token"
  fi

  if grep -Fqx "application token is invalid" $WERCKER_STEP_TEMP/result.txt; then
    fail "Bad application token"
  fi
fi
