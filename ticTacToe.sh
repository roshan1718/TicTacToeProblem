#!/bin/bash -x

# @ Description: Tic Tac Toe Problem
# @ Author: Roshan Balkrushna Shinde
# @ Since: 24-03-2020 

declare -A gameBoard

playerOne="X"
computer="O"
player="a"
noOfTimePlay=0
noOfRows=3
noOfColumns=3
temporaryVar=0

initializeBoard(){
	for (( row=0; row<$noOfRows; row++ )); do
		for ((column=0; column<$noOfColumns; column++ ));do
			gameBoard[$row,$column]="+"
		done
	done
	echo "Player1 ==> X"
	echo "Player2 ==> O" 
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
	while [[ $noOfTimePlay -lt 9 && $checkWinFlag -eq 0 ]]
	do
		if [[ $(($noOfTimePlay%2)) -eq $temporaryVar ]]; then
			read -p "Enter Your Choice ==>" position
			player=$playerOne
		else
			echo "Computer turn"
			computerTurn
			checkWin $computer

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
	if [[ $player == X && $checkWinFlag -eq 1 ]]; then
		echo "Player1 Won.."
		displayBoard
		exit
	elif [[ $player == O && $checkWinFlag -eq 1 ]]; then
		echo "Computer Won.."
		displayBoard
		exit
	elif [[ $noOfTimePlay -eq 9 ]]; then
		echo "Match Tied.."
	fi
}
computerTurn(){
	checkWinBlockPlay 
	return
}
checkWinBlockPlay(){

	if [[ ${gameBoard[0,0]} == "$computer"  && ${gameBoard[0,1]} == "$Computer" && ${gameBoard[0,2]} == "+" ]]; then
		gameBoard[0,2]=$computer 
		return
	elif [[ ${gameBoard[1,0]} == "$computer"  && ${gameBoard[1,1]} == "$computer" && ${gameBoard[1,2]} == "+" ]]; then
		gameBoard[1,2]=$computer
		return
	elif [[ ${gameBoard[2,0]} == "$computer"  && ${gameBoard[2,1]} == "$computer" && ${gameBoard[2,2]} == "+" ]]; then
		gameBoard[0,2]=$computer
		return
	elif [[ ${gameBoard[0,0]} == "$computer"  && ${gameBoard[1,0]} == "$computer" && ${gameBoard[2,0]} == "+" ]]; then
		gameBoard[2,0]=$computer
		return
	elif [[ ${gameBoard[0,1]} == "$computer"  && ${gameBoard[1,1]} == "$computer" && ${gameBoard[2,1]} == "+" ]]; then
		gameBoard[2,2]=$computer
		return
	elif [[ ${gameBoard[0,2]} == "$computer"  && ${gameBoard[1,2]} == "$computer" && ${gameBoard[2,2]} == "+" ]]; then
		gameBoard[2,2]=$computer
		return
	elif [[ ${gameBoard[0,0]} == "$computer"  && ${gameBoard[1,1]} == "$computer" && ${gameBoard[2,2]} == "+" ]]; then
		gameBoard[2,2]=$computer
		return
	elif [[ ${gameBoard[0,2]} == "$computer"  && ${gameBoard[1,1]} == "$computer" && ${gameBoard[2,0]} == "+" ]]; then
		gameBoard[2,0]=$computer
		return
	elif [[ ${gameBoard[0,0]} == "+"  && ${gameBoard[0,1]} == "$computer" && ${gameBoard[0,2]} == "$computer" ]]; then
		gameBoard[0,0]=$computer
		return
	elif [[ ${gameBoard[1,0]} == "+"  && ${gameBoard[1,1]} == "$computer" && ${gameBoard[1,2]} == "$computer" ]]; then
		gameBoard[1,0]=$computer
		return
	elif [[ ${gameBoard[2,0]} == "+"  && ${gameBoard[2,1]} == "$computer" && ${gameBoard[2,2]} == "$computer" ]]; then
		gameBoard[2,0]=$computer
		return
	elif [[ ${gameBoard[0,0]} == "+"  && ${gameBoard[1,0]} == "$computer" && ${gameBoard[2,0]} == "$computer" ]]; then
		gameBoard[0,0]=$computer
		return
	elif [[ ${gameBoard[0,1]} == "+"  && ${gameBoard[1,1]} == "$computer" && ${gameBoard[2,1]} == "$computer" ]]; then
		gameBoard[0,1]=$computer
		return
	elif [[ ${gameBoard[0,2]} == "+"  && ${gameBoard[1,2]} == "$computer" && ${gameBoard[2,2]} == "$computer" ]]; then
		gameBoard[0,2]=$computer
		return
	elif [[ ${gameBoard[0,0]} == "+"  && ${gameBoard[1,1]} == "$computer" && ${gameBoard[2,2]} == "$computer" ]]; then
		gameBoard[0,0]=$computer
		return
	elif [[ ${gameBoard[0,2]} == "+"  && ${gameBoard[1,1]} == "$computer" && ${gameBoard[2,0]} == "$computer" ]]; then
		gameBoard[0,2]=$computer
		return
	elif [[ ${gameBoard[0,0]} == "$computer"  && ${gameBoard[0,1]} == "+" && ${gameBoard[0,2]} == "$computer" ]]; then
		gameBoard[0,1]=$computer
		return
	elif [[ ${gameBoard[1,0]} == "$computer"  && ${gameBoard[1,1]} == "+" && ${gameBoard[1,2]} == "$computer" ]]; then
		gameBoard[1,2]=$computer
		return
	elif [[ ${gameBoard[2,0]} == "$computer"  && ${gameBoard[2,1]} == "+" && ${gameBoard[2,2]} == "$computer" ]]; then
		gameBoard[2,1]=$computer
		return
	elif [[ ${gameBoard[1,0]} == "$computer"  && ${gameBoard[1,0]} == "+" && ${gameBoard[2,0]} == "$computer" ]]; then
		gameBoard[2,0]=$computer
		return
	elif [[ ${gameBoard[0,1]} == "$computer"  && ${gameBoard[1,1]} == "+" && ${gameBoard[2,1]} == "$computer" ]]; then
		gameBoard[1,1]=$computer
		return
	elif [[ ${gameBoard[0,2]} == "$computer"  && ${gameBoard[1,2]} == "+" && ${gameBoard[2,2]} == "$computer" ]]; then
		gameBoard[1,2]=$computer
		return
	elif [[ ${gameBoard[0,0]} == "$computer"  && ${gameBoard[1,1]} == "+" && ${gameBoard[2,2]} == "$computer" ]]; then
		gameBoard[1,1]=$computer
		return
	elif [[ ${gameBoard[0,2]} == "$computer"  && ${gameBoard[1,1]} == "+" && ${gameBoard[2,0]} == "$computer" ]]; then
		gameBoard[1,1]=$computer
		return
#playerOne	
	elif [[ ${gameBoard[0,0]} == "$playerOne"  && ${gameBoard[0,1]} == "$playerOne" && ${gameBoard[0,2]} == "+" ]]; then
		gameBoard[0,2]=$computer
	elif [[ ${gameBoard[1,0]} == "$playerOne"  && ${gameBoard[1,1]} == "$playerOne" && ${gameBoard[1,2]} == "+" ]]; then
		gameBoard[1,2]=$computer
	elif [[ ${gameBoard[2,0]} == "$playerOne"  && ${gameBoard[2,1]} == "$playerOne" && ${gameBoard[2,2]} == "+" ]]; then
		gameBoard[2,2]=$computer
	elif [[ ${gameBoard[0,0]} == "$playerOne"  && ${gameBoard[1,0]} == "$playerOne" && ${gameBoard[2,0]} == "+" ]]; then
		gameBoard[2,0]=$computer
	elif [[ ${gameBoard[0,1]} == "$playerOne"  && ${gameBoard[1,1]} == "$playerOne" && ${gameBoard[2,1]} == "+" ]]; then
		gameBoard[2,1]=$computer
	elif [[ ${gameBoard[0,2]} == "$playerOne"  && ${gameBoard[1,2]} == "$playerOne" && ${gameBoard[2,2]} == "+" ]]; then
		gameBoard[2,2]=$computer
	elif [[ ${gameBoard[0,0]} == "$playerOne"  && ${gameBoard[1,1]} == "$playerOne" && ${gameBoard[2,2]} == "+" ]]; then
		gameBoard[2,2]=$computer
	elif [[ ${gameBoard[0,2]} == "$playerOne"  && ${gameBoard[1,1]} == "$playerOne" && ${gameBoard[2,0]} == "+" ]]; then
		gameBoard[2,0]=$computer
	elif [[ ${gameBoard[0,0]} == "+"  && ${gameBoard[0,1]} == "$playerOne" && ${gameBoard[0,2]} == "$playerOne" ]]; then
		gameBoard[0,0]=$computer
	elif [[ ${gameBoard[1,0]} == "+"  && ${gameBoard[1,1]} == "$playerOne" && ${gameBoard[1,2]} == "$playerOne" ]]; then
		gameBoard[1,0]=$computer
	elif [[ ${gameBoard[2,0]} == "+"  && ${gameBoard[2,1]} == "$playerOne" && ${gameBoard[2,2]} == "$playerOne" ]]; then
		gameBoard[2,0]=$computer
	elif [[ ${gameBoard[0,0]} == "+"  && ${gameBoard[1,0]} == "$playerOne" && ${gameBoard[2,0]} == "$playerOne" ]]; then
		gameBoard[0,0]=$computer
	elif [[ ${gameBoard[0,1]} == "+"  && ${gameBoard[1,1]} == "$playerOne" && ${gameBoard[2,1]} == "$playerOne" ]]; then
		gameBoard[0,1]=$computer
	elif [[ ${gameBoard[0,2]} == "+"  && ${gameBoard[1,2]} == "$playerOne" && ${gameBoard[2,2]} == "$playerOne" ]]; then
		gameBoard[0,2]=$computer
	elif [[ ${gameBoard[0,0]} == "+"  && ${gameBoard[1,1]} == "$playerOne" && ${gameBoard[2,2]} == "$playerOne" ]]; then
		gameBoard[0,0]=$computer
	elif [[ ${gameBoard[0,2]} == "+"  && ${gameBoard[1,1]} == "$playerOne" && ${gameBoard[2,0]} == "$playerOne" ]]; then
		gameBoard[0,2]=$computer
	elif [[ ${gameBoard[0,0]} == "$playerOne"  && ${gameBoard[0,1]} == "+" && ${gameBoard[0,2]} == "$playerOne" ]]; then
		gameBoard[0,1]=$computer
	elif [[ ${gameBoard[1,0]} == "$playerOne"  && ${gameBoard[1,1]} == "+" && ${gameBoard[1,2]} == "$playerOne" ]]; then
		gameBoard[1,1]=$computer
	elif [[ ${gameBoard[2,0]} == "$playerOne"  && ${gameBoard[2,1]} == "+" && ${gameBoard[2,2]} == "$playerOne" ]]; then
		gameBoard[2,1]=$computer
	elif [[ ${gameBoard[0,0]} == "$playerOne"  && ${gameBoard[1,0]} == "+" && ${gameBoard[2,0]} == "$playerOne" ]]; then
		gameBoard[1,0]=$computer
	elif [[ ${gameBoard[0,1]} == "$playerOne"  && ${gameBoard[1,1]} == "+" && ${gameBoard[2,1]} == "$playerOne" ]]; then
		gameBoard[1,1]=$computer
	elif [[ ${gameBoard[0,2]} == "$playerOne"  && ${gameBoard[1,2]} == "+" && ${gameBoard[2,2]} == "$playerOne" ]]; then
		gameBoard[1,2]=$computer
	elif [[ ${gameBoard[0,0]} == "$playerOne"  && ${gameBoard[1,1]} == "+" && ${gameBoard[2,2]} == "$playerOne" ]]; then
		gameBoard[1,1]=$computer
	elif [[ ${gameBoard[0,2]} == "$playerOne"  && ${gameBoard[1,1]} == "+" && ${gameBoard[2,0]} == "$playerOne" ]]; then
		gameBoard[1,1]=$computer


#Corners
	elif [[ ${gameBoard[0,0]} == "+" ]]; then
		gameBoard[0,0]=$computer
		return
	elif [[ ${gameBoard[0,2]} == "+" ]]; then
		gameBoard[0,2]=$computer
		return
	elif [[ ${gameBoard[2,0]} == "+" ]]; then
		gameBoard[2,0]=$computer
		return
	elif [[ ${gameBoard[2,2]} == "+" ]]; then
		gameBoard[2,2]=$computer
		return
#Center
	elif [[ ${gameBoard[1,1]} == "+" ]]; then
		gameBoard[1,1]=$computer
		return
#Sides
	elif [[ ${gameBoard[0,1]} == "+" ]]; then
		gameBoard[0,1]=$computer
		return
	elif [[ ${gameBoard[1,0]} == "+" ]]; then
		gameBoard[1,0]=$computer
		return
	elif [[ ${gameBoard[1,2]} == "+" ]]; then
		gameBoard[1,2]=$computer
		return
	elif [[ ${gameBoard[2,1]} == "+" ]]; then
		gameBoard[2,1]=$computer
		return
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
