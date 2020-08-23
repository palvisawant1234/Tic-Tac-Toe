#!/bin/bash

echo "Welcome to Tic-Tac-Toe game"
declare -A position
switchPlayer=0

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

declare -a arr
for (( j=1 ; j<=9 ; j++ ))
do
	arr[$j]=0
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
		switchPlayer=0
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
		switchPlayer=1
	fi
	echo "Players choice:$PLAYER"
	echo "Computers choice:$COMPUTER"
	echo "Board:"
	board
}
toss

function winCondition() {
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

function firstCondition() {
        if ([[ "${position[2]}" == "$computer" ]] && [[ "${position[3]}" == "$computer" ]] && [ ${arr[1]} -eq 0 ]) ||
	   ([[ "${position[4]}" == "$computer" ]] && [[ "${position[7]}" == "$computer" ]] && [ ${arr[1]} -eq 0 ]) ||
	   ([[ "${position[5]}" == "$computer" ]] && [[ "${position[9]}" == "$computer" ]] && [ ${arr[1]} -eq 0 ])
        then
	     computer_pos=1
        elif ([[ "${position[5]}" == "$computer" ]] && [[ "${position[8]}" == "$computer" ]] && [ ${arr[2]} -eq 0 ]) ||
	     ([[ "${position[1]}" == "$computer" ]] && [[ "${position[3]}" == "$computer" ]] && [ ${arr[2]} -eq 0 ])
		then
			computer_pos=2
		elif ([[ "${position[1]}" == "$computer" ]] && [[ "${position[2]}" == "$computer" ]] && [ ${arr[3]} -eq 0 ]) ||
	             ([[ "${position[5]}" == "$computer" ]] && [[ "${position[7]}" == "$computer" ]] && [ ${arr[3]} -eq 0 ]) ||
        	     ([[ "${pos[6]}" == "$computer" ]] && [[ "${pos[9]}" == "$computer" ]] && [ ${arr[3]} -eq 0 ])
			then
				computer_pos=3
			elif ([[ "${position[5]}" == "$computer" ]] && [[ "${position[6]}" == "$computer" ]] && [ ${arr[4]} -eq 0 ]) ||
			     ([[ "${position[1]}" == "$computer" ]] && [[ "${position[7]}" == "$computer" ]] && [ ${arr[4]} -eq 0 ])
        			then
					computer_pos=4
				elif ([[ "${position[1]}" == "$computer" ]] && [[ "${position[9]}" == "$computer" ]] && [ ${arr[5]} -eq 0 ]) ||
                     		     ([[ "${position[2]}" == "$computer" ]] && [[ "${position[8]}" == "$computer" ]] && [ ${arr[5]} -eq 0 ]) ||
                     		     ([[ "${position[3]}" == "$computer" ]] && [[ "${position[7]}" == "$computer" ]] && [ ${arr[5]} -eq 0 ]) ||
				     ([[ "${position[4]}" == "$computer" ]] && [[ "${position[6]}" == "$computer" ]] && [ ${arr[5]} -eq 0 ])
					then
						computer_pos=5
					elif ([[ "${position[4]}" == "$computer" ]] && [[ "${position[5]}" == "$computer" ]] && [ ${arr[6]} -eq 0 ]) ||
					     ([[ "${position[3]}" == "$computer" ]] && [[ "${position[9]}" == "$computer" ]] && [ ${arr[6]} -eq 0 ])
						then
							computer_pos=6
						elif ([[ "${position[1]}" == "$computer" ]] && [[ "${position[4]}" == "$computer" ]] && [ ${arr[7]} -eq 0 ]) ||
                   				     ([[ "${position[5]}" == "$computer" ]] && [[ "${position[3]}" == "$computer" ]] && [ ${arr[7]} -eq 0 ]) ||
                  				     ([[ "${position[8]}" == "$computer" ]] && [[ "${position[9]}" == "$computer" ]] && [ ${arr[7]} -eq 0 ])
							then
								computer_pos=7
							elif ([[ "${position[2]}" == "$computer" ]] && [[ "${position[5]}" == "$computer" ]] && [ ${arr[8]} -eq 0 ]) ||
							     ([[ "${position[7]}" == "$computer" ]] && [[ "${position[9]}" == "$computer" ]] && [ ${arr[8]} -eq 0 ])
								then
									computer_pos=8
								elif ([[ "${position[1]}" == "$computer" ]] && [[ "${position[5]}" == "$computer" ]] && [ ${arr[9]} -eq 0 ]) ||
                                                   		     ([[ "${position[7]}" == "$computer" ]] && [[ "${position[8]}" == "$computer" ]] && [ ${arr[9]} -eq 0 ]) ||
                                                 		     ([[ "${position[3]}" == "$computer" ]] && [[ "${position[6]}" == "$computer" ]] && [ ${arr[9]} -eq 0 ])
								then
									computer_pos=9
								else
									secondCondition
	fi
}

function secondCondition() {
        if ([[ "${position[2]}" == "$player" ]] && [[ "${position[3]}" == "$player" ]] && [ ${arr[1]} -eq 0 ]) ||
	   ([[ "${position[4]}" == "$player" ]] && [[ "${position[7]}" == "$player" ]] && [ ${arr[1]} -eq 0 ]) ||
	   ([[ "${position[5]}" == "$player" ]] && [[ "${position[9]}" == "$player" ]] && [ ${arr[1]} -eq 0 ])
	        then
			computer_pos=1
        	elif ([[ "${position[5]}" == "$player" ]] && [[ "${position[8]}" == "$player" ]] && [ ${arr[2]} -eq 0 ]) ||
	     	([[ "${position[1]}" == "$player" ]] && [[ "${position[3]}" == "$player" ]] && [ ${arr[2]} -eq 0 ])
			then
				computer_pos=2
			elif ([[ "${position[1]}" == "$player" ]] && [[ "${position[2]}" == "$player" ]] && [ ${arr[3]} -eq 0 ]) ||
	        	([[ "${position[5]}" == "$player" ]] && [[ "${position[7]}" == "$player" ]] && [ ${arr[3]} -eq 0 ]) ||
        	     	([[ "${position[6]}" == "$player" ]] && [[ "${position[9]}" == "$player" ]] && [ ${arr[3]} -eq 0 ])
				then
					computer_pos=3
				elif ([[ "${position[5]}" == "$player" ]] && [[ "${position[6]}" == "$player" ]] && [ ${arr[4]} -eq 0 ]) ||
			     	([[ "${position[1]}" == "$player" ]] && [[ "${position[7]}" == "$player" ]] && [ ${arr[4]} -eq 0 ])
        				then
						computer_pos=4
					elif ([[ "${position[1]}" == "$player" ]] && [[ "${position[9]}" == "$player" ]] && [ ${arr[5]} -eq 0 ]) ||
                     		     	([[ "${position[2]}" == "$player" ]] && [[ "${position[8]}" == "$player" ]] && [ ${arr[5]} -eq 0 ]) ||
                     		     	([[ "${position[3]}" == "$player" ]] && [[ "${position[7]}" == "$player" ]] && [ ${arr[5]} -eq 0 ]) ||
				     	([[ "${position[4]}" == "$player" ]] && [[ "${position[6]}" == "$player" ]] && [ ${arr[5]} -eq 0 ])
						then
							computer_pos=5
						elif ([[ "${position[4]}" == "$player" ]] && [[ "${position[5]}" == "$player" ]] && [ ${arr[6]} -eq 0 ]) ||
					     	([[ "${position[3]}" == "$player" ]] && [[ "${position[9]}" == "$player" ]] && [ ${arr[6]} -eq 0 ])
							then
								computer_pos=6
							elif ([[ "${position[1]}" == "$player" ]] && [[ "${position[4]}" == "$player" ]] && [ ${arr[7]} -eq 0 ]) ||
                   				     	([[ "${position[5]}" == "$player" ]] && [[ "${position[3]}" == "$player" ]] && [ ${arr[7]} -eq 0 ]) ||
                  				     	([[ "${position[8]}" == "$player" ]] && [[ "${position[9]}" == "$player" ]] && [ ${arr[7]} -eq 0 ])
								then
									computer_pos=7
								elif ([[ "${position[2]}" == "$player" ]] && [[ "${position[5]}" == "$player" ]] && [ ${arr[8]} -eq 0 ]) ||
							     	([[ "${position[7]}" == "$player" ]] && [[ "${position[9]}" == "$player" ]] && [ ${arr[8]} -eq 0 ])
									then
										computer_pos=8
									elif ([[ "${position[1]}" == "$player" ]] && [[ "${position[5]}" == "$player" ]] && [ ${arr[9]} -eq 0 ]) ||
                                                    		     	([[ "${position[7]}" == "$player" ]] && [[ "${position[8]}" == "$player" ]] && [ ${arr[9]} -eq 0 ]) ||
                                                 		     	([[ "${position[3]}" == "$player" ]] && [[ "${position[6]}" == "$player" ]] && [ ${arr[9]} -eq 0 ])
										then
											computer_pos=9
										else
												corner
	fi
}

function corner(){
if [ ${arr[1]} -eq 0 ]
	then
		computer_pos=1
	elif [ ${arr[3]} -eq 0 ]
		then
			computer_pos=3
		elif [ ${arr[7]} -eq 0 ]
			then
				computer_pos=7
			elif [ ${arr[9]} -eq 0 ]
				then
					computer_pos=9
				elif [ ${arr[5]} -eq 0 ]
					then
						computer_pos=5
					else
						computer_pos=0
fi
}


count=0
while [ $count -lt 9 ]
do
	if [ $switchPlayer -eq 0 ]
	then
		switchPlayer=1
		read -p "Enter the position:" pos
		if [ ${arr[$pos]} -eq 0 ]
		then
			position[$pos]=$PLAYER
			val=$PLAYER
			board
			winCondition
			echo "           "
			echo "           "
                	arr[$pos]=1
		else
			board
			while [ ${arr[$pos]} -ne 0 ]
			do
				read -p "Enter available position:" pos
				position[$pos]=$PLAYER
				val=$PLAYER
				board
				winCondition
				echo "           "
				echo "           "
				arr[$pos]=1
			done
		fi
	else
		switchPlayer=0
		firstCondition
		echo "Computer choose : $computer_pos"
		position[$computer_pos]=$COMPUTER
		val=$COMPUTER
		board
		winCondition
		echo "           "
		echo "           "
		arr[$computer_pos]=1
	fi
	count=$(($count + 1))
done
