package week3;
/**
 * This class makes use of the user defined class of Student
 * @author Marzieh Ahmadzadeh
 */
public class IntroductionToClasses {
	public static void main (String[] args) {
		int noOfStudents = 1;
		// defining an object using the default constructor
		Student john = new Student();
		john.initial = 'J';
		john.studentId = 1234;
		john.enrolmentYear = 2016;
		john.courseTaken = new int [2];
		john.courseTaken[0] = 2030;
		john.courseTaken[1] = 2031;
		
		noOfStudents ++;
		// defining the second object using the default constructor
    	Student jane = new Student();
		jane.initial = 'J';
		jane.studentId = 5678;
		jane.enrolmentYear = 2020;
		
		System.out.println("John's graduate date is " + john.graduationDate());
		System.out.println("Jane's graduate date is " + jane.graduationDate());

		// defining an object using the third constructor
		int[] course = {2030, 2031};
		Student jade = new Student('J', 5678, course, 2016);

		//defining an object using the second constructor
		Student alice = new Student('A', 1256, 2016);

		// defining an object using the copy constructor. This is an example of deep copy.
		System.out.println("---- an example of deep copy ----");
		Student rose = new Student(alice);
		System.out.println(alice.initial);
		System.out.println(rose.initial);
		alice.initial = '#';
		System.out.println(alice.initial);
		System.out.println(rose.initial);
		System.out.println("---- an example of shallow copy ----");
		rose.initial = 'R';
		rose.studentId = 1000;
		rose.enrolmentYear = 2020;
		Student julia = rose;
		System.out.println(julia.initial);
		System.out.println(rose.initial);
		rose.initial = '#';
		System.out.println(julia.initial);
		System.out.println(rose.initial);

		
	}

}

/**
 * This class introduces a student
 *
 */
class Student {
	char initial;
	int studentId;
	int[] courseTaken;
	int enrolmentYear;
	
	/**
	 * This is the initial constructor that does not assign meaningful values to the instance variables. 
	 */
	public Student (){
		initial = ' ';
		studentId = 0;
		enrolmentYear = 0;
	}
	/**
	 * 
	 * @param initial is the initial value for 'initial' field
	 * @param studentId is the initial value for 'studentId' field
	 * @param enrolmentYear is the initial value for 'enrolmentYear' field
	 */
	public Student (char initial, int studentId,  int enrolmentYear) {
		this.initial = initial; 
		this.studentId = studentId;
		this.enrolmentYear = enrolmentYear;		
	}

	/**
	 * 
	 * @param init is the initial value for 'initial' field
	 * @param sid is the initial value for 'studentId' field
	 * @param cTaken is the initial value for courseTaken field
	 * @param eYear is the initial value for enrolmentYear field
	 */
	public Student (char initial, int studentId, int [] courseTaken, int enrolmentYear) {
		this(initial, studentId, enrolmentYear);  
		this.courseTaken = new int [courseTaken.length];
		for (int i= 0; i < courseTaken.length; i++)
			this.courseTaken[i] = courseTaken[i];	
	}
	/**
	 * 
	 * @param st is an object of Student
	 */

	public Student (Student st) {
		this.initial = st.initial;
		this.studentId = st.studentId;
		this.enrolmentYear = st.enrolmentYear;
	}
	/**
	 * 
	 * @return returns the year of graduation for this student
	 */

	public int graduationDate() {
		return enrolmentYear + 4;
	}
}
