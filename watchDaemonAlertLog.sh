PushoverNotify(){
    curl -s \
    --form-string "token=" \
    --form-string "user=" \
    --form-string "message=Someone is shaking the honeypot" \
    https://api.pushover.net/1/messages.json
}

inotifywait -m /var/log/daemon.alert.log  |
    while read directory action file; do
        PushoverNotify
    done
