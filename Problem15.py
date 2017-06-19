def number_combinations(n, k):
    numberOfcombinations = factorial(n) / (factorial(k) * factorial(n - k))
    return numberOfcombinations

def factorial(n):
  factorialValue = 1
  while n > 1:
    factorialValue *= n
    n -= 1
  return factorialValue

print(number_combinations(40,20))
