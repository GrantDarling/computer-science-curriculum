my_list = [7,10,11,33,55,9,7,10,11,33,55]

def merge(a, b, ls):
    k, i, j = 0, 0, 0;

    for k in range(len(a + b)):
        if i == len(a):
            ls[k] = b[j];
            j += 1;
        elif j == len(b):
            ls[k] = a[i];
            i += 1;
        elif a[i] >= b[j]:
            ls[k] = (b[j]);
            j += 1;
        elif a[i] < b[j]:
            ls[k] = (a[i]);
            i += 1;
        k+=1
    
    return ls;

def merge_sort(ls):
    if len(ls) > 2:
        mid = len(ls)//2
        left = ls[:mid]
        right = ls[mid:]

        merge_sort(left);
        merge_sort(right);

        return merge(left,right,ls)

print(my_list)
merge_sort(my_list)

