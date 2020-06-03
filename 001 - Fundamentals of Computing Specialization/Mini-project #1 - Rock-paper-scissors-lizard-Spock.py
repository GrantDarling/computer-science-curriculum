import random

# helper functions
def name_to_number(name):
    
    if(name == "rock"):
        number = 0
        return number
    elif(name == "Spock"):
        number = 1
        return number
    elif(name == "paper"):
        number = 2
        return number
    elif(name == "lizard"):
        number = 3
        return number
    elif(name == "scissors"):
        number = 4
        return number
    else:
        return "Invalid Name Input"

def number_to_name(number):
   
    if(number == 0):
        name = "rock"
        return name
    elif(number == 1):
        name = "Spock"
        return name
    elif(number == 2):
        name = "paper"
        return name
    elif(number == 3):
        name = "lizard"
        return name
    elif(number == 4):
        name = "scissors"
        return name
    else:
        return "Invalid Name Input"

# Play game
def rpsls(player_choice): 

    player_number = name_to_number(player_choice)
    comp_number = random.randrange(0,5)
    comp_choice = number_to_name(comp_number)
    check_winner = (player_number - comp_number) % 5
    
    print
    print "The Player Chose", player_choice
    print "The Opponent Chose", comp_choice
    print 
    print 

    if(0 < check_winner <= 2):
        print "Player won!"
    elif(check_winner > 2):
        print "Opponent won!"
    else:
        print "It's a tie!"
    
# test your code
rpsls("rock")
rpsls("Spock")
rpsls("paper")
rpsls("lizard")
rpsls("scissors")