#!/bin/bash

echo "Welcome to Tic-Tac-Toe game"
declare -A position
for (( i=1 ; i<=9 ; i++ ))
do
	position[$i]=$i
done
echo " Refer cell number as the position of the board!"
function board() {
	echo " ${position[1]} | ${position[2]} | ${position[3]}"
	echo " ${position[4]} | ${position[5]} | ${position[6]}"
	echo " ${position[7]} | ${position[8]} | ${position[9]}"
}
board

for (( i=1 ; i<=9 ; i++ ))
do
        position[$i]="_"
done

echo "Let's begin with a toss to check who plays first"

function toss() {
	R=$((RANDOM % 2))
	if [ $R -eq 1 ]
	then
		echo "Player win the toss!!!"
		read -p "Enter letter X or O:" CHOICE
		if [[ "$CHOICE" == "X" ]] 
		then
			PLAYER=$CHOICE
			COMPUTER="O"
		else
			PLAYER=$CHOICE
			COMPUTER="X"
		fi
	else
		echo "Computer win the toss!!!"
		computerChoice=$((RANDOM % 2))
        	if [ $computerChoice -eq 1 ]
		then
			COMPUTER="X"
			PLAYER="O" 
		else
			COMPUTER="O"
			PLAYER="X"
		fi
	fi
	echo "Players choice:$PLAYER"
	echo "Computers choice:$COMPUTER"
	echo "Board:"
	board
}
toss

function win() {
	if ([[ "${position[1]}" == "$val" ]] && [[ "${position[2]}" == "$val" ]] && [[ "${position[3]}" == "$val" ]]) ||
	   ([[ "${position[4]}" == "$val" ]] && [[ "${position[5]}" == "$val" ]] && [[ "${position[6]}" == "$val" ]]) ||
	   ([[ "${position[7]}" == "$val" ]] && [[ "${position[8]}" == "$val" ]] && [[ "${position[9]}" == "$val" ]]) ||
	   ([[ "${position[1]}" == "$val" ]] && [[ "${position[4]}" == "$val" ]] && [[ "${position[7]}" == "$val" ]]) ||
	   ([[ "${position[2]}" == "$val" ]] && [[ "${position[5]}" == "$val" ]] && [[ "${position[8]}" == "$val" ]]) ||
	   ([[ "${position[3]}" == "$val" ]] && [[ "${position[6]}" == "$val" ]] && [[ "${position[9]}" == "$val" ]]) ||
	   ([[ "${position[1]}" == "$val" ]] && [[ "${position[5]}" == "$val" ]] && [[ "${position[9]}" == "$val" ]]) ||
	   ([[ "${position[3]}" == "$val" ]] && [[ "${position[5]}" == "$val" ]] && [[ "${position[7]}" == "$val" ]]) 
	then
		if [[ "$val" == "$PLAYER" ]]
		then
			echo "Player wins..."
			exit
		elif [[ "$val" == "$COMPUTER" ]]
		then
			echo "Computer wins..."
			exit
		else
			echo "No one wins..."
			exit
		fi
	fi
}
