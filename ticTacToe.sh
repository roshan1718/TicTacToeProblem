#!/bin/bash -x

# @ Description: Tic Tac Toe Problem
# @ Author: Roshan Balkrushna Shinde
# @ Since: 23-03-2020 

# Use Case 1

declare -A board

# Variables

noOfRows=3
noOfColumns=3

initializeBoard()
{
	for (( row=1; row<=$noOfRows; row++ ))
	do
		for ((column=1; column<=$noOfColumns; column++ ))
		do
			board[row,column]="+"
		done
	done
}

displayBoard()
{
	initializeBoard

	for (( row=1; row<=$noOfRows; row++ ))
	do
		echo "---------------"
		for (( column=1; column<=$noOfColumns; column++ ))
		do
			printf "| ${board[row,column]} |"
		done
		echo
	done
	echo "---------------"

}


letterAssign(){
	if [[ $((RANDOM%2)) -eq 0 ]];	then
		playerOne=X
		PlayerTwo=O
		echo "Player1 ==> X"
		echo "Player2 ==> O"
	else
		playerOne=O
      PlayerTwo=X
      echo "Player1 ==> O"
      echo "Player2 ==> X"
	fi
}
initializeBoard
displayBoard
letterAssign
