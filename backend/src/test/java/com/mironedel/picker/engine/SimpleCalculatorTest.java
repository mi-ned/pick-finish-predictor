package com.mironedel.picker.engine;

import static org.junit.jupiter.api.Assertions.*;

import java.time.LocalTime;

import org.junit.jupiter.api.Test;

import com.mironedel.picker.model.CompletionResult;
import com.mironedel.picker.model.Metrics;

class SimpleCalculatorTest {

	@Test
	void testExactOneHourCompletion() {
	    SimpleCalculator calculator = new SimpleCalculator();
	    Metrics metrics = new Metrics(1000, 10, 100);
	    LocalTime startTime = LocalTime.of(8, 0);
	    
	    CompletionResult result = calculator.calculateCompletionTime(startTime, metrics);
	    assertEquals(LocalTime.of(9, 0), result.getFinishTime());
	    assertEquals(0, result.getDaysAdded());
	}

	@Test
	void testRoundingUpFromThirtyMinutes() {
	    SimpleCalculator calculator = new SimpleCalculator();
	    Metrics metrics = new Metrics(500, 10, 100);
	    LocalTime startTime = LocalTime.of(8, 0);
	    
	    CompletionResult result = calculator.calculateCompletionTime(startTime, metrics);
	    assertEquals(LocalTime.of(8, 30), result.getFinishTime());
	    assertEquals(0, result.getDaysAdded());
	}

	@Test
	void testRoundingUpFromThirtySeconds() {
	    SimpleCalculator calculator = new SimpleCalculator();
	    Metrics metrics = new Metrics(10, 10, 100);
	    LocalTime startTime = LocalTime.of(8, 0);
	    
	    CompletionResult result = calculator.calculateCompletionTime(startTime, metrics);
	    assertEquals(LocalTime.of(8, 1), result.getFinishTime());
	    assertEquals(0, result.getDaysAdded());
	}
	
	@Test
	void testMultiDayCompletion() {
		SimpleCalculator calculator = new SimpleCalculator();
		Metrics metrics = new Metrics(5000, 1, 100);
		LocalTime startTime = LocalTime.of(10, 0);
		CompletionResult result = calculator.calculateCompletionTime(startTime, metrics);
	    assertEquals(LocalTime.of(12, 0), result.getFinishTime());
	    assertEquals(2, result.getDaysAdded());
	    assertTrue(result.isMultiDay());
	    assertEquals(50.0, result.getTotalHours());
	}
	
	
}
