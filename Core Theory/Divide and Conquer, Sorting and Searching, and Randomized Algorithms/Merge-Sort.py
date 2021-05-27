list_a = [1,2,3,4,5]

list_b = [7,9,10]

def merge_sort(a, b):
    c, i, j = [], 0, 0;

    for _ in range(len(a + b)):
        if i >= len(a):
            c.append(b[j]);
            j += 1;
        elif j >= len(b):
            c.append(a[i]);
            i += 1;
        elif a[i] >= b[j]:
            c.append(b[j]);
            j += 1;
        elif a[i] < b[j]:
            c.append(a[i]);
            i += 1;

    print(c)

merge_sort(list_a, list_b)

# # splits list in two
# def split_list(full_list):
#     half = len(full_list)//2
#     return full_list[:half], full_list[half:]
# list_a, list_b = split_list(full_list);






# # sample list to be sorted 
# full_list = [1,5,3,8,10,0]

# def merge_sort(full_list):

    # # splits list in two
    # def split_list(full_list):
    #     half = len(full_list)//2
    #     return full_list[:half], full_list[half:]
    # list_a, list_b = split_list(full_list);

#     # [1, 5, 3, 8, 1, 4, 9]
#     # recursively sort lists
#     def sort_list(partial_list):
#         if len(partial_list) <= 0:
#             return;
#         partial_list[0]
    
    
#     print(sort_list(list_a))
#     print(list_a)

# merge_sort(full_list)


# testList = [];

# def check():
#     if len(testList) <= 0:
#         print "stop"
    
# check();


