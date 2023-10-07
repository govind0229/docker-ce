#!/bin/bash
# Govind Kumar <govind.kumar>
# set tacacs user account
# Check if both input files exist

if [ ! -f user.txt ] || [ ! -f d.txt ]; then
  echo "Error: Input files 'user.txt' and 'd.txt' not found."
  exit 1
fi

# Loop through each line in user.txt
while read -r username; do
  # Check if the username is not empty
  if [ -n "$username" ]; then
    # Create the user if it doesn't already exist
    if ! id "$username" &>/dev/null; then
      sudo useradd -m -s /bin/bash "$username"
      echo "User '$username' created."
    else
      echo "User '$username' already exists."
    fi

    # Create the directory using the username from d.txt
    directory=$(grep "$username" d.txt)
    if [ -n "$directory" ]; then
      directory="${directory/$username/}" # Remove the username from the line
      directory="${directory// /}" # Remove leading/trailing spaces
      if [ -n "$directory" ]; then
        sudo mkdir -p "/home/scmdc/$directory"
        echo "Directory '/home/scmdc/$directory' created."
        sudo chown "$username" "/home/scmdc/$directory"
        sudo usermod -m -d /home/scmdc/$directory $username
        sudo chsh -s /bin/bash $username
      else
        echo "Error: Directory name not found for user '$username' in d.txt."
      fi
    else
      echo "Error: No directory name found for user '$username' in d.txt."
    fi
  fi
done < user.txt
