def step(n):
    if n % 2 == 0:
        return n/2
    return 3 * n + 1

def collatz(n):
    nb = 1
    while n != 1:
        n = step(n)
        nb += 1
    return nb

def longestCollatz(max):
    cache = [0] * max
    cache[1] = 1
    maxStep = 0
    maxStepNum = 0

    for number in range(2,max):
        steps = collatz(number)
        if steps > maxStep:
            maxStep = steps
            maxStepNum = number
            print(maxStepNum, maxStep)

    return maxStepNum , maxStep

print(longestCollatz(999999))
