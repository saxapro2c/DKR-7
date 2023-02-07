Uses GraphWPF;
var (u,p, wx,wy) := (32, 4, 64,64);
Procedure a(i: Integer); forward;
Procedure b(i: Integer); forward;
Procedure c(i: Integer); forward;
Procedure d(i: Integer); forward;
Procedure a(i: Integer) :=
If i > 0 Then begin
d(i - 1); LineBy(+u, 0);
a(i - 1); LineBy(0, u);
a(i - 1); LineBy(-u, 0);
c(i - 1)
end;
Procedure b(i: integer) :=
If i > 0 Then begin
c(i - 1); LineBy(-u, 0);
b(i - 1); LineBy(0, -u);
b(i - 1); LineBy(u, 0);
d(i - 1)
end;
Procedure c(i: integer) :=
If i > 0 Then begin
b(i - 1); LineBy(0, -u);
c(i - 1); LineBy(-u, 0);
c(i - 1); LineBy(0, u);
a(i - 1)
end;
Procedure d(i: integer) :=
If i > 0 Then begin
a(i - 1); LineBy(0, u);
d(i - 1); LineBy(u, 0);
d(i - 1); LineBy(0, -u);
b(i - 1)
end;
Procedure KeyDown(k: Key);
begin
case K of
Key.Down: wy += 10;
Key.Up: wy -= 10;
Key.Left: wx -= 10;
Key.Right: wx += 10;
Key.Escape: halt(1);
Key.a: if p*u < 1000 then u := p*u>50 ? (u * 1.1).trunc : u+5;
Key.d: if (p*u > 50) and (u > 9) then u := (u / 1.1).trunc;
Key.w: if (p*u > 50) and (p < 5) then (u,p) :=(u div 2, p+1);
Key.s: if p > 1 then (u,p) :=(u*2, p-1);
end;
MoveTo(wx,wy);
Redraw(() ->begin Window.Clear; a(p); end);
end;
begin
Window.SetSize(620,620);
MoveTo(wx, wy);
Redraw(() ->a(p));
OnkeyDown += KeyDown;
end.{ KeyDown(1);

OnKeyDown += KeyDown;

end.