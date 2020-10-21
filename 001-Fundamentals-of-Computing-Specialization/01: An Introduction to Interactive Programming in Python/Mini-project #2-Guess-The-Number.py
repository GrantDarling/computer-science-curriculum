'''
READ ME: 

Unfortunately, the remaining projects in this course require a library accessed only through the course 
website sandbox. If you would like to play this game you can view it here: http://www.codeskulptor.org/#user47_WrxHGCVrsK_6.py
If this link has been removed in the backend, you can always play the game by coming here: http://www.codeskulptor.org/, removing the code and
replacing it with my code below:

Side Note: The instructors said to use global variables in this case.

Thanks for understanding :)
'''
# input will come from buttons and an input field
# all output for the game will be printed in the console
import simplegui
import random
import math
   
def new_game():
    global secret_number
    secret_number = random.randrange(0, 100)




# define event handlers for control panel
def calculate_attempts(number):
'''Calculates the number of attempts so you only have 
the maximum amount of guesses to win using binary search'''

    global attempts
    attempts = math.ceil(math.log(number, 2))
    print "You have", int(attempts), "attempt to win."
    print "Please only guess whole numbers. Good Luck!"
    print
    
def range100():
    global secret_number
    secret_number = random.randrange(0, 100)
    calculate_attempts(100)
    print "guess the number between 1 and 100"

def range1000():
    global secret_number
    secret_number = random.randrange(0, 1000)
    calculate_attempts(1000)
    print "guess the number between 1 and 1000"
    
def decrement_attempts():
    global attempts 
    attempts -= 1
        
def input_attempts(): 
    global attempts
    decrement_attempts()
    print "Attempts remaining", int(attempts)
    
def input_guess(guess):
    input_attempts()      
    guess = int(guess)
    
    if(attempts <= 0):
        print
        print "Game Over! You Lose."
        print
        print
    elif(guess > secret_number):
        print "Lower"
    elif(guess < secret_number):
        print "Higher"
    else:
        print "Correct"
        
# create frame
frame = simplegui.create_frame('Guess The Number', 200, 200, 300)

# register event handlers for control elements and start frame
guess = frame.add_input('Guess The Number', input_guess, 200)
start100 = frame.add_button('Range is [0,100)', range100, 75)
start1000 = frame.add_button('Range is [0,1000)', range1000, 75)
frame.start()

# call new_game 
new_game()
