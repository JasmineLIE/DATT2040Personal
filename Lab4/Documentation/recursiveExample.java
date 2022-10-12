package week2;
/**
 * This class contains a few statics recursive examples 
 * @author Marzieh Ahmadzadeh
 * @version 1
 *
 */

public class RecursiveExamples {
	public static void main(String[] args) {
		/*System.out.println(isPalindrome(""));
		System.out.println(isPalindrome("r"));
		System.out.println(isPalindrome("racecar"));
		System.out.println(isPalindrome("racer"));*/
		//int[] sampleArray = {1, 2, 3, 4, 5, 6};
		//System.out.println("sum = " + arraySum(sampleArray, 0));
		//System.out.println("sum = " + arraySumV2(sampleArray, 0, sampleArray.length-1));
//		int number = 3;
//		System.out.println("the number of items greater than " + number + " = " + countGreater(sampleArray, number, sampleArray.length-1));
//		
//		System.out.println("The pair of rabbits at month 10 = " + fibonacchi (10));
//		// try fibonacchi at month 48 and see what happens!
//		int [] fibonacciPair = linearFibonacci (10);
//		System.out.println("The pair of rabbits at month 10 = " + fibonacciPair[1]);
//		// with linearFibonacci, you can simply call it with month = 48
//		fibonacciPair = linearFibonacci (48);
//		System.out.println("pair of rabbits at month 48 = " + fibonacciPair[1]);
		towersOfHanoi(4, 'A', 'B', 'C');
		
	}
	/**
	 * It checks if the given string is palindrome.
	 * @param input is a string that is checked for being palindrome
	 * @return returns true if the input is palindorme, false otherwise
	 */
	public static boolean isPalindrome(String input) { 
		boolean palindrome = false;
		if (input.length() <= 1 ) 
			palindrome = true;
		else  	
			palindrome =   (input.charAt(0) == input.charAt(input.length()-1)) && isPalindrome(input.substring(1, input.length()-1));
		return palindrome;

	}
	/**
	 * A recursion to find the factorial of an integer number. 
	 * @param n a positive integer number
	 * @return returns the factorial of the given input 
	 */
	
	public static int fact(int n) {
		if (n == 0) 
			return 1;
		else
			return n * fact(n-1); 
	}
	/**
	 * Computes base to the power of n
	 * @param n a positive integer number
	 * @param base, is the base for power computation
	 * @return returns base to the nth  
	 */
	
	public static int power(int n, int base) {
		if (n == 0) 
			return 1;
		else
			return base * power(n-1, base); 
	}

	/**
	 * A recursion to find the sum of the elements in an array. The approach to divide and conquer is to 
	 * solve the problem for one input and combine the solution with the solution for the rest of n-1 inputs. 
	 * @param input is an array of int
	 * @param index is the starting index for the computation
	 * @return returns the sum of the items in the array
	 */
	
	public static int arraySum(int[] input, int index) {
		if (index == input.length - 1) 
			return input[index];
		else
			return input[index] + arraySum(input, index + 1);
	}
	/**
	 * A recursion to find the sum of the elements in an array. The method of algorithm design is to break down 
	 * the problem into two half and solve each half separately.
	 * @param input is an array of int
	 * @param begin is the starting point for the computation
	 * @param end is the ending index of the array that is used for computation
	 * @return returns the sum of the items in the array
	 */
	public static int arraySumV2(int[] input, int begin, int end) {
		if (begin == end) 
			return input[begin];
		else {
			return arraySumV2(input, begin, (begin+end)/2) + arraySumV2(input, (begin+end)/2+1, end);
		}
	}
	/**
	 * A binary recursion to solve the problem of Fibonacci.
	 * @param month show the month for which the number of rabbits are counted
	 * @return the number of produced rabbits in the given month
	 */
	public static int fibonacchi (int month) {
		if (month == 1 || month == 2 )
			return 1; //this is the pair of rabbit
		else
			return fibonacchi(month -1) + fibonacchi (month - 2); // pair of rabbits at month-1 + pair of rabbits at month-2
	}
	/**
	 * This is a linear recursion that solves the problem of Fibonacci. The performance of this method is 
	 * significantly better then binary Fibonacci.
	 * @param month month show the month for which the number of rabbits are counted
	 * @return the number of produced rabbits in the given month
	 */
	public static int[] linearFibonacci (int month) {
		int [] output= {0,0};
	    if (month == 1) {
	        output[0] = 0;
	        output[1] = 1;
	    }
	    else {
	        output = linearFibonacci(month-1);
	        int temp = output[0];
	        output[0] = output[1];
	        output[1] = temp + output[1];
	    }
	    return output;

	}
	/**
	 * 
	 * @param input is an array 
	 * @param number is the base number that is used to find the number of items, which are greater than this base number.
	 * @param index is the last index of the array that is used for computation
	 * @return the number of items that are greater than the given number
	 */
	public static int countGreater (int[] input, int number, int index) {
		if (index == -1)
			return 0;
		else 
			if (input[index] > number )
				return 1 + countGreater(input, number, index - 1);
			else 
				return countGreater(input, number, index - 1);
	}
	
	/**
	 * 
	 * @param top shows the disks' number. The number for the smaller disk is 1.
	 * @param from shows the name of the rod, where the disks move from
	 * @param middle shows the name of the rod that is used as a temporary place for the disks
	 * @param to shows the name of the rod, where the disks move to
	 */
	public static void towersOfHanoi(int top, char from, char middle, char to) {
		      if (top == 1)
		         System.out.println("Disk 1 from " + from + " to " + to);
		      else {
		    	  towersOfHanoi(top - 1, from, to, middle);
		         System.out.println("Disk " + top + " from " + from + " to " + to);
		         towersOfHanoi(top - 1, middle, from, to);
		      }
	}
	

}