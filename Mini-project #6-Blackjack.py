# Mini-project #6 - Blackjack

'''
READ ME: 

Unfortunately, the remaining projects in this course require a library accessed only through the course 
website sandbox. If you would like to play this game you can view it here: http://www.codeskulptor.org/?fbclid=IwAR1ooTKLNo9EgQgJpaxVVeED_6X1jzK_7b1ahjaEE4uaJT9o7nRFFgFkTcg#user47_QctzMI3PoU_19.py
If this link has been removed in the backend you can always play the game by going going here, removing the code and
replacing it with my code: http://www.codeskulptor.org/

Thanks for understanding :)
'''

import simplegui
import random

# load card sprite - 936x384 - source: jfitz.com
CARD_SIZE = (72, 96)
CARD_CENTER = (36, 48)
card_images = simplegui.load_image("http://storage.googleapis.com/codeskulptor-assets/cards_jfitz.png")

CARD_BACK_SIZE = (72, 96)
CARD_BACK_CENTER = (36, 48)
card_back = simplegui.load_image("http://storage.googleapis.com/codeskulptor-assets/card_jfitz_back.png")    

# initialize some useful global variables
player_card_pos = 300
dealer_card_pos = 100
in_play = False
outcome = ""
score = 0


# define globals for cards
SUITS = ('C', 'S', 'H', 'D')
RANKS = ('A', '2', '3', '4', '5', '6', '7', '8', '9', 'T', 'J', 'Q', 'K')
VALUES = {'A':1, '2':2, '3':3, '4':4, '5':5, '6':6, '7':7, '8':8, '9':9, 'T':10, 'J':10, 'Q':10, 'K':10}

# define card class
class Card:
    def __init__(self, suit, rank):
        if (suit in SUITS) and (rank in RANKS):
            self.suit = suit
            self.rank = rank
        else:
            self.suit = None
            self.rank = None
            print "Invalid card: ", suit, rank

    def __str__(self):
        return self.suit + self.rank

    def get_suit(self):
        return self.suit

    def get_rank(self):
        return self.rank

    def draw(self, canvas, pos):
        card_loc = (CARD_CENTER[0] + CARD_SIZE[0] * RANKS.index(self.rank), 
                    CARD_CENTER[1] + CARD_SIZE[1] * SUITS.index(self.suit))
        
        if in_play and pos[0] == dealer_card_pos and pos[1] == dealer_card_pos:
            canvas.draw_image(card_back, (CARD_CENTER[0], CARD_CENTER[1]), CARD_SIZE, [pos[0] + CARD_CENTER[0], pos[1] + CARD_CENTER[1]], CARD_SIZE)
        else:
            canvas.draw_image(card_images, card_loc, CARD_SIZE, [pos[0] + CARD_CENTER[0], pos[1] + CARD_CENTER[1]], CARD_SIZE)

# define hand class
class Hand:
    def __init__(self):
        '''initiate the current hand'''
        self.hand = []

    def __str__(self):
        return "Hand Contains: " + str(self.hand)
        
    def add_card(self, card):
        '''Take the rank and suit, combine them and append to hand'''
        suit_and_rank = []
        suit_and_rank.append(card.get_suit())
        suit_and_rank.append(card.get_rank())        
        card = "".join(suit_and_rank)
        
        return self.hand.append(card)
         
    def get_value(self):
        ''' Count the cards in hand. Count aces as 11 if under 21 and 1 if over 21'''
        has_Aces = False
        hand_value = 0
        
        for card in self.hand: 
            if card[1] == "A":
                has_Aces = True
            for key in VALUES:
                if key == card[1]:
                    hand_value += VALUES[key] 
                    
        if has_Aces == False:
            return hand_value
        else:
            if (hand_value + 10) <= 21:
                return hand_value + 10
            else:
                return hand_value

    def draw(self, pos): 
        global show_player, show_dealer, card_placement
        ''' draw a hand on the canvas, use the draw method for cards '''
        card_placement = pos
        counter = 0
            
        if card_placement == player_card_pos:
            for card in self.hand:
                show_player.append(self.hand[counter])
                counter += 1
        elif card_placement == dealer_card_pos:
            for card in self.hand:
                show_dealer.append(self.hand[counter])
                counter += 1   
                
        return show_player, show_dealer, card_placement

# define deck class 
class Deck:
    def __init__(self):
        '''create a Deck object'''
        self.deck = [Card(suit, rank) for suit in SUITS for rank in RANKS]

    def shuffle(self):
        '''shuffle the deck'''
        random.shuffle(self.deck)

    def deal_card(self):
        # deal a card object from the deck
        random_position = random.randrange(0, (len(self.deck)))
        random_card = self.deck[random_position]
        self.deck.pop(random_position)
        
        return random_card
            
    def __str__(self):
        '''return an array representing the deck'''
        deck = []
        
        for i in range(len(self.deck)):
            rank = self.deck[i].get_rank()
            suit = self.deck[i].get_suit()
            card = [rank,suit]
            
            joined_card = "".join(card)
            deck.append(joined_card)
           
        return "Deck Contains " + str(deck)

#define event handlers for buttons
def deal():
    global outcome, score, in_play, player_hand, dealer_hand, game_deck, show_player, show_dealer, is_game_over
    
    '''check if re-dealt prematurely'''
    if in_play and is_game_over == False:
        score -= 1
        
    '''Reset all variables'''
    show_player, show_dealer, player_hand, dealer_hand = [], [], [], []
    player_hand, dealer_hand = Hand(), Hand()
    game_deck = Deck()
    in_play, is_game_over = True, False
    
    for i in range(2):
        player_hand.add_card(game_deck.deal_card())
        dealer_hand.add_card(game_deck.deal_card())
    
    player_hand.draw(300)
    dealer_hand.draw(100)

def hit():
    global show_player, show_dealer
    
    if in_play == True:
        if player_hand.get_value() < 21:
            show_player = []
            player_hand.add_card(game_deck.deal_card())
            player_hand.draw(300)
            print "Player Hand Value: ", player_hand.get_value()
            if player_hand.get_value() > 21:
                stand()
            
def stand(): 
    global in_play, is_game_over
    global dealer_hand, pos1, show_player, show_dealer
    in_play = False
    
    while dealer_hand.get_value() < 17:
        show_dealer = []
        dealer_hand.add_card(game_deck.deal_card())
        dealer_hand.draw(100)  
        
    if is_game_over == False:
        end_game()
    
def end_game():
    global outcome, dealer_hand, player_hand, score, is_game_over
    
    is_game_over = True
    
    print 'dealer hand: ', dealer_hand.get_value()
    print 'player hand: ', player_hand.get_value() 
    if dealer_hand.get_value() > 21 and player_hand.get_value() < 21:
        score += 1
        outcome = 'Dealer busts. '
    elif player_hand.get_value() > 21:
        score -= 1
        outcome = 'You bust. '
    elif dealer_hand.get_value() > 21 and player_hand.get_value() > 21:
        score -= 1
        outcome = 'You both bust. ' 
    elif dealer_hand.get_value() >= player_hand.get_value() and dealer_hand.get_value() <= 21:
        score -= 1
        outcome = 'Dealer wins. '
    else:
        score += 1
        outcome = 'You win. '

# draw handler    
def draw(canvas):
    
    for i in range(len(show_dealer)):
        Card(show_dealer[i][0], show_dealer[i][1]).draw(canvas, [1 * (100 * i), dealer_card_pos])
        
    for j in range(len(show_player)):
        Card(show_player[j][0], show_player[j][1]).draw(canvas, [1 * (100 * j), player_card_pos])

    canvas.draw_text('Black Jack', (250, 50), 30, 'Black')
    canvas.draw_text('Dealer', [70, 80], 20, 'White')
    canvas.draw_text('Player', [70, 270], 20, 'White')
    canvas.draw_text('score = ' + str(score), [450, 50], 20, 'White')
   
    if is_game_over:
        canvas.draw_text(outcome +'new deal?', [0, 250], 40, 'Black')
    else:
        canvas.draw_text('hit or stand?', [300, 150], 40, 'Black')

# initialization frame
frame = simplegui.create_frame("Blackjack", 600, 600)
frame.set_canvas_background("Green")

#create buttons and canvas callback
frame.add_button("Deal", deal, 200)
frame.add_button("Hit",  hit, 200)
frame.add_button("Stand", stand, 200)
frame.set_draw_handler(draw)

# get things rolling
deal()
frame.start()