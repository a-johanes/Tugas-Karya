program xoxo;
type xo = array[1..3,1..3] of char;
var
	tabel : xo;
	i,j :integer;
	masukan : char;
function matrikspenuh(tabel : xo): boolean;
var
	spasi : boolean;
begin
	i := 1; j := 1;
	spasi := false;
	
	while ( (i<=3) and (j<=3) and not(spasi) ) do
	begin
		if (tabel[i,j] = ' ') then spasi := true
		else j := j +1;
		if(j=3) then
		begin
			i := i +1;
			j := 1;
		end;
	end;
	
	matrikspenuh := not(spasi);
end;
begin
	for i := 1 to 3 do
	begin
		for j := 1 to 3 do
		begin
			tabel[i,j] := ' ';
		end;
	end;
	
	readln(masukan);
	while (masukan <> '#') do
	begin
		readln(i,j);
		tabel[i,j] := masukan;
		readln(masukan);
	end;
	
	if (matrikspenuh(tabel)) then
	begin
		for i := 1 to 3 do
	begin
		for j := 1 to 3 do
		begin
			write(tabel[i,j],' ');
		end;
		writeln;
	end;
	end else writeln('matriks belum penuh');
end.