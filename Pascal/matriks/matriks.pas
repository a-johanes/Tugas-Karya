program matriks;
const 
	kolom = 2;
	baris = 3;
var 
	M1, M2,M3 : array [1..baris,1..baris] of integer;
	i, j, k: integer;
	Neffbaris1, Neffbaris2 : integer;
	Neffkolom1 , Neffkolom2 : integer;
	masukan : integer;

begin
	Neffbaris1 := baris;
	Neffkolom1 := kolom;
	for i := 1 to Neffbaris1 do
	begin
		for j := 1 to Neffkolom1 do 
		begin
			readln(masukan);
			M1[i,j] := masukan;
		end;
	end;
	
	writeln;
	
	for i := 1 to Neffbaris1 do
	begin
		for j := 1 to Neffkolom1 do 
		begin
			write(M1[i,j],' ') ;
		end;
		writeln;
	end;
	
	Neffbaris2 := Neffkolom1;
	Neffkolom2 := Neffbaris1;
	writeln;
	
	for i := 1 to Neffbaris2 do
	begin
		for j := 1 to Neffkolom2 do 
		begin
			M2[i,j] := M1[j,i];
		end;
	end;
	
	for i := 1 to Neffbaris2 do
	begin
		for j := 1 to Neffkolom2 do 
		begin
			write(M2[i,j],' ') ;
		end;
		writeln;
	end;
	
	writeln;
	
	if ( Neffkolom1 = Neffbaris2) then 
	begin
		for i := 1 to Neffbaris1 do
		begin
			for j := 1 to Neffkolom2 do
			begin
				M3[i,j] := 0;
				for k := 1 to Neffkolom1 do
				begin
					M3[i,j] := M3[i,j] + M1[i,k] * M2[k,j];
				end;
			end;	
		end;
	end;
	
	for i := 1 to Neffbaris1 do
	begin
		for j := 1 to Neffkolom2 do 
		begin
			write(M3[i,j],' ') ;
		end;
		writeln;
	end;
	
end.