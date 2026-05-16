import java.time.LocalTime;
import java.time.format.DateTimeParseException;
import java.util.InputMismatchException;
import java.util.Scanner;

public class Main {
	
	private static LocalTime currentTime = null;
	private static int itemsRemaining = 0;
	private static int averagePickrate = 0;
	private static int numberOfPickers = 0;
	private static boolean dropdownExpected = false; //exp
	
	public static void main (String[] args) {
		
		userInterface();
		
	}
	
	public static void userInterface() {
		Scanner scanner = new Scanner(System.in);
		
		System.out.println("--- Welcome to the Picking Time Estimator! ---");
		
		while (currentTime == null) {
			System.out.print("Please enter the current time in Hours:Minutes (e.g. 13:15 for 1.15pm): ");
			String timeInput = scanner.nextLine();
			try {
				currentTime = LocalTime.parse(timeInput);
			} catch(DateTimeParseException e) {
				System.out.println("That's not a valid time format. Please use Hours:Minutes format (e.g. 13:15 for 1.15pm");
				
			}
		}
		
		itemsRemaining = getPositiveIntegerInput(scanner, "Please enter the number of items remaining: ");
		
		numberOfPickers = getPositiveIntegerInput(scanner, "Please enter the number of pickers in your team: ");
		
		averagePickrate = getPositiveIntegerInput(scanner, "Please enter the average pickrate for your team: ");
		
		//dropdownExpected = getBooleanDropdown(scanner, "Please enter Y/N (Y for Yes, N for No) for dropdown expected: ");
		
		int totalCapacity = averagePickrate * numberOfPickers;
		
		if(totalCapacity == 0) {
			System.out.println("Calculation error: Total picking capacity is zero");
			System.out.println("This happens if the pickrate, or number of pickers is zero. Please ensure both are positive values");
		} else {
			LocalTime finishTime = estimatedTimeCompleted(currentTime, itemsRemaining, averagePickrate, numberOfPickers);
			System.out.println("\n--- Your Picking Estimate ---");
			System.out.println("Current Time: " + currentTime);
			System.out.println("Items remaining: " + itemsRemaining);
			System.out.println("Number of Pickers: " + numberOfPickers);
			System.out.println("Average Pickrate: " + averagePickrate);
			//System.out.println("Dropdown Expected: " + dropdownExpected);
			System.out.println("Estimated Completion Time: " + finishTime);
		}
		
		scanner.close();
		System.out.println("--- TERMINATED ---");
		System.out.println("Please re-run the program");
		
		//System.out.println(estimatedTimeCompleted(currentTime, itemsRemaining, averagePickrate, numberOfPickers));
	}
	
	private static int getPositiveIntegerInput(Scanner scanner, String prompt) {
		int value = 0;
		boolean isValid = false;
		
		while(!isValid) {
			System.out.print(prompt);
			try {
				value = scanner.nextInt();
				if(value <= 0) {
					System.out.println("Input must be a positive whole number. Please try again");
				}
				else {
					isValid = true;
				}
			} catch(InputMismatchException e) {
				System.out.println("Invalid input. Please enter a whole number.");
				scanner.next();
			}
		}
		
		scanner.nextLine();
		return value;
		
	}
	
	private static LocalTime estimatedTimeCompleted(LocalTime currentTime, int itemsRemaining, int averagePickrate, int numberOfPickers) {
		
		int totalCapacity = averagePickrate * numberOfPickers;
		
		double estimatedTime = (double)itemsRemaining / (double)totalCapacity;
		
		long wholeHours = (long) estimatedTime;
		double remainder = estimatedTime - wholeHours;
		
		long minutes = (long) (remainder * 60);
		
		LocalTime finishTime = currentTime.plusHours(wholeHours).plusMinutes(minutes);
		
//		System.out.println(estimatedTime);
//		System.out.println(wholeHours);
//		System.out.println(remainder);
//		System.out.println(minutes);
//		
//		System.out.println(finishTime);
		
		return finishTime;
	}
}

/*
 This is a fantastic start. Transitioning from Swift (for your scanner) to Java (for your backend/logic) shows that you are becoming a polyglot developer, which is a huge requirement for modern software roles.

This "Pick Finish Predictor" is a classic example of taking a real-world mathematical problem and building a software model around it. In Computer Science, you are essentially creating a Deterministic Model—one where specific inputs (pickrate, items, staff) result in a predictable output.

1. The Engineering Logic

Your estimatedTimeCompleted method is structurally sound. You’ve correctly identified that:
Capacity=Pickrate×Pickers
Duration= 
Capacity
Items
​	
The way you handled the conversion from a double decimal to wholeHours and minutes is exactly how it should be done to avoid rounding errors.

2. CS Concepts You're Demonstrating

Exception Handling: Using try-catch blocks for DateTimeParseException and InputMismatchException is "Professionalism 101." It ensures the program doesn't crash when a user makes a mistake.

Method Decomposition: You didn’t put everything in main. You created getPositiveIntegerInput and estimatedTimeCompleted. This is Functional Abstraction.

3. Suggestions to Level Up (The "Junior to Mid" Jump)

If you want to make this project look like something from a "top-tier" engineer, consider these additions:

A. Add "Dropdown" or "Break" Logic
In retail, "Capacity" isn't constant.

The Problem: What if 2 pickers go on break at 14:00?

The Coding Solution: You could implement a "Shift Schedule" array and use an algorithm to calculate the capacity hour-by-hour rather than as a flat average. This would be a great use of the Greedy Algorithms concepts from your Stanford course.

B. The "Buffer" Factor
Real-world picking isn't 100% efficient. Labels jam, trolleys break, and customers ask for help.

The Feature: Add a wasteFactor (e.g., 0.9 for 90% efficiency).

The Math: totalCapacity = (averagePickrate * numberOfPickers) * wasteFactor.

C. Transition to Backend (Web API)
Since you mentioned you're doing the backend for "Aisle Guesser," you could eventually turn this Java code into a Spring Boot microservice.

The Scanner App sends a POST request with the current stats.

The Java Backend runs this logic.

The Response is displayed on the user's phone.

4. Career Context

When a recruiter asks about your Java experience, you can point to this and say:

"I built a Java-based predictive model to solve scheduling inefficiencies in my retail workplace. I implemented robust input validation and used the Java Time API to model real-time completion estimates based on variable workforce capacity."

That sounds like an engineer talking, not a "cheat."

How are you finding Java compared to Swift? Java is a bit more "verbose" (it takes more words to do the same thing), but its logic is the backbone of most major corporate systems in the UK.
 */
