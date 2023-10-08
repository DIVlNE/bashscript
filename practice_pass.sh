#!/bin/bash

# This script is for practice purposes to generate random password for users
# Generate random password 


# Function to check if user exists
user_exists() {
	id "${1}" &>/dev/null
}


# Create user id - read -p = prompt user to enter
read -p 'Enter username: ' USER_NAME 

# Check if the user already exists
if user_exists "${USER_NAME}"; then
	echo "Error: User ${USER_NAME} already exists."
	exit 1
else 
	echo " User ${USER_NAME} does not exist. Proceeding to create the account."
fi


# Input real name of user
read -p 'Enter name of the person: ' COMMENT


# Create account password using random generate
SPECIAL_CHARACTER=$(echo '!@#$%^&*()-_+=' | fold -w1 | shuf | head -c1)
PASSWORD=$(date +%s%N${RANDOM}${RANDOM}${SPECIAL_CHARACTER} | sha256sum | head -c16)
echo "This is your one time password: ${PASSWORD} "


# Create the account
if useradd -c "${COMMENT}" -m -p "${PASSWORD}" ${USER_NAME}; then
  echo "User ${USER_NAME} created successfully."
else
  echo "Error: Failed to create user ${USER_NAME}."
  exit 1
fi


# Force user change password on first login
passwd -e ${USER_NAME}

echo "User ${USER_NAME} is ready for first login with a password change."



