#!/bin/bash

echo "Enter three positive integers separated by spaces:"

while true; do
	read -r input
	if [[ $input =~ ^[1-9][0-9]*[[:space:]]+[1-9][0-9]*[[:space:]]+[1-9][0-9]*$ ]]; then
		# Validate the length of each input number
		IFS=' ' read -r num1 num2 num3 <<< "$input"
		if [[ ${#num1} -gt 9 || ${#num2} -gt 9 || ${#num3} -gt 9 ]]; then
			echo "Invalid input! Number length should not exceed 9 digits."
			continue
		fi
		echo "$input" | tr -s ' ' > demension.txt
		echo "输入的数字为"
		cat demension.txt
		break
	else
		echo "Invalid input! Please enter three positive integers separated by spaces:"
	fi
done

