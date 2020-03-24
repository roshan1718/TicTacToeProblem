#!/bin/bash -x

# @ Description: Tic Tac Toe Problem
# @ Author: Roshan Balkrushna Shinde
# @ Since: 24-03-2020 

declare -A gameBoard

playerOne="a"
computer="a"
player="a"
noOfTimePlay=0
cPosition=0
noOfRows=3
noOfColumns=3
temporaryVar=0
count=0

initializeBoard(){
	for (( row=0; row<$noOfRows; row++ )); do
		for ((column=0; column<$noOfColumns; column++ ));do
			gameBoard[$row,$column]="+"
		done
	done
}
displayBoard(){
	for (( row=0; row<$noOfRows; row++ )); do
		echo "---------------"
		for (( column=0; column<$noOfColumns; column++ )); do
			printf "[ ${gameBoard[$row,$column]} ]"
		done
		echo
	done
	echo "---------------"
}
toss()
{
	if [[ $((RANDOM%2)) -eq 0 ]]; then
		echo "Player1 Will Play First"
		startToPlay
	else
		echo "Computer Will Play First"
		temporaryVar=1
		startToPlay
	fi
}
startToPlay(){
	playerOne="X"
	computer="O"

	while [[ $noOfTimePlay -lt 9 && $checkWinFlag -eq 0 ]]
	do
		if [[ $(($noOfTimePlay%2)) -eq $temporaryVar ]]; then
			read -p "Enter Your Choice ==>" position
			player=$playerOne
		else
			computerTurn
			checkWin $playerVariable
		fi
		((noOfTimePlay++))
		case $position in
		0)
			gameBoard[0,0]=$player;;
		1)
			gameBoard[0,1]=$player;;
		2)
			gameBoard[0,2]=$player;;
		3)
			gameBoard[1,0]=$player;;
		4)
			gameBoard[1,1]=$player;;
		5)
			gameBoard[1,2]=$player;;
		6)
			gameBoard[2,0]=$player;;
		7)
			gameBoard[2,1]=$player;;
		8)
			gameBoard[2,2]=$player;;
		esac
	displayBoard
	checkWin $player
done
}
checkWin(){
	local	player=$1

	if [[ ${gameBoard[0,0]} == $player && ${gameBoard[0,1]} == $player &&  ${gameBoard[0,2]} == $player ]]; then
		checkWinFlag=1
	elif [[ ${gameBoard[1,0]} == $player && ${gameBoard[1,1]} == $player &&  ${gameBoard[1,2]} == $player ]]; then
		checkWinFlag=1
	elif [[ ${gameBoard[2,0]} == $player && ${gameBoard[2,1]} == $player &&  ${gameBoard[2,2]} == $player ]]; then
		checkWinFlag=1
	elif [[ ${gameBoard[0,0]} == $player && ${gameBoard[1,0]} == $player &&  ${gameBoard[2,0]} == $player ]]; then
		checkWinFlag=1
	elif [[ ${gameBoard[0,1]} == $player && ${gameBoard[1,1]} == $player &&  ${gameBoard[2,1]} == $player ]]; then
		checkWinFlag=1
	elif [[ ${gameBoard[0,2]} == $player && ${gameBoard[1,2]} == $player &&  ${gameBoard[2,2]} == $player ]]; then
		checkWinFlag=1
	elif [[ ${gameBoard[0,0]} == $player && ${gameBoard[1,1]} == $player &&  ${gameBoard[2,2]} == $player ]]; then
		checkWinFlag=1
	elif [[ ${gameBoard[0,2]} == $player && ${gameBoard[1,1]} == $player &&  ${gameBoard[2,0]} == $player ]]; then
		checkWinFlag=1
	fi
	if [[ $checkWinFlag -eq 1 ]]; then
		echo "$player Won.."
		displayBoard
		exit
	fi
}
computerTurn(){
	checkWinBlockPlay $computer
	return
}
checkWinBlockPlay(){
	playerVariable=$1
	
	if [[ ${gameBoard[0,0]} == "$playerVariable"  && ${gameBoard[0,1]} == "$playerVariable" && ${gameBoard[0,2]} == "+" ]]; then
		gameBoard[0,2]=$computer
	elif [[ ${gameBoard[1,0]} == "$playerVariable"  && ${gameBoard[1,1]} == "$playerVariable" && ${gameBoard[1,2]} == "+" ]]; then
		gameBoard[1,2]=$computer
	elif [[ ${gameBoard[2,0]} == "$playerVariable"  && ${gameBoard[2,1]} == "$playerVariable" && ${gameBoard[2,2]} == "+" ]]; then
		gameBoard[0,2]=$computer
	elif [[ ${gameBoard[0,0]} == "$playerVariable"  && ${gameBoard[1,0]} == "$playerVariable" && ${gameBoard[2,0]} == "+" ]]; then
		gameBoard[2,0]=$computer
	elif [[ ${gameBoard[0,1]} == "$playerVariable"  && ${gameBoard[1,1]} == "$playerVariable" && ${gameBoard[2,1]} == "+" ]]; then
		gameBoard[2,2]=$computer
	elif [[ ${gameBoard[0,2]} == "$playerVariable"  && ${gameBoard[1,2]} == "$playerVariable" && ${gameBoard[2,2]} == "+" ]]; then
		gameBoard[2,2]=$computer
	elif [[ ${gameBoard[0,0]} == "$playerVariable"  && ${gameBoard[1,1]} == "$playerVariable" && ${gameBoard[2,2]} == "+" ]]; then
		gameBoard[2,2]=$computer
	elif [[ ${gameBoard[0,2]} == "$playerVariable"  && ${gameBoard[1,1]} == "$playerVariable" && ${gameBoard[2,0]} == "+" ]]; then
		gameBoard[2,0]=$computer
	elif [[ ${gameBoard[0,0]} == "+"  && ${gameBoard[0,1]} == "$playerVariable" && ${gameBoard[0,2]} == "$playerVariable" ]]; then
		gameBoard[0,0]=$computer
	elif [[ ${gameBoard[1,0]} == "+"  && ${gameBoard[1,1]} == "$playerVariable" && ${gameBoard[1,2]} == "$playerVariable" ]]; then
		gameBoard[1,0]=$computer
	elif [[ ${gameBoard[2,0]} == "+"  && ${gameBoard[2,1]} == "$playerVariable" && ${gameBoard[2,2]} == "$playerVariable" ]]; then
		gameBoard[2,0]=$computer
	elif [[ ${gameBoard[0,0]} == "+"  && ${gameBoard[1,0]} == "$playerVariable" && ${gameBoard[2,0]} == "$playerVariable" ]]; then
		gameBoard[0,0]=$computer
	elif [[ ${gameBoard[0,1]} == "+"  && ${gameBoard[1,1]} == "$playerVariable" && ${gameBoard[2,1]} == "$playerVariable" ]]; then
		gameBoard[0,1]=$computer
	elif [[ ${gameBoard[0,2]} == "+"  && ${gameBoard[1,2]} == "$playerVariable" && ${gameBoard[2,2]} == "$playerVariable" ]]; then
		gameBoard[0,2]=$computer
	elif [[ ${gameBoard[0,0]} == "+"  && ${gameBoard[1,1]} == "$playerVariable" && ${gameBoard[2,2]} == "$playerVariable" ]]; then
		gameBoard[0,0]=$computer
	elif [[ ${gameBoard[0,2]} == "+"  && ${gameBoard[1,1]} == "$playerVariable" && ${gameBoard[2,0]} == "$playerVariable" ]]; then
		gameBoard[0,2]=$computer
	elif [[ ${gameBoard[0,0]} == "$playerVariable"  && ${gameBoard[0,1]} == "+" && ${gameBoard[0,2]} == "$playerVariable" ]]; then
		gameBoard[0,1]=$computer
	elif [[ ${gameBoard[1,0]} == "$playerVariable"  && ${gameBoard[1,1]} == "+" && ${gameBoard[1,2]} == "$playerVariable" ]]; then
		gameBoard[1,2]=$computer
	elif [[ ${gameBoard[2,0]} == "$playerVariable"  && ${gameBoard[2,1]} == "+" && ${gameBoard[2,2]} == "$playerVariable" ]]; then
		gameBoard[2,1]=$computer
	elif [[ ${gameBoard[1,0]} == "$playerVariable"  && ${gameBoard[1,0]} == "+" && ${gameBoard[2,0]} == "$playerVariable" ]]; then
		gameBoard[2,0]=$computer
	elif [[ ${gameBoard[0,1]} == "$playerVariable"  && ${gameBoard[1,1]} == "+" && ${gameBoard[2,1]} == "$playerVariable" ]]; then
		gameBoard[1,1]=$computer
	elif [[ ${gameBoard[0,2]} == "$playerVariable"  && ${gameBoard[1,2]} == "+" && ${gameBoard[2,2]} == "$playerVariable" ]]; then
		gameBoard[1,2]=$computer
	elif [[ ${gameBoard[0,0]} == "$playerVariable"  && ${gameBoard[1,1]} == "+" && ${gameBoard[2,2]} == "$playerVariable" ]]; then
		gameBoard[1,1]=$computer
	elif [[ ${gameBoard[0,2]} == "$playerVariable"  && ${gameBoard[1,1]} == "+" && ${gameBoard[2,0]} == "$playerVariable" ]]; then
		gameBoard[1,1]=$computer
	elif [[ $count -eq 0 ]] ; then
		((count++))
		checkWinBlockPlay $playerOne
#Corners
	elif [[ ${gameBoard[0,0]} == "+" ]]; then
		gameBoard[0,0]=$computer
	elif [[ ${gameBoard[0,2]} == "+" ]]; then
		gameBoard[0,2]=$computer
	elif [[ ${gameBoard[2,0]} == "+" ]]; then
		gameBoard[2,0]=$computer
	elif [[ ${gameBoard[2,2]} == "+" ]]; then
		gameBoard[2,2]=$computer
#Center
	elif [[ ${gameBoard[1,1]} == "+" ]]; then
		gameBoard[1,1]=$computer
	else
		generatedNum=$((RANDOM%9))
		row=$(($generatedNum/3))
		column=$(($generatedNum%3))
		
		if [[ ${gameBoard[$row,$column]} ==  $playerOne || ${gameBoard[$row,$column]} == $computer ]]; then
			computerTurn
		else
			gameBoard[$row,$column]=$computer
			return
		fi
	fi
	
}

wantToPlay(){
	read -p "Would You Like To Start game Y/N ?" isStart
	if [[ $isStart == Y || $isStart == y ]]; then
		read -p "Would You Like To Toss..? Y/N " isToss
		if [[ $isToss == Y || $isToss == y ]]; then
			toss
		else
			echo "Okay..Starting Game"
			startToPlay
		fi
	else
		echo "Exiting.."
		exit
	fi
}
initializeBoard
displayBoard
wantToPlay
