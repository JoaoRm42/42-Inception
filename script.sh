#!/bin/bash
chmod 777 "$0"
frames=("⠋" "⠙" "⠹" "⠸" "⠼" "⠴" "⠦" "⠧" "⠇" "⠏" "⠋" "⠙" "⠹" "⠸" "⠼" "⠴" "⠦" "⠧" "⠇" "⠏")
expected_answer_yes="yes"
expected_answer_no="no"
user=$(whoami)
useremail="$user@student@42porto.com"

# Define fixed parts of the text
welcome_message="Welcome and Enjoy your stay"
user_label="User_: "
email_label="Email: "

# Calculate the lengths of the fixed parts
welcome_length=${#welcome_message}
user_label_length=${#user_label}
email_label_length=${#email_label}

# Calculate the total lengths of the lines
user_line_length=$((user_label_length + ${#user}))
email_line_length=$((email_label_length + ${#useremail}))

# Determine the maximum length
max_length=$((welcome_length > user_line_length ? welcome_length : user_line_length))
max_length=$((max_length > email_line_length ? max_length : email_line_length))

# Create the border
border_length=$((max_length + 6))  # 6 accounts for the "   # " and " #  "
border=$(printf '#%.0s' $(seq 1 $border_length))

# Print the formatted output
echo "$border"
echo "#  $(printf '%*s' $((max_length)) "")  #"
echo "#  $(printf '%*s' $(((max_length - ${#welcome_message}) / 2)))$welcome_message$(printf '%*s' $(((max_length - ${#welcome_message}) / 2)))  #"
echo "#  $(printf '%*s' $(((max_length - ${#user_label} - ${#user}) / 2)))$user_label$user$(printf '%*s' $(((max_length - ${#user_label} - ${#user}) / 2)))  #"
echo "#  $(printf '%*s' $(((max_length - ${#email_label} - ${#useremail}) / 2)))$email_label$useremail$(printf '%*s' $(((max_length - ${#email_label} - ${#useremail}) / 2)))  #"
echo "$border"

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
