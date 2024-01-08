# Wifi_changer
Small wifi pass key changing script, that has SMS reminder function. Script was intender for RUTOS, but probably could be used on OpenWRT too.

Short explanation can be found bellow:

WIRELESS_CONFIG: Path to the wireless configuration file.

PHONE_NUMBER: The phone number to which the generated key will be sent.

generate_random_key(): Function to create a random key of 12 characters using /dev/urandom.

send_sms(): Function to send an SMS using gsmctl with a specified phone number and message.

new_key: Generates a random key using the generate_random_key() function.

Uses sed to replace the existing wireless key in the configuration file with the new key.

Prints the new key to the console.

Sends an SMS containing the new key to the specified phone number.

Reloads the network configuration.
