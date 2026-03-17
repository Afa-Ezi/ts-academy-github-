#!/bin/bash

#############################################
#        BASH MASTER SCRIPT DEMO
# Covers:
# variables, input, conditionals, loops,
# functions, arrays, arguments, files,
# processes, errors, traps, etc.
#############################################

# ========== 1. VARIABLES ==========
name="Israel"
age=20

echo "Name: $name"
echo "Age: $age"

# Read user input
read -p "Enter your favorite language: " lang
echo "You like $lang"

# ========== 2. COMMAND LINE ARGUMENTS ==========
echo "Script name: $0"
echo "First argument: $1"
echo "Second argument: $2"
echo "All arguments: $@"
echo "Number of arguments: $#"

# ========== 3. CONDITION (IF) ==========
read -p "Enter a number: " num

if [ $num -gt 10 ]; then
    echo "Number is greater than 10"
elif [ $num -eq 10 ]; then
    echo "Number is exactly 10"
else
    echo "Number is less than 10"
fi

# ========== 4. CASE STATEMENT ==========
read -p "Enter a command (start/stop/restart): " cmd

case $cmd in
    start)
        echo "Starting..."
        ;;
    stop)
        echo "Stopping..."
        ;;
    restart)
        echo "Restarting..."
        ;;
    *)
        echo "Invalid command"
        ;;
esac

# ========== 5. LOOPS ==========
echo "For loop:"
for i in {1..5}
do
    echo "Number $i"
done

echo "While loop:"
count=1
while [ $count -le 3 ]
do
    echo "Count: $count"
    ((count++))
done

# ========== 6. FUNCTIONS ==========
greet() {
    echo "Hello, $1!"
}

greet "Developer"

# Return value
add_numbers() {
    result=$(( $1 + $2 ))
    echo $result
}

sum=$(add_numbers 5 7)
echo "Sum from function: $sum"

# ========== 7. ARRAYS ==========
fruits=("apple" "banana" "cherry")

echo "First fruit: ${fruits[0]}"
echo "All fruits: ${fruits[@]}"

for fruit in "${fruits[@]}"
do
    echo "Fruit: $fruit"
done

# ========== 8. STRING OPERATIONS ==========
text="hello world"

echo "Uppercase: ${text^^}"
echo "Length: ${#text}"

# ========== 9. FILE OPERATIONS ==========
file="test.txt"

echo "This is a test file" > $file
echo "Appending another line" >> $file

echo "File content:"
cat $file

# Check file
if [ -f $file ]; then
    echo "$file exists"
fi

# ========== 10. USER & SYSTEM INFO ==========
echo "Current user: $USER"
echo "Home directory: $HOME"
echo "Current directory: $(pwd)"

# ========== 11. PROCESS MANAGEMENT ==========
echo "Running processes (top 5):"
ps | head -5

# Background process
sleep 5 &
echo "Background PID: $!"

# ========== 12. ERROR HANDLING ==========
set -e  # exit on error

# Try a command
if ! ls fakefile 2>/dev/null; then
    echo "Handled error: file does not exist"
fi

# ========== 13. TRAPS (SIGNAL HANDLING) ==========
trap "echo 'Script interrupted!'; exit" SIGINT

# Uncomment to test:
# sleep 10

# ========== 14. PERMISSIONS ==========
echo "File permissions:"
ls -l $file

# ========== 15. EXIT STATUS ==========
ls > /dev/null
echo "Last command exit status: $?"

# ========== 16. SUBSHELL ==========
(sub_var="Inside subshell"; echo $sub_var)

echo "Script completed successfully!"