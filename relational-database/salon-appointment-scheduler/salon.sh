#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

# Welcome message
echo -e '~~ Jelle Pro Hairdressers appointment scheduler ~~'
echo -e '\nWelcome!'

# Outputs all services in services database
function SERVICE_MENU {
  if [[ $1 ]]
  then
    echo -e "\n$1"
  fi

  echo -e "Which service would you like to book?\n"
  # Show options
  SERVICES=$($PSQL "SELECT service_id, name FROM services")
  echo "$SERVICES" | while read SERVICE_ID BAR SERVICE_NAME
  do
    echo "$SERVICE_ID) $SERVICE_NAME"
  done
  # Choose service
  read SERVICE_ID_SELECTED
  SELECTED_SERVICE=$($PSQL "SELECT name FROM services WHERE service_id=$SERVICE_ID_SELECTED")
  # If not found
  if [[ -z $SELECTED_SERVICE ]]
  then
    SERVICE_MENU "That service does not exist."
  else
    echo -e "\nWhat is your phone number?"
    read CUSTOMER_PHONE
    CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")
    if [[ -z $CUSTOMER_NAME ]]
    then
      echo -e "\nNo existing profile was found for this phone number.\nWhat is your name?"
      read CUSTOMER_NAME
      INSERT_NEW_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(phone, name) VALUES('$CUSTOMER_PHONE','$CUSTOMER_NAME')") 
    fi
    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
    FORMATTED_SERVICE=$(echo $SELECTED_SERVICE | sed -E 's/^ *| *$//')
    echo -e "\nWhat time would you like to schedule your $FORMATTED_SERVICE at?"
    read SERVICE_TIME
    INSERT_APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")
    echo -e "I have put you down for a $FORMATTED_SERVICE at $SERVICE_TIME, $CUSTOMER_NAME."
  fi
}

SERVICE_MENU
