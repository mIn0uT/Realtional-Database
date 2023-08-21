#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

# empty the games and teams table when running this script
echo $($PSQL "TRUNCATE TABLE games, teams")

# read each line of 'games.csv' file separated by ','
# the variables YEAR, ROUND, etc. is used as the header column name 
cat games.csv | while IFS=',' read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  # Check if the winner team already exist in the teams table
  TEAMS=$($PSQL "SELECT name FROM teams WHERE name = '$WINNER'")
  # to check if the word is not 'winner' then it is a real name of team
  if [[ $WINNER != 'winner' ]]
  then 
    # if winner teams is not found in the teams table
    if [[ -z $TEAMS ]]
    then
    # insert the team name into the teams table
    INSERT_TEAM=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")
      # if the insert command is succesful
      if [[ $INSERT_TEAM == 'INSERT 0 1' ]]
      then
        # print a statement that the winner team is added
        echo Inserted into teams, $WINNER
      fi
    fi
  fi
  # same conditions but for opponent team
  TEAMS2=$($PSQL "SELECT name FROM teams WHERE name = '$OPPONENT'")
  if [[ $OPPONENT != 'opponent' ]]
  then 
    if [[ -z $TEAMS2 ]]
    then
    INSERT_TEAM2=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")
      if [[ $INSERT_TEAM2 == 'INSERT 0 1' ]]
      then
        echo Inserted into teams, $OPPONENT
      fi
    fi
  fi

  # check if the winner and opponent teams has a corresponding team id
  TEAM_ID_WINNER=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
  TEAM_ID_OPPONENT=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")

  # '-n' means the $variable is not empty 
  if [[ -n $TEAM_ID_WINNER || -n $TEAM_ID_OPPONENT ]]
  then
    # check if the vlaue is a word 'year'
    if [[ $YEAR != 'year' ]]
    then
      # insert the data into the games tables
      # the values is from when we read the 'games.csv' file
      INSERT_GAMES=$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES($YEAR, '$ROUND', $TEAM_ID_WINNER, $TEAM_ID_OPPONENT, $WINNER_GOALS, $OPPONENT_GOALS)")
      if [[ $INSERT_GAMES == 'INSERT 0 1' ]]
      then
        echo Inserted into teams, $YEAR
      fi
    fi
  fi
done
