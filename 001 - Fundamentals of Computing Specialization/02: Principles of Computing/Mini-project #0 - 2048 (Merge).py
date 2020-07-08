"""
Merge function for 2048 game.
"""

def merge(line):
    """
    Function that merges a single row or column in 2048.
    """
    merged_line = []
    zeros_holder = []

    # place all zeros at the end while remaining the order
    # of other numbers
    for num in range(len(line)):
        if len(line) == 1:
            new_line = line
            return new_line
            
        if line[num] != 0:
            merged_line.append(line[num])
        else:
            zeros_holder.append(0)
       
    merged_line.extend(zeros_holder)

    # Loop through length of new list 
    # add matching values to the second value
    # remove the element currently being looped
    # append a 0 to the end 
    for element in range(len(merged_line)):
        position = element - 1
        prev_position = position - 1 
        next_position = element
        
        if element == 0:
            recent_match = True
            element = element + 1
        elif prev_position != position:
            recent_match = False

        if merged_line[position] == merged_line[next_position] and recent_match == False and merged_line[position] != 0:
            recent_match = True
            merged_line[next_position] = merged_line[position] + merged_line[next_position]
            merged_line.pop(position)
            merged_line.append(0)
        else:
            recent_match = False   
    
    return merged_line

print merge([2, 2, 0, 2, 8, 8, 8, 0])
print merge([2, 2, 2, 2, 8, 8, 8, 2])

