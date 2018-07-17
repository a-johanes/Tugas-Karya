program file_eksternal;

var
	fin : file of integer;
	fout : file of integer;
	kata : string;
	a , sum: integer;
begin
	assign(fin,'integer.txt');
	reset(fin);
	
	//assign(fout,'integer.txt');
	//rewrite(fout);
	
	sum :=0;
	
	repeat
		
		read(fin,a);
		sum := sum + a;
		
	until ( a = 20 ) ;
	
	writeln;
	writeln('sudah tertulis');
	writeln(sum);
	
	close(fin);
	//close(fout);
end.
