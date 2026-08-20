package com.mironedel.picker.engine;
import java.time.LocalTime;

import org.springframework.stereotype.Component;

import com.mironedel.picker.model.CompletionResult;
import com.mironedel.picker.model.Metrics;

@Component
public class SimpleCalculator implements PickPredictor {
	
	@Override
	public CompletionResult predictFinishTime(Metrics metrics) {
		return calculateCompletionTime(LocalTime.now(), metrics);
	}
	
	public CompletionResult calculateCompletionTime(LocalTime startTime, Metrics metrics) {
		double hoursRequired = metrics.estimatedTimeRequired();
		long totalMinutes = Math.round(hoursRequired * 60);
		
		long daysAdded = totalMinutes / (24 * 60);
		LocalTime finishTime = startTime.plusMinutes(totalMinutes);
		
		return new CompletionResult(finishTime, daysAdded, hoursRequired);
	}
	
	
	
	
	
}
