#!/bin/bash -x

# @ Description: Tic Tac Toe Problem
# @ Author: Roshan Balkrushna Shinde
# @ Since: 23-03-2020 

declare -A board

# Variables
player="a"
turn=0
noOfRows=3
noOfColumns=3

initializeBoard(){
	for (( row=1; row<=$noOfRows; row++ )) 
	do
		for ((column=1; column<=$noOfColumns; column++ ))	
		do
			board[$row,$column]="-"
		done
	done
}

displayBoard(){
	for (( row=1; row<=$noOfRows; row++ ))
	do
		echo "---------------"
		for (( column=1; column<=$noOfColumns; column++ ))
		do
			printf "[ ${board[$row,$column]} ]"
		done
		echo
	done
	echo "---------------"
}

letterAssign(){
	read -p "Enter the PlayerOne Letter ::" letter
		if (( letter == X )) 
		then
			playerOne="X"
			playerTwo="O"
		else
			playerOne="O"
			playerTwo="X"
		fi
}

toss(){
	if [[ $((RANDOM%2)) -eq 0 ]]; then
		echo "Player1 Will Play First"
	else
		echo "Player2 Will Play First"
	fi
}

startToPlay(){
letterAssign
	while [[ $turn -lt 9 && isWon -eq 0 ]]
	do
		if [[ $(($turn%2)) -eq 0 ]]; then
			read -p "Player 1 Enter Position" position
			player=$playerOne
		else
			read -p "Player 2 Enter Position" position
			player=$playerTwo
		fi
		case $position in
			1)
				board[1,1]=$player;;
			2)
				board[1,2]=$player;;
			3)
				board[1,3]=$player;;
			4)
				board[2,1]=$player;;
			5)
				board[2,2]=$player;;
			6)
				board[2,3]=$player;;
			7)
				board[3,1]=$player;;
			8)
				board[3,2]=$player;;
			9)
            board[3,3]=$player;;
			*)
				echo Invalid Position
				((turn--));;
		esac
		((turn++))
		checkWin
		displayBoard
		if [[ $player -eq X && $isWon -eq 1 ]]
		then
			echo "Player 1 Won.."
		elif [[ $player -eq O && $isWon -eq 1 ]]
		then
			echo "Player 2 Won.."
		fi
		if [[ $turn -eq 9 ]]; 
		then
			echo "Match Tied"
		fi
	done
}

checkWin(){
	if [[ ${board[1,1]} == $player && ${board[1,2]} == $player &&  ${board[1,3]} == $player ]]; then
		isWon=1
	elif [[ ${board[2,1]} == $player && ${board[2,2]} == $player &&  ${board[2,3]} == $player ]]; then
		isWon=1
	elif [[ ${board[3,1]} == $player && ${board[3,2]} == $player &&  ${board[3,3]} == $player ]]; then
		isWon=1
	elif [[ ${board[1,1]} == $player && ${board[2,1]} == $player &&  ${board[3,1]} == $player ]]; then
		isWon=1
	elif [[ ${board[1,2]} == $player && ${board[2,2]} == $player &&  ${board[3,2]} == $player ]]; then
		isWon=1
	elif [[ ${board[1,3]} == $player && ${board[2,3]} == $player &&  ${board[3,3]} == $player ]]; then
		isWon=1
	elif [[ ${board[1,1]} == $player && ${board[2,2]} == $player &&  ${board[3,3]} == $player ]]; then
		isWon=1
	elif [[ ${board[1,3]} == $player && ${board[2,2]} == $player &&  ${board[3,3]} == $player ]]; then
		isWon=1
	fi
	if [[ $turns -eq 9 ]]
	then
		echo "Match Tied"
	fi
}

wantToPlay(){
	read -p "Would You Like To Toss Y/N ?" isToss
	if [[ $isToss == Y || $isToss == y ]]; then
		echo "Player 1 Will Play First"
		startToPlay
	else
		echo "Okay..Starting Game"
		startToPlay
	fi
}

initializeBoard
displayBoard
wantToPlay

