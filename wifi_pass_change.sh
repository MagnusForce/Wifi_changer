#!/bin/ash

# Path to the wireless configuration file
WIRELESS_CONFIG="/etc/config/wireless"

# Phone number to send the new key to
PHONE_NUMBER="0037066221080"

# Function to generate a random key
generate_random_key() {
    head -c 32 /dev/urandom | base64 | tr -dc 'a-zA-Z0-9' | head -c 12
}

# Function to send SMS using gsmctl
send_sms() {
    local phone_number="$1"
    local message="$2"
    gsmctl -S -s "$phone_number $message"
}

# Generate a random key
new_key=$(generate_random_key)

# Update the wireless configuration file with the new key
sed -i "/option key/s/'[^']*'/'$new_key'/" "$WIRELESS_CONFIG"

# Print the new key
echo "New key: $new_key"

# Send SMS with the new key to the specified phone number
send_sms "$PHONE_NUMBER" "$new_key"