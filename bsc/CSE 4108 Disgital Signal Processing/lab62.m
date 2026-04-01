% Z Transformation
num = [1.5,2,3];
deno = [2,-1.5,0.5,0.6];
y = tf(num, deno);

pzmap(y)
axis equal
sgrid