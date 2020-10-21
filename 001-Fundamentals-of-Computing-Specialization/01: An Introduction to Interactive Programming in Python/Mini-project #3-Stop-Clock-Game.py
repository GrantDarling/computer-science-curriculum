'''
READ ME: 

Unfortunately, the remaining projects in this course require a library accessed only through the course 
website sandbox. If you would like to play this game you can view it here: http://www.codeskulptor.org/?fbclid=IwAR1lyaKR-avHldmDzZW3Z2ljWmxJFNfacE0Ls2lYlJKh7KVYvzoklN7crG0#user47_NYuh0lQEm6_4.py
If this link has been removed in the backend you can always play the game by going here, removing the code and
replacing it with my code: http://www.codeskulptor.org/

Side Note: The instructors said to use global variables in this case.

Thanks for understanding :)

HOW TO PLAY:

This game is essentially just a stop watch but I made a small game out of it as well.
The goal of the game is the start the stopwatch and stop it exactly when the millisecond is at 0.
If you are successful, your score and attempt will increase by 1. If you are not successful, only
your attempts will increase by one. Good luck!

'''

import simplegui

# define global variables
tick = 0
millisecond = 0
second = 0
minute = 0

start = False
attempts = 0
score = 0

display_time = "0:00.0"
display_score = "Score: 0 Attempts: 0"

HEIGHT = 200
WIDTH = 600

# define helper function format that converts time
# in tenths of seconds into formatted string A:BC.D
def ticks():
    global tick
    tick += 1
    time_converter()
    
def time_converter():
    global millisecond
    global second
    global minute
    millisecond = tick % 10
    second = tick // 10 % 60
    minute = tick // 600 % 60
    if second < 10:
        second = "0"+str(second)
    else:
        second = str(second)
    format(tick)
    
def format(t):
    global display_time
    display_time = str(minute) + ":" + str(second) + "." + str(millisecond) 
    
def increment_score():
    global score
    score += 1
    
def increment_attempts():
    global attempts
    attempts += 1
    
def score_counter():
    global display_score
    global millisecond
    global start
    global attempts
    global score
    if millisecond == 0 and start == True:
        increment_score()
        increment_attempts()
    elif start == True:
        increment_attempts()
    else:
        pass
    
    display_score = "Score: "+str(score) + " Attempts: " + str(attempts)
    start = False
    
def start():
    global start
    start = True
    timer.start()
    
def stop():
    timer.stop() 
    score_counter()   

def reset():
    global tick 
    global display_time
    global display_score
    global score
    global attempts
    display_time = "0:00.0"
    tick = 0
    score = 0
    attempts = 0
    score_counter()
    
    
# define event handler for timer with 0.1 sec interval
timer = simplegui.create_timer(100, ticks)

# define draw handler
def draw_time(canvas):
    canvas.draw_text(display_time, (WIDTH/2, HEIGHT/2), 30, 'Pink')
    canvas.draw_text(display_score, ((WIDTH - 200), 30), 20, 'Pink')
    
# create frame
frame = simplegui.create_frame('Stop Clock', WIDTH, HEIGHT)
frame.set_draw_handler(draw_time)

# register event handlers
start = frame.add_button('start', start, 100)
stop = frame.add_button('stop', stop, 100)
reset = frame.add_button('reset', reset, 100)

# start frame
frame.start()

