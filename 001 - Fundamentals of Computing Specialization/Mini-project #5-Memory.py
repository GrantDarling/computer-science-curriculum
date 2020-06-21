'''
READ ME: 

Unfortunately, the remaining projects in this course require a library accessed only through the course 
website sandbox. If you would like to play this game you can view it here: http://www.codeskulptor.org/#user47_jMcPFvS5uv_13.py
If this link has been removed in the backend you can always play the game by going going here, removing the code and
replacing it with my code: http://www.codeskulptor.org/

The goal of the game is to match each integer that is the same. There are always one set of integers and you can only reveal two cards at a time.
Side Note: The instructors said to use global variables in this case.

Thanks for understanding :)
'''

import simplegui
import random
import math

#Create the deck
cards_side1 = [0,1,2,3,4,5,6,7,8,9]
cards_side2 = list(cards_side1)
cards = cards_side1 + cards_side2

#Create game canvas size
HEIGHT = 100
WIDTH = 800

# helper function to initialize globals             
def new_game():
    ''' Initialize game and reset values'''
    global exposed, turns, state, pos_clicked, counter, live_cards, card_position, turns
    state, turns, counter = 0, 0, -1
    live_cards, exposed, card_position = [], [], []
    pos_clicked = (0,0)
    random.shuffle(cards)
    label.set_text("Turns = " + str(turns))
    
    for i in range(len(cards)):
        exposed.append(False)
    
def distance(x, y):
    '''Find the distance between two points'''
    return math.sqrt((x[0]-y[0])**2 + (x[1]-y[1])**2)
            
# define event handlers
def mouseclick(pos):
    global pos_clicked, spacing, counter, exposed
    pos_clicked = pos
    position, counter = 0, -1
    
    #Check which card the mouse clicked and run logic
    for i in range(len(cards)):
        counter += 1
        position += spacing 
        if pos_clicked[0] < (position):
            logic()
            return
 
def logic():
    global pos_clicked, cards, spacing, counter, exposed, state, card_position, live_cards, turns
    if exposed[counter] == False:
        exposed[counter] = True
        if state == 0:
            state = 1
        elif state == 1:
            state = 2
            turns += 1
            label.set_text("Turns = " + str(turns))
        else:
            state = 1
            if live_cards[0] == live_cards[1]:
                card_position = []   
            else:
                exposed[card_position[0]] = False
                exposed[card_position[1]] = False
            
        live_cards.append(cards[counter])
        card_position.append(counter) 

        if len(live_cards) > 2:
            live_cards.pop(0)

        if len(card_position) > 2:
            card_position.pop(0)
        
        if len(live_cards) >= 2 and live_cards[0] == live_cards[1]:
            state = 2
            exposed[card_position[0]] = True
            exposed[card_position[1]] = True
            card_position = []

# Update canvas and draw cards    
def draw(canvas):
    global cards, spacing, exposed, pos_clicked, counter, state, turns
    spacing = WIDTH / len(cards) 
    column = (spacing / 1.9)
    
    for i in range(len(cards)):
        if exposed[i] == False:
            canvas.draw_line((column, 10), (column, 90), spacing, '#FC8A68')
        else:
            canvas.draw_text(str(cards[i]), ((column - 10), 60), 40, '#37B090')
        column += spacing

# create frame and add a button and labels
frame = simplegui.create_frame("Memory", WIDTH, HEIGHT)
frame.set_draw_handler(draw)
frame.add_button("Reset", new_game)

# register event handlers
frame.set_mouseclick_handler(mouseclick)
frame.set_draw_handler(draw)
label = frame.add_label("Turns = 0")

# get things rolling
new_game()
frame.start()
