#!/bin/bash
chmod 777 "$0"
frames=("⠋" "⠙" "⠹" "⠸" "⠼" "⠴" "⠦" "⠧" "⠇" "⠏" "⠋" "⠙" "⠹" "⠸" "⠼" "⠴" "⠦" "⠧" "⠇" "⠏")
expected_answer_yes="yes"
expected_answer_no="no"
user=$(whoami)
useremail="$user@student@42porto.com"

#Welcoming message to user
echo "####################################################"
echo "#                                                  #"
echo "#      Welcome and Enjoy your stay                 #"
echo "#      User_: $user                                #"
echo "#      Email: $useremail                           #"
echo "####################################################"

exit

# Friendly screen clear
echo "Want to clear the terminal before"
echo "executing the script?"
echo "(Type yes/no)"
echo -n "|>"
read answer
while true; do
    if [ "$answer" == "$expected_answer_yes" ]; then
        clear
        break
    elif [ "$answer" == "$expected_answer_no" ]; then
        break
    else
        echo "Answer not valid, please try again"
        echo -n "|>"
        read answer
    fi
done


# Password Check
echo "Enter your password: "
echo -n "|>"
read -s pwd
clear
echo "$password" | sudo -S ls / > /dev/null 2>&1
for frame in "${frames[@]}"; do
    echo -ne "$frame Checking if Password is correct\r"
    sleep 0.2
done
clear
if [ $? -eq 0 ]; then
    echo "Password is correct"
    sleep 2
else
    echo "Incorrect password"
    sleep 2
    clear
    exit
fi
clear



# Fixing Debian 12 Problem of the package error
echo "1234" | if ! grep -q "\[trusted=yes\]" /etc/apt/sources.list; then
    sudo sed -i 's/^deb /deb [trusted=yes] /g' /etc/apt/sources.list
    sudo sed -i 's/^deb-src /deb-src [trusted=yes] /g' /etc/apt/sources.list
else
    echo "[trusted=yes] already exists"
fi


# Install packages
sudo apt install make -y
