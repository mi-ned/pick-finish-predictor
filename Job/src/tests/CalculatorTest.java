package tests;

import static org.junit.jupiter.api.Assertions.*;

import java.time.LocalTime;

import org.junit.jupiter.api.Test;

import main.Calculator;
import main.CompletionResult;
import main.Metrics;

class CalculatorTest {

	@Test
	void testExactOneHourCompletion() {
	    Calculator calculator = new Calculator();
	    Metrics metrics = new Metrics(1000, 10, 100);
	    LocalTime startTime = LocalTime.of(8, 0);
	    
	    CompletionResult result = calculator.calculateCompletionTime(startTime, metrics);
	    assertEquals(LocalTime.of(9, 0), result.getFinishTime());
	    assertEquals(0, result.getDaysAdded());
	}

	@Test
	void testRoundingUpFromThirtyMinutes() {
	    Calculator calculator = new Calculator();
	    Metrics metrics = new Metrics(500, 10, 100);
	    LocalTime startTime = LocalTime.of(8, 0);
	    
	    CompletionResult result = calculator.calculateCompletionTime(startTime, metrics);
	    assertEquals(LocalTime.of(8, 30), result.getFinishTime());
	    assertEquals(0, result.getDaysAdded());
	}

	@Test
	void testRoundingUpFromThirtySeconds() {
	    Calculator calculator = new Calculator();
	    Metrics metrics = new Metrics(10, 10, 100);
	    LocalTime startTime = LocalTime.of(8, 0);
	    
	    CompletionResult result = calculator.calculateCompletionTime(startTime, metrics);
	    assertEquals(LocalTime.of(8, 1), result.getFinishTime());
	    assertEquals(0, result.getDaysAdded());
	}
	
	@Test
	void testMultiDayCompletion() {
		Calculator calculator = new Calculator();
		Metrics metrics = new Metrics(5000, 1, 100);
		LocalTime startTime = LocalTime.of(10, 0);
		CompletionResult result = calculator.calculateCompletionTime(startTime, metrics);
	    assertEquals(LocalTime.of(12, 0), result.getFinishTime());
	    assertEquals(2, result.getDaysAdded());
	    assertTrue(result.isMultiDay());
	    assertEquals(50.0, result.getTotalHours());
	}
	
	
}
