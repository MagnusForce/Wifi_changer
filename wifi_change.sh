#!/bin/ash

WIRELESS_CONFIG="/etc/config/wireless"

PHONE_NUMBER=""

generate_random_key() {
    head -c 32 /dev/urandom | base64 | tr -dc 'a-zA-Z0-9' | head -c 12
}

send_sms() {
    local phone_number="$1"
    local message="$2"
    gsmctl -S -s "$phone_number $message"
}

new_key=$(generate_random_key)

sed -i "/option key/s/'[^']*'/'$new_key'/" "$WIRELESS_CONFIG"

echo "New key: $new_key"

send_sms "$PHONE_NUMBER" "$new_key"

/etc/init.d/network reload
