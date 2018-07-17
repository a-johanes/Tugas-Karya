program coba;

var 
	x,a : string;
	y : integer;
	z : char;
begin
	readln(x);
	readln(y);
	a := x;
	Inc(x[length(x)],y);
	writeln(x);
	readln(z);
	if (z = '<') then
	begin
		if (x < a) then writeln('its true that ', x ,' < ', a)
		else writeln('false, ', x ,' > ', a);
	end else if ( z = '>') then
	begin
		if (x > a) then writeln('its true that ', x ,' > ', a)
		else writeln('false,', x ,' < ', a);
	end;
end.
