function x=fibo(n)
if n <= 2
    x=1;
else
    x=fibo(n - 1) + fibo(n - 2);
end

end