module Latihan where

--menghitung hasil perkalian 2 angka
--DEFINISI DAN SPESIFIKASIka
kali :: Int->Int-> Int 
--Realisasi
kali a b = a*b

--menghitung pangkat 3 dengan bantuan pangkat 2
-- DEFINISI DAN SPESIFIKASI
fx2 :: Int -> Int
fx3 :: Int -> Int
--Realisasi
fx2 x = x*x
fx3 x = fx2 x * x

--menentukan apakah suatu kombinasi 3 angka menunjukan waktu yang benar
-- DEFINISI DAN SPESIFIKASI
isJamValid :: Int -> Int -> Int -> Bool
--Realisasi
isJamValid j m d = (j>= 0) && (j<=23) && (m>= 0) && (m<=59) && (d>= 0) && (d<=59)

--menentukan apakah tahun tersebut adalah kabisat
--DEFINISI DAN SPESIFIKASI
isKabisat :: Int -> Bool
--Realisasi
isKabisat t = (mod t 4==0 && (mod t 100) /= 0)|| mod t 400 == 0

--menghitung mean olimpiad
--DEFINISI DAN SPESIFIKASI
mo :: Float -> Float -> Float -> Float -> Float
max2 :: Float -> Float -> Float
min2 :: Float -> Float -> Float
--Realisasi
mo a b c d = 
   let maksimum = max2 (max2 a b) (max2 c d)
       minimum = min2 (min2 a b) (min2 c d)
       jumlah = a+b+c+d
   in
       (jumlah - minimum - maksimum)/2
max2 x y =
    if (x > y ) then
        x
    else 
        y
min2 x y =
    if (x < y ) then
        x
    else 
        y
		
--menetukan apakah angka yan dimasukan membentuk tanggal yan benar
--DEFINISI DAN SPESIFIKASI
isDateValid :: Int -> Int -> Int -> Bool
--Realisasi
isDateValid d m y
	| m==1 || m==3 || m==5 || m==7 || m==8 || m==10 || m == 12 = d>=1 && d <= 31 && y>=0 && y<=99
	| m==4 || m==6 || m==9 || m==11 = d>=1 && d <= 30 && y>=0 && y<=99
	| m==2 = d>= 1 && d<= (if isKabisat y == True then 29 else 28) && y>= 0 && y<=99
	|otherwise = False