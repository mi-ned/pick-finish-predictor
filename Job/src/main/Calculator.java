package main;
import java.time.LocalTime;

public class Calculator {
	
	public CompletionResult calculateCompletionTime(LocalTime startTime, Metrics metrics) {
		double hoursRequired = metrics.estimatedTimeRequired();
		long totalMinutes = Math.round(hoursRequired * 60);
		
		long daysAdded = 0;
		if(hoursRequired >= 24.0) {
			daysAdded = totalMinutes / (24 * 60);
		}
		
		
		LocalTime finishTime = startTime.plusMinutes(totalMinutes);
		return new CompletionResult(finishTime, daysAdded, hoursRequired);
	}

}
