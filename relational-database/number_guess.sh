#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=number_guess -t --no-align -c"

# LOGIN SEQUENCE
echo -e "\n~~ GUESS THE NUMBER ~~\n"
echo "Enter your username:"
read USERNAME
GET_USER_RESULT=$($PSQL "SELECT * FROM users WHERE username='$USERNAME'")

if [[ -z $GET_USER_RESULT ]]
then
  echo -e "\nWelcome, $USERNAME! It looks like this is your first time here."
  INSERT_NEW_USER=$($PSQL "INSERT INTO users(username) VALUES('$USERNAME')")
  GET_USER_RESULT=$($PSQL "SELECT * FROM users WHERE username='$USERNAME'")
else
echo $($PSQL "SELECT games_played, best_game FROM users WHERE username='$USERNAME'") | sed -E 's/\|/ /g' | while read GAMES_PLAYED BEST_GAME
  do
    echo -e "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
  done  
fi

# WIN GAME SEQUENCE
function WIN_GAME {
  RECORD=$($PSQL "SELECT best_game FROM users WHERE username='$USERNAME'")
  if [[ -z $BEST_GAME || $BEST_GAME -gt $NUMBER_OF_GUESSES ]]
  then
    SET_NEW_RECORD=$($PSQL "UPDATE users SET best_game = $NUMBER_OF_GUESSES WHERE username='$USERNAME'")
  fi
  UPDATE_GAMES_PLAYED=$($PSQL "UPDATE users SET games_played = $((GAMES_PLAYED+1)) WHERE username='$USERNAME'")
}


# GAME SEQUENCE
function GUESS_NUMBER {
  if [[ $1 ]]
  then
    echo -e $1
  else
    RANDOM_NUMBER=$((1 + $RANDOM % 1000))
    NUMBER_OF_GUESSES=0
    echo -e "\nGuess the secret number between 1 and 1000:"
  fi
  read GUESS
  NUMBER_OF_GUESSES=$((NUMBER_OF_GUESSES+1))

  if [[ $GUESS =~ ^[0-9]+$ ]]
  then
    if [[ $GUESS == $RANDOM_NUMBER ]]
    then
      WIN_GAME $NUMBER_OF_GUESSES $GUESS
      echo -e "\nYou guessed it in $NUMBER_OF_GUESSES tries. The secret number was $RANDOM_NUMBER. Nice job!"
    else
      if (( $GUESS > $RANDOM_NUMBER ))
      then
        GUESS_NUMBER "\nIt's lower than that, guess again:"
      else
        GUESS_NUMBER "\nIt's higher than that, guess again:"
      fi
    fi
  else
    GUESS_NUMBER "\nThat is not an integer, guess again:"
  fi
}

GUESS_NUMBER