"""
Planner for Yahtzee
Simplifications:  only allow discard and roll, only score against upper level

You can run the code here: http://www.codeskulptor.org/#user47_Md4lt0KBoR_20.py
"""

# Used to increase the timeout, if necessary
import codeskulptor
codeskulptor.set_timeout(20)



def gen_all_sequences(outcomes, length):
    """
    Iterative function that enumerates the set of all sequences of
    outcomes of given length.
    """
    
    answer_set = set([()])
    for dummy_idx in range(length):
        temp_set = set()
        for partial_sequence in answer_set:
            for item in outcomes:
                new_sequence = list(partial_sequence)
                new_sequence.append(item)
                temp_set.add(tuple(new_sequence))
        answer_set = temp_set
    return answer_set


def score(hand):
    """
    Compute the maximal score for a Yahtzee hand according to the
    upper section of the Yahtzee score card.
    """ 
    if len(hand) == 0:
        return 1
    
    unique_dice = set(hand)
    dice_sum = []
    
    for value in unique_dice:
        temp_val = 0
        for dice in hand:
            if dice == value:
                temp_val += dice
        dice_sum.append(temp_val)

    return max(dice_sum)

def expected_value(held_dice, num_die_sides, num_free_dice):
    """
    Compute the expected value based on held_dice given that there
    are num_free_dice to be rolled, each with num_die_sides.
    """
    total_outcomes = []
    total_sum_score = 0
    die_sides = [die for die in range(1, num_die_sides + 1)]
    free_outcomes = gen_all_sequences(die_sides,num_free_dice)
    
    for free_dice in free_outcomes:
        temp_outcomes = free_dice + held_dice
        total_outcomes.append(tuple(temp_outcomes))
    
    total_sum_score = [score(hand) for hand in total_outcomes]
    
    return float(sum(total_sum_score)) / float(len(total_outcomes))


def gen_all_holds(hand):
    """
    Returns a set of tuples, where each tuple is dice to possibly hold
    """

    all_holds = [()]
    for dice in hand:
        for hand in all_holds:
            all_holds = all_holds + [tuple(hand) + (dice, )]
    
    return set(all_holds)

def strategy(hand, num_die_sides):
    """
    Compute the hold that maximizes the expected value when the
    discarded dice are rolled.
    
    Returns a tuple where the first element is the expected score and
    the second element is a tuple of the dice to hold
    """
    
    best_score = float('-inf')
    for temp_hold in gen_all_holds(hand):
        temp_score = expected_value(temp_hold, num_die_sides, len(hand) - len(temp_hold))
        if temp_score > best_score:
            best_score = temp_score
            hold = temp_hold
            
    return (best_score, hold)

def run_example():
    """
    Compute the dice to hold and expected score for an example hand
    """
    num_die_sides = 6
    hand = (1, 1, 1, 5, 6)
    hand_score, hold = strategy(hand, num_die_sides)
    print "Best strategy for hand", hand, "is to hold", hold, "with expected score", hand_score
    
    
run_example()

## Tests

#import poc_simpletest
#import poc_holds_testsuite

# Test score()
'''
def test_score():
    # create a TestSuite object
    suite = poc_simpletest.TestSuite()
    
    # test format_function on various inputs
    suite.run_test(score((0,1,2,3,4)), 4, "Test #1:")
    suite.run_test(score((0,1,2,5,6)), 6, "Test #2:")
    suite.run_test(score((0,0,0,2,2)), 4, "Test #3:")
    suite.run_test(score((6,6,6,4,4)), 18, "Test #4:")
    suite.run_test(score((6,1,1,1,6)), 12, "Test #5:")
    suite.run_test(score((2,2,2,2,6)), 8, "Test #6:")
    
    suite.report_results()

test_score()

# Test expected_value()

def test_expected_value():
    # create a TestSuite object
    suite = poc_simpletest.TestSuite()
    
    # test format_function on various inputs
    suite.run_test(expected_value((1,1),2,4), 5.125, "Test #1:")

    suite.report_results()

test_expected_value()

poc_holds_testsuite.run_suite(gen_all_holds)
'''
