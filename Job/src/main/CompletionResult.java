package main;

import java.time.LocalTime;

public class CompletionResult {
	
	private final LocalTime finishTime;
	private final long daysAdded;
	private final double totalHours;
	
	public CompletionResult(LocalTime finishTime, long daysAdded, double totalHours) {
		this.finishTime = finishTime;
		this.daysAdded = daysAdded;
		this.totalHours = totalHours;
	}
	
	public LocalTime getFinishTime() { return finishTime; }
	public long getDaysAdded() { return daysAdded; }
	public double getTotalHours() { return totalHours; }
	public boolean isMultiDay() { return daysAdded > 0; }
}
