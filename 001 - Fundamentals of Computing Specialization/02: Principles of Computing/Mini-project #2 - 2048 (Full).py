"""
Clone of 2048 game.

run it here: http://www.codeskulptor.org/#user47_250GLUVpdk_8.py

IMPORANT: Much of the TwentyFortyEight class had been refactored from other better solutions,
mainly here (https://github.com/kitchjr/2048/blob/master/2048_1.0.py)
as I am trying to focus on writing cleaner/better code. I feel that refactoring and understanding 
better written code will help me break old thought patterns. shift_zeros_right() and merge() are 100% my work.
"""

import random
import poc_2048_gui


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
        self._height = grid_height
        self._width = grid_width

        self._grid = [[0 for col in range(self.get_grid_width())]
                        for row in range(self.get_grid_height())]

        self._init_line_positions = {UP: [(0,col) for col in range(grid_width)],
                              DOWN: [(grid_height-1,col) for col in range(grid_width)],
                              LEFT: [(row,0) for row in range(grid_height)],
                              RIGHT: [(row, grid_width-1) for row in range(grid_height)]}

        # Find the line length based off dict above
        self._line_lengths = {UP: grid_height,
                             DOWN: grid_height,
                             LEFT: grid_width,
                             RIGHT: grid_width}
        
        #  reset game w two random tiles on new board
        self.reset()

    def reset(self):
        """
        Reset the game so the grid is empty except for two
        initial tiles.
        """
        self._grid = [[0 for dummy_col in range(self.get_grid_width())] 
                      for dummy_row in range(self.get_grid_height())]

        # generate 2 random tiles
        self.new_tile()
        self.new_tile()

    def __str__(self):
        """
        Return a string representation of the grid for debugging.
        """
        directions = ["UP:", "DOWN:", "LEFT:", "RIGHT:"]
    
        # print grid 
        grid = "Game Grid \n"
        for row in self._grid:
            grid += str(row) + "\n"
        
        # print initial line positions 
        _init_line_positions = "Initial Tile Positions \n"
        for direction_value in self._init_line_positions:
            _init_line_positions += directions[(direction_value - 1)] + str(self._init_line_positions[direction_value]) + "\n"

        # print OFFSETS
        OFFSET = "OFFSETS \n"
        for direction in OFFSETS:
            OFFSET += str(directions[direction - 1]) + str(OFFSETS[direction]) + "\n"

        
        # print all empty tiles 
        empty_tiles = "get_empty_tiles(): \n"
        for dummy_tile in self.get_empty_tiles():
            empty_tiles += str(dummy_tile)
        empty_tiles += "\n"
         
         
        print _init_line_positions   
        print OFFSET
        print empty_tiles
        return grid

    def get_grid_height(self):
        """
        Get the height of the board.
        """
        return self._height

    def get_grid_width(self):
        """
        Get the width of the board.
        """
        return self._width

    def move(self, direction):
        """
        Move all tiles in the given direction and add
        a new tile if any tiles moved.
        """
        no_movement = True

        for first_line_tiles in self._init_line_positions[direction]:
            # Create new lines to be merged (assuming moving left)
            line = [self.get_tile(first_line_tiles[0] + length * OFFSETS[direction][0],
                             first_line_tiles[1] + length * OFFSETS[direction][1])
                    for length in range(self._line_lengths[direction])]

            # Merge line
            merged_line = merge(line)

            # Checks if changes have occurred 
            no_movement = no_movement and (merged_line == line)

            # set new values for the current grid in the correct direction 
            for length in range(self._line_lengths[direction]):
                self.set_tile(first_line_tiles[0] + length * OFFSETS[direction][0],
                              first_line_tiles[1] + length * OFFSETS[direction][1],
                             merged_line[length])

        if not no_movement:
            self.new_tile()

        print self.__str__()

    def new_tile(self):
        """
        Create a new tile in a randomly selected empty
        square.  The tile should be 2 90% of the time and
        4 10% of the time.
        """
        # creates a 2 or 4 tile 
        if random.random() < 0.9:
            value = 2
        else:
            value = 4

        # take the value and place it in a random empty position
        row, col = random.choice(self.get_empty_tiles())

        # set the new cell value
        self.set_tile(row, col, value)

    def set_tile(self, row, col, value):
        """
        Set the tile at position row, col to have the given value.
        """
        self._grid[row][col] = value

    def get_tile(self, row, col):
        """
        Return the value of the tile at position row, col.
        """
        return self._grid[row][col]

    def get_empty_tiles(self):
        """
        Takes every tile in the grid and puts it in a list if its still empty
        """
        return [(row, col) for col in range(self.get_grid_width())
                for row in range(self.get_grid_height())

                if self.get_tile(row,col) == 0]
         

# for codeskulptor GUI
poc_2048_gui.run_gui(TwentyFortyEight(4, 4))
