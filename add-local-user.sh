#!/bin/bash

# Create new user on local system with the input provided by user
# Script only can execute with superuser privileges , or it will return exit status of 1 .
# Inform the users if account is not able to created for some reason. Return status of 1
# Must display username, password and host where the account was created.

# Make sure the script is being executed with superuser privileges.
if [[ "UID" -ne 0 ]];
then
  echo "This script requires superuser privileges. Please run it with sudo"
  exit 1
fi

# Get the user name (Login)
read -p 'Enter the username to create: ' USER_NAME

# Get the real name
read -p 'Enter real name: ' COMMENT

# Get the password
read -p 'Enter the password to create: ' PASSWORD

# Create the user with password
if useradd -c "${COMMENT}" -m "${USER_NAME}"
then 
  echo "Use ${USER_NAME} created successfully."
else 
  echo "Error : Failed to create user ${USER_NAME}."
  exit 1
fi

# Set the password
if echo "${PASSWORD}" | passwd --stdin "${USER_NAME}"; then
  echo "Password set successfully."
else
  echo "Error: Failed to set password for ${USER_NAME}."
  exit 1
fi


# Force pasword change on first login
passwd -e "${USER_NAME}"

echo "User ${USER_NAME} is ready for first login with a password change."


#get the hostname of system
hostname=$(hostname)

# Display the username , password and the host where the user was created.
echo "Username: ${USER_NAME}"
echo "Password: ${PASSWORD}"
echo "Host: $hostname"

exit 0 
