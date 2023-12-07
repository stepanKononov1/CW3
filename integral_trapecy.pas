program CW3;
Uses Crt;
var 
  x1, x2 : integer;
  outT, outF, diff : real;
  c : byte;
const
  n = 10000000000;
  m = 40;

function f(x:real):real;begin f := 2*x*x*x + 1*x*x + 1*x + 8; end;
function integral(a, b, mode: integer): real;
var
  h, s, x : real;
begin
  h := (b-a)/mode;
  x:=a+h;
  for i:integer := 1 to mode - 1 do
  begin
    s := s + f(x);
    x:=x+h;
  end;
  integral := (s + (f(a) + f(b)) / 2) * h;
end;

begin
  c := 1;
  repeat
    writeln;
    WriteLn('Вычисление интеграла - 1');
    WriteLn('Выход - 0');
    WriteLn('Выберите программу: ');
    readln(c);
    Case c of
    1:
    begin
      writeln('Введите пределы интегрирования: ');
      readln(x1, x2);
      writeln('Идёт интегрирование...');
      outT := integral(x1, x2, n);
      outF := integral(x1, x2, m);
      diff := (outT - outF) / outF * 100;
      writeln;
      writeln('Результаты интегрирования: ');
      writeln(outF:3:4);
      writeln;
      writeln('Погрешность: ');
      writeln(abs(diff):4:6, '%');
      writeln;
      writeln('Нажмите ENTER');
      readln;
      ClrScr;
    end;
    0:
    begin
      ClrScr;
      break;
    end;
    end;
  until True;
end.
