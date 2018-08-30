 ap = 1;
 f = @(x) ap*e^x - 4*x^2; 
 a=0.0001;
 b=1;
 
 an = -1*a;
 bn = -1*b;
 
while (an >= -100 && bn>=-100)
   if (f(an)*f(bn)<0)
    display("Intervalo negativo")
    display(an);
    display(bn);
   endif
 an--;   
 bn--;
endwhile
 
 
while (a <= 100 && b<=100)
   if (f(a)*f(b)<0)
   display("Intervalo positivo")
    display(a);
    display(b);
   endif
 a++;   
 b++;
endwhile
