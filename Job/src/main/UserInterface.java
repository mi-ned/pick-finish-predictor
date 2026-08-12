package main;
import java.time.LocalTime;
import java.time.format.DateTimeParseException;
import java.util.InputMismatchException;
import java.util.Scanner;

public class UserInterface {
	
	private final Scanner scanner;
	private final Calculator calculator;
	
	public UserInterface() {
		this.scanner = new Scanner(System.in);
		this.calculator = new Calculator();
	}
	
	public void start() {
		System.out.println("--- Welcome to the Picking Time Estimator! ---");
		
		LocalTime currentTime = getValidTimeInput();
		
		int itemsRemaining = getPositiveIntegerInput("Please enter the number of items remaining: ");
		
		int numberOfPickers = getPositiveIntegerInput("Please enter the number of pickers in your team: ");
		
		int averagePickrate = getPositiveIntegerInput("Please enter the average pickrate for your team: ");
		
		Metrics metrics = new Metrics(itemsRemaining, numberOfPickers, averagePickrate);
		
		if(metrics.calculateTotalCapacity() == 0) {
			System.out.println("Calculation error: Total picking capacity is zero");
			System.out.println("This happens if the pickrate, or number of pickers is zero. Please ensure both are positive values");
		} else {
			LocalTime finishTime = calculator.calculateCompletionTime(currentTime, metrics);
			displayResults(currentTime, metrics, finishTime);
		}
		
		scanner.close();
		System.out.println("--- TERMINATED ---");
	}
	
	private LocalTime getValidTimeInput() {
		LocalTime time = null;
		while (time == null) {
			System.out.print("Please enter the current time: ");
			String timeInput = scanner.nextLine();
			try {
				time = TimeParser.parseTime(timeInput);
			} catch(DateTimeParseException e) {
				System.out.println("Could not recognise time format. Examples of valid entries:");
				System.out.println("   24-hr: 13:15, 13.15, 13 15, 1315, etc");
				System.out.println("   12-hr: 1:15 pm, 1.15pm, 115pm, 1pm, etc");
			}
		}
		return time;
	}
	
	private int getPositiveIntegerInput(String prompt) {
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
	
	private void displayResults(LocalTime startTime, Metrics metrics, LocalTime finishTime) {
		System.out.println("\n--- Your Picking Estimate ---");
		System.out.println("Current Time: " + startTime);
		System.out.println("Items remaining: " + metrics.getItemsRemaining());
		System.out.println("Number of Pickers: " + metrics.getCurrentNumberOfPickers());
		System.out.println("Average Pickrate: " + metrics.getAveragePickrate());
		System.out.println("Estimated Completion Time: " + finishTime);
	}
}
