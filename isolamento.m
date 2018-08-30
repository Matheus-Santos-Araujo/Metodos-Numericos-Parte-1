 ap = 1;
 f = @(x) ap*e^x - 4*x^2; 
 a=0.0001;
 b=1;
while (a <= 100 && b<=100)
   if (f(a)*f(b)<0)
    display(a);
    display(b);
   endif
 a++;   
 b++;
endwhile
