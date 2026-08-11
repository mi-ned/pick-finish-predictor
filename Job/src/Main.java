import java.time.LocalTime;
import java.time.format.DateTimeParseException;
import java.util.InputMismatchException;
import java.util.Scanner;

public class Main {
	
	private static LocalTime currentTime = null;
	private static int itemsRemaining = 0;
	private static int averagePickrate = 0;
	private static int numberOfPickers = 0;
	//private static boolean dropdownExpected = false; //exp
	
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
		
		double estimatedTimeRequired = (double)itemsRemaining / (double)totalCapacity;
		
		long wholeHours = (long) estimatedTimeRequired;
		double remainder = estimatedTimeRequired - wholeHours;
		
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
