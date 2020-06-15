# Implementation of classic arcade game Pong
'''
READ ME: 

Unfortunately, the remaining projects in this course require a library accessed only through the course 
website sandbox. If you would like to play this game you can view it here: http://www.codeskulptor.org/?fbclid=IwAR1VA9JIHYZD2SCek9I09DP9bJR2lTYdguJZe-SJb_YHdjpbP9y-to9Xv8c#user47_AkvtLPz6M1_5.py
If this link has been removed in the backend you can always play the game by going going here, removing the code and
replacing it with my code: http://www.codeskulptor.org/

Side Note: The instructors said to use global variables in this case.

Thanks for understanding :)
'''
import simplegui
import random
# Globals 
WIDTH = 600
HEIGHT = 400       
BALL_RADIUS = 10
PAD_WIDTH = 8
PADDLE_COLOR = "White"
BALL_COLOR = "White"
player_paddle = [[0, HEIGHT/1.5], [0, (HEIGHT/3.5)]]
comp_paddle = [[WIDTH, HEIGHT], [WIDTH, 0]]
ball_pos = [WIDTH / 2, HEIGHT / 4]
paddle_vel = 0
ball_vel = [0,0]
score = 0
high_score = 0
isInit = False
winner_score = 8

# Helpers 
def incrementer(value):
    if value >= 0:
        value += 1
    else:
        value -= 1
    return value
  
# Define Event Handlers
def updater(canvas):
    global paddle_vel, ball_pos, PADDLE_COLOR, rules
    paddle_updater()
    ball_updater(canvas)
    color_changer()
    if score >= winner_score:
        endgame(canvas)
    if not isInit:
        draw_rules(canvas)
    draw_game(canvas)

def init():
    global isInit, score, BALL_COLOR
    isInit = True
    score = 0
    BALL_COLOR = "White"
    spawn_ball()
    
def draw_game(canvas):
    global score, high_score
    #Draw scoreboard 
    canvas.draw_text('Score: ' + str(score) + ' high score: ' + str(high_score), (WIDTH/2.7, 20), 20, 'White')
    #draw the paddles and the gutters
    canvas.draw_line(player_paddle[0],player_paddle[1], 20, 'white')
    canvas.draw_line(comp_paddle[0], comp_paddle[1], 20, PADDLE_COLOR)
    canvas.draw_line([PAD_WIDTH, 0],[PAD_WIDTH, HEIGHT], 1, "White")
    canvas.draw_line([WIDTH - PAD_WIDTH, 0],[WIDTH - PAD_WIDTH, HEIGHT], 1, "White")
    
def draw_rules(canvas):
    '''Draws the rules necessary before the game begins'''
    canvas.draw_text("Hit 'space' to start and the 'up' and 'down' arrow keys to move your paddle", (90, HEIGHT/2), 15, 'White')
    canvas.draw_text("Win the game by getting to 8 points", (WIDTH/4, HEIGHT/1.7), 20, '#4BDBB0')   
   
def spawn_ball():
    global ball_vel, ball_pos
    ball_pos = [WIDTH / 2, HEIGHT / 4]
    ball_vel = [2,random.randint(0, 5)]
    
def keydown(key):
    '''Move Paddles and start game'''
    global paddle_vel, isInit
    if key == simplegui.KEY_MAP['up']:
        paddle_vel = -6
    elif key == simplegui.KEY_MAP['down']:
        paddle_vel = 6
    if not isInit:    
        if key == simplegui.KEY_MAP['space']:
            init()

def keyup(key):
    '''Stop paddles'''
    global paddle_vel
    if key == simplegui.KEY_MAP['up']:
        paddle_vel = 0
    elif key == simplegui.KEY_MAP['down']:
        paddle_vel = 0

def paddle_updater():
    ''' Update Paddle Position and create boundaries'''
    player_paddle[1][1] += paddle_vel
    player_paddle[0][1] += paddle_vel
    #Check limits
    if player_paddle[1][1] < 0: 
        player_paddle[1][1], player_paddle[0][1] = 0, (HEIGHT/2.9)
    elif player_paddle[0][1] > HEIGHT: 
        player_paddle[1][1], player_paddle[0][1] = (HEIGHT/1.5), HEIGHT
        
def ball_updater(canvas):
    global ball_vel, score, high_score, ball_pos, isInit, BALL_COLOR
    canvas.draw_circle((ball_pos), BALL_RADIUS, 1, 'Black', BALL_COLOR)
    ball_pos[0] += ball_vel[0]
    ball_pos[1] += ball_vel[1]
    #If ball hits the top or bottom, switch the Y velocity
    if ball_pos[1] >= (HEIGHT - BALL_RADIUS) or ball_pos[1] <= (0 + BALL_RADIUS):
        ball_vel[1] *= -1
    #If ball hits the gutter, switch the X velocity, reset the ball position and spawn a new ball
    if ball_pos[0] >= (WIDTH-BALL_RADIUS-PAD_WIDTH ) or ball_pos[0] <= (0+BALL_RADIUS+PAD_WIDTH):
        #check if the ball hits either paddle 
        if player_paddle[1][1] < ball_pos[1] < player_paddle[0][1] and ball_pos[0] < (WIDTH / 2) or comp_paddle[1][1] < ball_pos[1] < comp_paddle[0][1] and ball_pos[0] > (WIDTH / 2):
            ball_vel[0], ball_vel[1] = (-incrementer(ball_vel[0])), incrementer(ball_vel[1])
            if comp_paddle[1][1] < ball_pos[1] < comp_paddle[0][1] and ball_pos[0] > (WIDTH / 2):
                score = incrementer(score)
        else:
            endgame(canvas)      
        

def endgame(canvas):
    global ball_vel, BG_COLOR, isInit, high_score, score, ball_pos
    if score > high_score:
        high_score = score
    if score >= winner_score:
        canvas.draw_text('YOU WIN!!!!!', (WIDTH/2.7, HEIGHT/2), 30, 'White')
    else:
        draw_rules(canvas)
        isInit = False
    ball_vel = [0,0]
    ball_pos = [WIDTH / 2, HEIGHT / 4] 
   
def color_changer():
    global score, PADDLE_COLOR, BALL_COLOR
    levels = ["White", "#4BDBB0", "#67A290", "#318F73", "#8CDBC4", "#1F5C4A", "Black"]
    if score <= 6:
        PADDLE_COLOR = levels[score]
    else:
        if PADDLE_COLOR == "Black":
            PADDLE_COLOR = "#4BDBB0"
            BALL_COLOR = "Gold"
        else: 
            PADDLE_COLOR = "Black"
            BALL_COLOR = "Black"

# Create Frame
frame = simplegui.create_frame("Pong", WIDTH, HEIGHT)

# Register Event Handlers
frame.set_keydown_handler(keydown)
frame.set_keyup_handler(keyup)
frame.set_draw_handler(endgame)
frame.set_draw_handler(draw_rules)
frame.set_draw_handler(init)
frame.set_draw_handler(updater)

# Start Frame and Timers 
frame.start()