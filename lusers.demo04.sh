#!/bin/bash

# Create user and password for users
# Force user to change password on first login


# Create Username 
read -p 'Enter the username to create: ' USER_NAME



# Input Real name of user
read -p 'Enter name of the person for this account : ' COMMENT


# Create account password
read -s -p 'Enter the password for the account: ' PASSWORD
echo

# Create the account using useradd
if useradd -c "${COMMENT}" -m ${USER_NAME}; then
 echo "User ${USER_NAME} created successfully."
else 
 echo "Error: Failed to create user ${USER_NAME}."
 exit 1
fi


# Set the password for the user by user input 
if echo "${PASSWORD}" | passwd --stdin "${USER_NAME}"; then
  echo "Password set successfully."
else
  echo "Error: Failed to set the password for ${USER_NAME}."
  exit 1
fi

# Force the user to change password on first login
passwd -e ${USER_NAME}

echo "User ${USER_NAME} is ready for first login with a password change."



