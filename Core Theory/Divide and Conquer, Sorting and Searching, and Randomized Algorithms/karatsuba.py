def karatusba(x,y):
    if len(str(x)) == 1 or len(str(y)) == 1:
        return x*y
    else:
        mid = max(len(str(x)),len(str(y))) // 2

        a = x // 10**(mid)
        b = x % 10**(mid)
        c = y // 10**(mid)
        d = y % 10**(mid)

        _1 = karatusba(b,d)
        _2 = karatusba((a+b),(c+d))
        _3 = karatusba(a,c)

        return (_3 * 10**(2*mid)) + ((_2 - _3 - _1) * 10**(mid)) + (_1)

x = 3141592653589793238462643383279502884197169399375105820974944592;
y = 271828182845904523536028747135266249775724709369995957496696762743432234;
z = karatusba(x,y)

print(z)