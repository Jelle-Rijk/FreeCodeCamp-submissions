PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"


if [[ $1 ]]
then
  if [[ $1 =~ ^[0-9]+$ ]]
  then
  GET_ATOM_RESULT=$($PSQL "SELECT atomic_number, symbol, name, type, atomic_mass, melting_point_celsius, boiling_point_celsius FROM elements INNER JOIN properties USING(atomic_number) INNER JOIN types USING(type_id) WHERE atomic_number=$1")
  else
  GET_ATOM_RESULT=$($PSQL "SELECT atomic_number, symbol, name, type, atomic_mass, melting_point_celsius, boiling_point_celsius FROM elements INNER JOIN properties USING(atomic_number) INNER JOIN types USING(type_id) WHERE symbol='$1' OR name='$1'")
  fi

  if [[ -z $GET_ATOM_RESULT ]]
  then
  echo "I could not find that element in the database."
  else
  echo $GET_ATOM_RESULT | sed -E 's/\|/ /g' | while read ATOMIC_NUMBER SYMBOL NAME TYPE ATOMIC_MASS MELTING_POINT_CELSIUS BOILING_POINT_CELSIUS
    do
    echo -e "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT_CELSIUS celsius and a boiling point of $BOILING_POINT_CELSIUS celsius."
    done
  fi
else
echo "Please provide an element as an argument."
fi