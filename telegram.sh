#!/bin/bash

bot_token=$INPUT_BOT_TOKEN
chat_id=$INPUT_CHAT_ID
message=$INPUT_MESSAGE
parse_mode=${INPUT_PARSE_MODE:-Markdown}

url="https://api.telegram.org/bot${bot_token}/sendMessage"

payload=$(cat <<EOF
{
    "chat_id": "${chat_id}",
    "parse_mode": "${parse_mode}",
    "text": "${message}"
}
EOF
)

response=$(curl -s -X POST -H "Content-Type: application/json" -d "${payload}" "${url}")
if [ $? -eq 0 ]; then
    echo "Message sent successfully: ${response}"
else
    echo "Action failed with error: ${response}"
fi
