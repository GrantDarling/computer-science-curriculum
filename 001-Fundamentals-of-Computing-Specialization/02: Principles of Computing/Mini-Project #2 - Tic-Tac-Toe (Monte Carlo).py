"""
Monte Carlo Tic-Tac-Toe Player

To play against the machine player, simply go here: http://www.codeskulptor.org/#user47_YDJocJyrNM_68.py
and run the code
"""

import random
import poc_ttt_gui
import poc_ttt_provided as provided

# Constants for Monte Carlo simulator
NTRIALS = 20  
SCORE_CURRENT = 1.0 # Score for squares played by the machine player
SCORE_OTHER = 1.0   # Score for squares played by the other player    
GRID = provided.TTTBoard(3)

#functions
def mc_trial(board, player):
    '''
    Plays a game starting with the given player by 
    making random moves, alternating between players. 
    '''
    empty_cells = board.get_empty_squares()
    current_players = player
    winner = None
    
    while winner == None:
        
        empty_cells = board.get_empty_squares()
        total_empty = len(empty_cells)
        
        row, col = empty_cells[random.randrange(total_empty)]
        board.move(row, col, current_players)
        winner = board.check_win()
        current_players = provided.switch_player(current_players)
        winner = board.check_win()

def mc_update_scores(scores, board, player):
    '''
    Scores the completed board and update the scores grid.
    '''
    
    winner = board.check_win()
    if winner == player:
        for row in range(board.get_dim()):
            for col in range(board.get_dim()):
                if board.square(row,col) == player:
                    scores[row][col] += SCORE_CURRENT
                if board.square(row,col) == provided.switch_player(player):
                    scores[row][col] -= SCORE_OTHER
                    
    if winner == provided.switch_player(player):
        for row in range(board.get_dim()):
            for col in range(board.get_dim()):
                if board.square(row,col) == player:
                    scores[row][col] -= SCORE_CURRENT
                if board.square(row,col) == provided.switch_player(player):
                    scores[row][col] += SCORE_OTHER

def get_best_move(board, scores):
    '''
    Returns the best move from the scoreboard
    '''
    
    empty_cells = board.get_empty_squares()
    empty_cells = list(empty_cells)
    if len(empty_cells) <= 0:
        return "No moves left"
    
    highest_score = scores[empty_cells[0][0]][empty_cells[0][1]]
    for cell in empty_cells:
        score = scores[cell[0]][cell[1]]
        if score > highest_score:
            highest_score = score
    
    # find empty squares with highest score                
    best_moves = []
    for cell in empty_cells:
        if scores[cell[0]][cell[1]] == highest_score:
            best_moves.append(cell)

    row, col = best_moves[random.randrange(0,len(best_moves))] 

    return row, col

def mc_move(board, player, trials):
    '''
    Takes a current board, which player the machine player is, 
    and the number of trials to run. 
    '''
 
    score = [ [0 for dummy_col in range(board.get_dim())] for dummy_row in range(board.get_dim())]
    for dummy_i in range(trials):
        trial_board = board.clone()
        mc_trial(trial_board, player)
        mc_update_scores(score, trial_board, player)
   
    row, col = get_best_move(board, score)
    
    return row, col


####################
#RUN CODE
####################
    
# Test game with the console or the GUI.  Uncomment whichever 
# you prefer.  Both should be commented out when you submit 
# for testing to save time.

# provided.play_game(mc_move, NTRIALS, False)        
poc_ttt_gui.run_gui(3, provided.PLAYERX, mc_move, NTRIALS, False)