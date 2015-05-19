
const eps=0.001;

function function1(x:real):real;
begin
  function1:=power(x,4)-3*x+1;
end;

function deriv1_func1(x:real):real; 
begin
  deriv1_func1:= 4*x*x*x;
end;

function deriv3_func1(x:real):real;
begin
deriv3_func1:= 12*(x*x);
end;
function deriv2_func1(x:real):real; // Important Comment!!!!!!very important!
begin
  deriv2_func1:=12*x;
end;
//===============================================================================
function function2(x:real):real;
begin
  function2:=log10(x)-1/power(10,x);
end;

function deriv1_func2(x:real):real;
begin
  deriv1_func2:= (1/(x*ln(10)))+power(10,-x)*ln(10);
end;

function deriv2_func2(x:real):real; //useless. need to delete
begin
  deriv2_func2:=x*(ln(10)-1/10)-ln(10)-power(10,-x)*(ln(10)*ln(10)-1/10);
end;
//===============================================================================

procedure dichotomy(a,b:real);
var t,f1,f2,x:real;
    iteration: integer;
begin
  iteration:=0;
  repeat
    t:=(a+b)/2;
    f1:=function1(a);
    f2:=function1(t);
    if (f1*f2<=0) then b:=t 
    else
    begin
      a:=t;
      f1:=f2;
    end;
    iteration:=iteration+1;
  until abs(b-a)<=eps;
  x:=(a+b)/2;
  writeln('Êîðåíü: x = ',x:10:6);
  writeln('Ôóíêöèÿ: f(x) = ',function1(x));
  writeln('Êîë-âî èòåðàöèé: ',iteration);
end;

procedure chord(a,b:real);
var f,f2,fz,z,x,h:real;
    iteration: integer;
begin
  iteration:=0;
  f:=function1(a);
  f2:=deriv2_func1(a);
  if (f*f2>0) then 
  begin
    x:=b;
    z:=a;
  end
  else
  begin
    x:=a;
    z:=b;
  end;
  fz:=function1(z);
  repeat
    f:=function1(x);
    h:=((x-z)*f)/(f-fz);
    x:=x-h;
    iteration:=iteration+1;
  until (abs(h)<=eps);
  writeln('Êîðåíü: x = ',x:10:6);
  writeln('Ôóíêöèÿ: f(x) = ',function1(x):1:13);
  writeln('Êîë-âî èòåðàöèé: ',iteration);
end;

procedure newton(a,b:real);
var f,f1,f2,x,h:real;
    iteration: integer;
begin
  iteration:=0;
  f:=function2(b);
  f2:=deriv2_func2(b);
  if (f*f2>0) then  x:=b else x:=a;
  repeat
    f:=function2(x);
    f1:=deriv1_func2(x);
    h:=f/f1;
    x:=x-h;
    iteration:=iteration+1;
  until (abs(h)<=eps);
  writeln('Корень: x = ',x:10:6);
  writeln('Функция: f(x) = ',function2(x):1:13);
  writeln('Кол-во итераций: ',iteration);
end;

BEGIN

END.
