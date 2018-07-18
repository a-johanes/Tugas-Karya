/*
	Johanes
	21/5/18
	TakeHomeCodingTest_Johanes.java
	Program that performs a basic math operation expressed in indonesian 
	words
*/

import java.util.Scanner;

public class TakeHomeCodingTest_Johanes {
	public static final String delims = "[ ]+";
	public static void main (String[] args) {
		Scanner input = new Scanner(System.in);
		System.out.println();
		System.out.println("This program takes indonesian basic math expression as input.");
		System.out.println("And will output the result.");
		System.out.println("ex: 'dua tambah dua' will return 'dua tambah dua adalah empat'");
		System.out.println("    'dua kurang satu' will return 'dua kurang satu adalah satu'");
		System.out.println("The program can takes any number between -999 until 999, just type 'negatif' for negative value.");
		System.out.println("The program can takes three operator: plus ('tambah'), minus ('kurang') and times ('kali').");
		System.out.println("The program can't check and can't take wrong input, so please enter it correctly.");
		System.out.println("The program will finish when you type in '-999'");
		System.out.println("                                                                                        Created by: Johanes");
		System.out.println(); //comments
		System.out.print("Input: ");
		String equation = input.nextLine(); //inputing
		while ( !(equation.equals("-999")) ) {
			System.out.println("Output: " +equation + " adalah " +word(calculate(equation))); //doing calculation and output
			System.out.println();
			System.out.print("Input: "); //asking for input again
			equation = input.nextLine();
		}
	}
	public static int number(String number) {//makes words into number between -999 until 999
		String[] temp = number.split(delims); //splitting the input into array called "temp"
		int output = 0; //output base
		boolean neg = false; //flag for negative number
		if ( temp[0].equals("negatif") ){ //if the input is a negatif
			neg = true;
			shiftArrayLeft(temp); //make the array move on cell left
		}
		if (temp.length == 1) { //only one word 
			switch (temp[0]) {
				case "nol" : 
					output = 0;
					break;
				case "satu" : 
					output = 1;
					break;
				case "dua" : 
					output = 2;
					break;
				case "tiga" : 
					output = 3;
					break;
				case "empat" : 
					output = 4;
					break;
				case "lima" : 
					output = 5;
					break;
				case "enam" : 
					output = 6;
					break;
				case "tujuh" : 
					output = 7;
					break;
				case "delapan" : 
					output = 8;
					break;
				case "sembilan" : 
					output = 9;
					break;
				case "sepuluh" : 
					output = 10;
					break;
				case "sebelas" : 
					output = 11;
					break;
				case "seratus" : output = 100;
			}
		} else if (temp.length == 2) { //two word
			output = number(temp[0]);
			if (temp[1].equals("belas") ) output += 10;
			else if (temp[1].equals("puluh") ) output *= 10;
			else if (temp[1].equals("ratus") ) output *= 100;
		} else { //more than two word
			String first_part = temp[0] + " " + temp[1];
			String second_part = "";
			for (int i = 2; i < temp.length; i++) {
				second_part += temp[i] + " ";
			}
			output = number(first_part) + number(second_part);
		}
		if (neg) output *= -1; //if negatif is true than multiply it by -1
		
		return output;
	}	
	
	public static int calculate(String input) { //doing the calculation by recognizing operator
		String[] temp = input.split(delims); //splitting intput into "temp" array
		int i = 0;
		String[] operator = {"tambah","kurang","kali"}; //list of the operator
		String input_one = "";
		String input_two = "";
		while ( !(temp[i].equals(operator[0]) || temp[i].equals(operator[1]) || temp[i].equals(operator[2]) ) ) { //finding the operator along the input
			input_one += temp[i]+ " "; //making the first number
			++i;
		}
		int ind_operator = i; //storing the operator index
		++i;
		
		while (i < temp.length) {
			input_two += temp[i]+ " "; //making the seconf number
			++i;
		}
		int output = 0; //output base number
		int pertama = number(input_one); //first number as integer
		int kedua = number(input_two); //second number as integer
		
		//operation
		if (temp[ind_operator].equals(operator[0])) { // plus 
			output = pertama  + kedua;
		} else if (temp[ind_operator].equals(operator[1])) { // minus
			output = pertama - kedua;
		} else if (temp[ind_operator].equals(operator[2])) { // multiply
			output = pertama * kedua;
		} 
		
		return output;
	}
	
	public static String word(int x) { //function for convert number as integer to string
		String output = ""; //output base value
		if (x < 0) { // x<0
			output += "negatif ";
		}
		x = Math.abs(x);
		if ( x < 12) { // 0<= x <= 11
			switch (x) {
				case 0 : 
					output += "nol";
					break;
				case 1 : 
					output += "satu";
					break;
				case 2 : 
					output += "dua";
					break;
				case 3 : 
					output += "tiga";
					break;
				case 4 : 
					output += "empat";
					break;
				case 5 : 
					output += "lima";
					break;
				case 6: 
					output += "enam";
					break;
				case 7 : 
					output += "tujuh";
					break;
				case 8: 
					output += "delapan";
					break;
				case 9 : 
					output += "sembilan";
					break;
				case 10: 
					output += "sepuluh";
					break;
				case 11: 
					output += "sebelas";
			}
		} else if (x<100) { // 12<= x <= 99
			if ( x%10 == 0) { //dozens
				output += word(x/10) + " puluh";
			} else if ( x < 20 ) { // 12 <= x <= 19
				output += word(x%10) + " belas";
			} else { // 21 <= x <= 99 excluding the dozens
				output += word(x/10) + " puluh " + word(x%10);
			}
		} else if ( x < 1000) { // 100 <= x <= 999
			if ( x < 200) {
				output += "seratus";
				if (x != 100) output += " " + word(x%100);
			} else {
				if (x%100 == 0) output += word(x/100) + " ratus";
				else output += word(x/100) + " ratus " + word(x%100);
			}
		} else if (x < 1000000) { // 1000 <= x <= 999999
			if ( x < 2000) {
				output += "seribu";
				if (x != 1000) output += " " + word(x%1000);
			} else {
				if (x%1000 == 0) output += word(x/1000) + " ribu"; 
				else output += word(x/1000) + " ribu " + word(x%1000);
			}
		}
		return output;
	}
	
	public static void shiftArrayLeft(String[] input){ //shifting array one cell left
		for ( int i = 1; i < input.length; i++ ) {
			input[i-1] = input[i];
		}
	}
}
