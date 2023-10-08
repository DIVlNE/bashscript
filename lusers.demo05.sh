#!/bin/bash

# This script generates random password for first time login users
# Random password


# Generate a random password
PASSWORD="${RANDOM}"
echo "${PASSWORD}"

# Generate a better random password
PASSWORD="${RANDOM}${RANDOM}${RANDOM}"
echo "${PASSWORD}"



# Generate date as random password
PASSWORD=$(date +%s)
echo "${PASSWORD}"



# Use nanoseconds to act as randomization
PASSWORD=$(date +%s%N)
echo "${PASSWORD}"


# Generate better password
PASSWORD=$(date +%s%N | sha256sum | head -c32)
echo "${PASSWORD}"


# An even better password
PASSWORD=$(date +%s%N${RANDOM}${RANDOM} | sha256sum | head -c48)
echo "${PASSWORD}"


# Append a special character to password.
SPECIAL_CHARACTER=$(echo '!@#$%^&*()-_+=' | fold -w1 | shuf | head -c1)
echo "${PASSWORD}${SPECIAL_CHARACTER}"




