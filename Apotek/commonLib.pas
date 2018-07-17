unit commonLib;
//library utama untuk semua tipe bentukan

interface
	type 
		date = record //tipe tanggal
			d,m,y : integer;
		end;
		
		kasir = record //tipe data tunggal untuk kasir
			tanggal : date;
			uang : string;
			keterangan : string;
			saldo : integer;
		end;
		
		inventori = record //tipe data tunggal untuk inventori
			nama : string;
			jumlah : integer;
			exp : date;
			satuan : integer;
			keterangan : string;
		end;
		
		transaksi = record //tipe data tunggal untuk transaksi
			tanggal : date;
			nama : string;
			jumlah : integer;
			keterangan : string;
			total : longint;
		end;
		
		arrKasir = record //tipe data gabungan untuk kasir
			list : array of kasir;
			jumlah : integer;
		end;
		
		arrInventori = record //tipe data gabungan untuk inventori
			list : array of inventori;
			jumlah : integer;
		end;
		
		arrTransaksi = record //tipe data gabungan untuk transaksi
			list : array of transaksi;
			jumlah : integer;
		end;
implementation
end.
