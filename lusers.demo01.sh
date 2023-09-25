#/bin/bash

# This script displays various information to the screen.

# Display 'Hello'
echo 'Hello'

# Assign a value to a variable
WORD='script'

# Display value using variable
echo "$WORD"

# Demonstrate single quotes cause variables to Not get expanded.
echo '$WORD'

# combine variable with hard-coded text
echo "This is a shell $WORD"

# Display the contents of variable using alternative syntax
echo "This is a shell ${WORD}"

# Append text to variable
echo "${WORD}ing is fun!"

# Create a new variable
ENDING='ed'

# Combine two variables
echo "This is ${WORD}${ENDING}."

# Change the value stored in Ending variable. (Reassignment)
ENDING='ing'
echo "${WORD}${ENDING} is fun!"

# Reassign value to ENDING
ENDING='s'
echo "You are going to write many ${WORD}${ENDING}"


