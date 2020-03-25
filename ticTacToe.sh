#!/bin/bash -x

# @ Description: Tic Tac Toe Problem
# @ Author: Roshan Balkrushna Shinde 
# @ Version: 18.04.3 lts
# @ Since: 25 March 2020 

declare -A gameBoard

BOARDSIZE=0
PLAYERONE="X"
COMPUTER="O"
TOTALCELLS=0

player="a"
noOfTimePlay=0
temporaryVar=0
row=0
column=0


initializeBoard()
{
	read -p"Enter Game Board Size, You Want To Play " BOARDSIZE
	for (( row=1; row<=$BOARDSIZE; row++ ))
	do
		for ((column=1; column<=$BOARDSIZE; column++ ))
		do
			gameBoard[$row,$column]="-"
		done
	done
	TOTALCELLS=$(($BOARDSIZE*$BOARDSIZE))
}
displayBoard()
{
	for (( row=1; row<=$BOARDSIZE; row++ ))
	do
		for (( column=1; column<=$BOARDSIZE; column++ ))
		do
			printf "| ${gameBoard[$row,$column]} |"
		done
		echo
	done
}
setSign()
{
	if [[ $((RANDOM%2)) -eq 0 ]]
	then
		echo
		echo "Player1 ==> X"
		echo "Player2 ==> O"
		PLAYERONE="X"
		PLAYERTWO="O"
	else
		echo
		echo "Player1 ==> X"
      		echo "Player2 ==> O"
	fi
}
toss()
{
	if [[ $((RANDOM%2)) -eq 0 ]]
	then
		echo "Player1 Won Toss.. Player1 Will Play First"
		startToPlay
	else
		echo "COMPUTER Won Toss.. COMPUTER Will Play First"
		temporaryVar=1
		startToPlay
	fi
}
startToPlay()
{
while [[ $noOfTimePlay -lt $TOTALCELLS ]]
do
	if [[ $(($noOfTimePlay%2)) -eq $temporaryVar ]]
	then
		echo
		echo "Player 1 Turn"
		read -p "Enter Your Choice ==>" position
		userTurn $position $PLAYERONE
		player=$PLAYERONE
	else
		echo
		echo "COMPUTER Turn"
		computerTurn $COMPUTER
		player=$COMPUTER
	fi
	((noOfTimePlay++))
	displayBoard
	checkWin $player
done
}
checkWin()
{
	local player=$1
	local digonalCheck1=0
	local digonalCheck2=0
	for (( row=1; row<=$BOARDSIZE; row++ ))
	do
		local horizontalCheck=0
		local verticalCheck=0
		for (( column=1; column<=$BOARDSIZE; column++))
		do
			if [[ ${gameBoard[$row,$column]} == $player ]]
			then
				((horizontalCheck++))
			fi
			if [[ ${gameBoard[$column,$row]} == $player ]]
			then
            			((verticalCheck++))
			fi
			if [[ $row -eq $column ]]
			then
			 	if [[ ${gameBoard[$row,$column]} == $player ]]
				then
			       		((digonalCheck1++))
			    	fi
			 fi
			if [[ $(($row + $column)) -eq $(($BOARDSIZE+1)) ]]
			then
			        if [[ ${gameBoard[$row,$column]} == $player ]]
				then
				  ((digonalCheck2++))
			       fi
			 fi
      		done
		if [[ $horizontalCheck -eq $BOARDSIZE || $verticalCheck -eq $BOARDSIZE || $digonalCheck1 -eq $BOARDSIZE || $digonalCheck2 -eq $BOARDSIZE ]]
		then
		       checkWinFlag=1
		       checkWinner
      		fi
	done
}
userTurn()
{
	local position=$1
	local player=$2
	row=$(($(($position-1))/$BOARDSIZE))
	column=$(($(($position-1))%$BOARDSIZE))

	if [[ ${gameBoard[$(($row+1)),$(($column+1))]} == X || ${gameBoard[$(($row+1)),$(($column+1))]} == O || $position -gt $TOTALCELLS ]]
	then
	   	echo "Sorry Position Occupied / Invalid Cell Number"
      		((noOfTimePlay--))
		userTurn
	else
		gameBoard[$(($row+1)),$(($column+1))]=$player
	fi
	return
}
computerTurn(){
		local player=$1

		randomGeneratedNumber=$((RANDOM%$TOTALCELLS+1))
		row=$(($(($randomGeneratedNumber-1))/$BOARDSIZE))
   		column=$(($(($randomGeneratedNumber-1))%$BOARDSIZE))

		if [[ ${gameBoard[$(($row+1)),$(($column+1))]} == - ]]
		then
		   	gameBoard[$(($row+1)),$(($column+1))]=$player
		else
			computerTurn $player
		fi
}
checkWinner(){
	if [[  $checkWinFlag -eq 1 ]]
	then
		echo
		echo "Player $player Won.."
		displayBoard
		exit
	elif [[ $noOfTimePlay -eq $(($BOARDSIZE*$BOARDSIZE)) ]]; then
		echo "Match Tied.."
	fi
}
wantToPlay(){
	read -p "Would You Like To Toss..? Y/N " isToss
	if [[ $isToss == Y || $isToss == y ]]; then
		toss
	else
		echo "Okay..Starting Game"
		startToPlay
	fi
}
initializeBoard
displayBoard
setSign
#wantToPlay
toss
