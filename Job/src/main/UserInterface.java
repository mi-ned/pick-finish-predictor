package main;
import java.time.LocalTime;
import java.time.format.DateTimeParseException;
import java.util.InputMismatchException;
import java.util.Scanner;

public class UserInterface {
	
	private final Scanner scanner;
	private final Calculator calculator;
	private final LanguageService i18n;
	
	public UserInterface(LanguageService i18n) {
		this.scanner = new Scanner(System.in);
		this.calculator = new Calculator();
		this.i18n = i18n;
	}
	
	public void start() {
		System.out.println(i18n.getString("welcome"));
		
		LocalTime currentTime = getValidTimeInput();
		
		int itemsRemaining = getPositiveIntegerInput(i18n.getString("prompt.items"));
		
		int numberOfPickers = getPositiveIntegerInput(i18n.getString("prompt.pickers"));
		
		int averagePickrate = getPositiveIntegerInput(i18n.getString("prompt.pickrate"));
		
		Metrics metrics = new Metrics(itemsRemaining, numberOfPickers, averagePickrate);
		
		if(metrics.calculateTotalCapacity() == 0) {
			System.out.println(i18n.getString("error.capacity_zero"));
		} else {
			LocalTime finishTime = calculator.calculateCompletionTime(currentTime, metrics);
			displayResults(currentTime, metrics, finishTime);
		}
		
		scanner.close();
		System.out.println(i18n.getString("terminated"));
	}
	
	private LocalTime getValidTimeInput() {
		LocalTime time = null;
		while (time == null) {
			System.out.print(i18n.getString("prompt.time"));
			String timeInput = scanner.nextLine();
			try {
				time = TimeParser.parseTime(timeInput);
			} catch(DateTimeParseException e) {
				System.out.println(i18n.getString("error.invalid_time"));
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
					System.out.println(i18n.getString("error.positive_number"));
				}
				else {
					isValid = true;
				}
			} catch(InputMismatchException e) {
				System.out.println(i18n.getString("error.integer_required"));
				scanner.next();
			}
		}
		
		scanner.nextLine();
		return value;
		
	}
	
	private void displayResults(LocalTime startTime, Metrics metrics, LocalTime finishTime) {
		System.out.println(i18n.getString("results.header"));
		System.out.println(i18n.getString("results.current_time", startTime));
		System.out.println(i18n.getString("results.items", metrics.getItemsRemaining()));
		System.out.println(i18n.getString("results.pickers", metrics.getCurrentNumberOfPickers()));
		System.out.println(i18n.getString("results.pickrate", metrics.getAveragePickrate()));
		System.out.println(i18n.getString("results.finish_time", finishTime));
	}
}
