#!/bin/bash

echo "Welcome to Tic-Tac-Toe game"
declare -A position
switchPlayer=0

#initialize position for each cell in the board
for (( i=1 ; i<=9 ; i++ ))
do
        position[$i]=$i
done

#print the boaard
echo " Refer cell number as the position of the board!"
function board() {
        echo " ${position[1]} | ${position[2]} | ${position[3]}"
        echo " ${position[4]} | ${position[5]} | ${position[6]}"
        echo " ${position[7]} | ${position[8]} | ${position[9]}"
}
board

#make the position of each cell empty
for (( i=1 ; i<=9 ; i++ ))
do
        position[$i]="_"
done

#initialize value for each cell
declare -a arr
for (( j=1 ; j<=9 ; j++ ))
do
        arr[$j]=0
done

#toss to check who plays first
echo "Let's begin with a toss to check who plays first"

function toss() {
        R=$((RANDOM % 2))
        if [ $R -eq 1 ]
        then
                echo "Player win the toss!!!"
                read -p "Enter letter X or O:" CHOICE
                if [[ "$CHOICE" == "X" ]]
                then
                        player=$CHOICE
                        computer="O"
                else
                        player=$CHOICE
                        computer="X"
                fi
                switchPlayer=0
        else
                echo "Computer win the toss!!!"
                computerChoice=$((RANDOM % 2))
                if [ $computerChoice -eq 1 ]
                then
                        computer="X"
                        player="O"
                else
                        computer="O"
                        player="X"
                fi
                switchPlayer=1
        fi
        echo "Players choice:$player"
        echo "Computers choice:$computer"
        echo "Board:"
        board
}
toss

#possible winning condition for the participants
function winCondition() {
        for (( j=1 ; j<=7 ; j=$(($j+3)) ))
        do
                if ([[ "${position[$j]}" == "$val" ]] && [[ "${position[$(($j+1))]}" == "$val" ]] && [[ "${position[$(($j+2))]}" == "$val" ]])
                then
                        echo "$val wins..."
                        exit
                fi
        done
        for (( i=1 ; i<=3 ; i++ ))
        do
                if ([[ "${position[$i]}" == "$val" ]] && [[ "${position[$(($i+3))]}" == "$val" ]] && [[ "${position[$(($i+6))]}" == "$val" ]])
                then
                        echo "$val wins..."
                        exit
                fi
        done
        if ([[ "${position[1]}" == "$val" ]] && [[ "${position[5]}" == "$val" ]] && [[ "${position[9]}" == "$val" ]]) ||
           ([[ "${position[3]}" == "$val" ]] && [[ "${position[5]}" == "$val" ]] && [[ "${position[7]}" == "$val" ]])
        then
                echo "$val wins..."
                exit
        fi
}

#condition to check straight line winning conditions 
function firstCondition() {
        for (( j=1 ; j<=7 ; j=$(($j+3)) ))
        do
                if ([[ "${position[$j]}" == "$val" ]] && [[ "${position[$(($j+1))]}" == "$val" ]] && [ ${arr[$(($j+2))]} -eq 0 ])
                then
                        computer_pos=$(($j+2))
                        counter=1
                fi
                if ([[ "${position[$(($j+1))]}" == "$val" ]] && [[ "${position[$(($j+2))]}" == "$val" ]] && [ ${arr[$j]} -eq 0 ])
                then
                        computer_pos=$j
                        counter=1
                fi
                if ([[ "${position[$j]}" == "$val" ]] && [[ "${position[$(($j+2))]}" == "$val" ]] && [ ${arr[$(($j+1))]} -eq 0 ])
                then
                        computer_pos=$(($j+1))
                        counter=1
                fi
        done
        for (( i=1 ; i<=3 ; i++ ))
        do
                if ([[ "${position[$i]}" == "$val" ]] && [[ "${position[$(($i+3))]}" == "$val" ]] && [ ${arr[$(($i+6))]} -eq 0 ])
                then
                        computer_pos=$(($i+6))
                        counter=1
                fi
                if ([[ "${position[$i]}" == "$val" ]] && [[ "${position[$(($i+6))]}" == "$val" ]] && [ ${arr[$(($i+3))]} -eq 0 ])
                then
                        computer_pos=$(($i+3))
                        counter=1
                fi
                if ([[ "${position[$(($i+6))]}" == "$val" ]] && [[ "${position[$(($i+3))]}" == "$val" ]] && [ ${arr[$i]} -eq 0 ])
                then
                        computer_pos=$i
                        counter=1
                fi
        done
        if (( counter == 0 ))
        then
                daigonalWinCondition
        fi
}

<<<<<<< HEAD
=======
#check daigonal winning contions
>>>>>>> UC13-Minimizing_the_code
function daigonalWinCondition() {
        if ([[ "${position[1]}" == "$val" ]] && [[ "${position[9]}" == "$val" ]] && [ ${arr[5]} -eq 0 ]) ||
           ([[ "${position[3]}" == "$val" ]] && [[ "${position[7]}" == "$val" ]] && [ ${arr[5]} -eq 0 ])
                then
                        computer_pos=5
                        counter=1
                elif ([[ "${position[9]}" == "$val" ]] && [[ "${position[5]}" == "$val" ]] && [ ${arr[1]} -eq 0 ])
                        then
                                computer_pos=1
                                counter=1
                        elif ([[ "${position[1]}" == "$val" ]] && [[ "${position[5]}" == "$val" ]] && [ ${arr[9]} -eq 0 ])
                                then
                                        computer_pos=9
                                        counter=1
                                elif ([[ "${position[3]}" == "$val" ]] && [[ "${position[5]}" == "$val" ]] && [ ${arr[7]} -eq 0 ])
                                        then
                                                computer_pos=7
                                                counter=1
                                        elif ([[ "${position[7]}" == "$val" ]] && [[ "${position[5]}" == "$val" ]] && [ ${arr[3]} -eq o ])
                                                then
                                                        computer_pos=3
                                                        counter=1
                                                fi
        if ([[ counter -eq 0 ]] && [[ block -eq 0 ]])
        then
                block=1
                blockCondition
        fi
<<<<<<< HEAD
}

function blockCondition(){
        val=$player
        firstCondition
        if (( counter == 0 ))
        then
                corner
        fi
=======
>>>>>>> UC13-Minimizing_the_code
}

#blocking condition if player is winning
function blockCondition(){
        val=$player
        firstCondition
        if (( counter == 0 ))
        then
                corner
        fi
}

#choosing corner,center or any of the side if above conditions didn't satisfy
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
                                                while [ ${arr[$computer_pos]} -ne 0 ]
                                                do
                                                        computer_pos=$(((RANDOM % 9) + 1))
                                                done
fi
}

<<<<<<< HEAD
=======
#start of main code
>>>>>>> UC13-Minimizing_the_code
count=0
while [ $count -lt 9 ]
do
        if [ $switchPlayer -eq 0 ]
        then
                switchPlayer=1
                read -p "Enter the position:" pos
                if [ ${arr[$pos]} -eq 0 ]
                then
                        position[$pos]=$player
                        val=$player
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
                        done
                        position[$pos]=$player
                        val=$player
                        board
                        winCondition
                        echo "           "
                        echo "           "
                        arr[$pos]=1
                fi
        else
                switchPlayer=0
                val=$computer
                counter=0
                block=0
                firstCondition
                echo "Computer choose : $computer_pos"
                position[$computer_pos]=$computer
                board
                winCondition
                echo "           "
                echo "           "
                arr[$computer_pos]=1
        fi
        count=$(($count + 1))
done
