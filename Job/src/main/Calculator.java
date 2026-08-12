package main;
import java.time.LocalTime;

public class Calculator {
	
	public LocalTime calculateCompletionTime(LocalTime startTime, Metrics metrics) {
		double hoursRequired = metrics.estimatedTimeRequired();
		
		long totalMinutes = Math.round(hoursRequired * 60);
		
		return startTime.plusMinutes(totalMinutes);
	}

}
