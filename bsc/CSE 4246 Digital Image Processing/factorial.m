function x = factorial(n)
if n<=1
  x = 1;
else
  x = n * factorial(n-1) ;
end