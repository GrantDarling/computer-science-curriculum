"""
Clone of 2048 game.
"""
import random
import poc_2048_gui
import user47_ySzykGcvJq_71 as test_class

# Directions, DO NOT MODIFY
UP = 1
DOWN = 2
LEFT = 3
RIGHT = 4

# Offsets for computing tile indices in each direction.
# DO NOT MODIFY this dictionary.
OFFSETS = {UP: (1, 0),
           DOWN: (-1, 0),
           LEFT: (0, 1),
           RIGHT: (0, -1)}

def shift_zeros_right(line):
    """
    Shifts all zero's and appends to the end of the line
    """
    zeros = []
    nonzero_numbers = []

    if len(line) == 1: 
        return line
    for element in line:
        if element != 0:
            nonzero_numbers.append(element)
        else:
            zeros.append(element)
    nonzero_numbers.extend(zeros)
    line = nonzero_numbers #with zeros
    
    return line

def merge(line):
    """
    Helper function that merges a single row or column in 2048
    """
    line = shift_zeros_right(line)

    for position, element in enumerate(line):
        position -= 1
        next_position = (position + 1)
        
        if element == 0 or len(line) <= 1: 
            return line
        if line[position] == line[next_position] and position != -1:
            line[next_position] = line[position] + line[next_position]
            line.pop(position)
            line.append(0)

    return line    

class TwentyFortyEight:
    """
    Class to run the game logic.
    """

    def __init__(self, grid_height, grid_width):
        self.grid = []
        self.grid_height = grid_height
        self.grid_width = grid_width
        self.line_holder = []
        self.row = None
        self.col = None
        self.direction = {UP:[(0,index) for index in range(self.get_grid_height())],
                             DOWN: [(self.grid_height - 1,index) for index in range(self.get_grid_height())],
                             LEFT: [(index,0) for index in range(self.get_grid_width())],
                             RIGHT: [(index,self.grid_width - 1) for index in range(self.get_grid_width())]}
        self.reset()
                
    def reset(self):
        """
        Reset the game so the grid is empty except for two
        initial tiles.
        """
        self.grid = [[0 for dummy_i in range(self.grid_width)]
                     for dummy_j in range(self.grid_height)]
        self.new_tile()
        self.new_tile()
         
        return self.grid

    def __str__(self):
        """
        Return a string representation of the grid for debugging.
        """
        
        #create grid
        print "Game Grid"
        for row in self.grid:
            print row
        print "\n"
        
        #OFFSET 
        print "OFFSETS"
        print "Up(1)", self.direction[1]
        print "Down(2)", self.direction[2]
        print "Left(3)", self.direction[3]
        print "Right(4)", self.direction[4]
        print
        
        #Directions 
        print "Directions"
        print "Up(1)", OFFSETS[1]
        print "Down(2)", OFFSETS[2]
        print "Left(3)", OFFSETS[3]
        print "Right(4)", OFFSETS[4]
        print
        
        # Show total tiles 
        total_tiles = (self.grid_height * self.grid_width)
        print "Total Tile: " + str(total_tiles) + "\n"
        
        return self.grid

    def get_grid_height(self):
        """
        Get the height of the board.
        """
        return self.grid_height

    def get_grid_width(self):
        """
        Get the width of the board.
        """
        return self.grid_width
    
    def move(self, direction):
        """
        Move all tiles in the given direction and add
        a new tile if any tiles moved.
        """
        self.is_game_over()
        if self.is_game_over() == True:
            return self.grid
        
        
        
        for step in range(len(self.direction[direction])):
            row = self.direction[direction][0][0] + (OFFSETS[direction][0] * step)
            col = self.direction[direction][0][1] + (OFFSETS[direction][1] * step)
            self.line_holder.append(self.grid[row][col])
        
        print "line =", self.line_holder
        new_line = merge(self.line_holder)
        print "merged line =", new_line
        
        self.grid[0] = new_line
        
        self.line_holder = []
            
        
        
        print "self.direction[direction][0][0] + (OFFSETS[direction][0] * step) = ",self.direction[direction][0][0]

        self.new_tile()
        self.__str__()
        
        return self.grid

    def new_tile(self):
        """
        Create a new tile in a randomly selected empty
        square.  The tile should be 2 90% of the time and
        4 10% of the time.
        """
        if random.random() < 0.9:
            value = 2
        else:
            value = 4

        row = 0
        col = 0
        tile_is_taken = True
        
        while tile_is_taken:
            row = random.randrange(self.grid_height)
            col = random.randrange(self.grid_width)
            if self.grid[row][col] == 0:
                tile_is_taken = False
                self.grid[row][col] = value   
                
    def set_tile(self, row, col, value):
        """
        Set the tile at position row, col to have the given value.
        """
        self.grid[row][col] = value

    def get_tile(self, row, col):
        """
        Return the value of the tile at position row, col.
        """ 
        return self.grid[row][col]

    def is_game_over(self):
        total_tiles = (self.grid_height * self.grid_width)
        taken_tiles = 0
        
        for row in self.grid:
            for tile in row:
                if tile != 0:
                    taken_tiles += 1
                    
        if taken_tiles == total_tiles:
            print "game over!"
            return True 
        
        return False
    

#variable to keep gui and game the same
game = TwentyFortyEight
row = 4
col = 3

# run the gui for the game
poc_2048_gui.run_gui(game(row,col))

# run the testing suite for the game
test_class.run_suite(game, row, col)


