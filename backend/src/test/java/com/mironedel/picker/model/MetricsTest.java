package com.mironedel.picker.model;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.Test;

class MetricsTest {
	
	//Calculate Total Capacity
	@Test
	void testTotalCapacityCalculationZeroAveragePickrate() {
		Metrics metrics = new Metrics(10000,50,0);
		assertEquals(0.0, metrics.calculateTotalCapacity());
	}
	
	@Test
	void testTotalCapacityCalculationZeroNumberPickers() {
		Metrics metrics = new Metrics(1000,0,200);
		assertEquals(0.0, metrics.calculateTotalCapacity());
	}

	//Estimated Time Required
	@Test
	void testEstimatedTimeRequiredZero() {
		Metrics metrics = new Metrics(0,0,0);
		assertEquals(0.0, metrics.estimatedTimeRequired());
	}
}


/*
	public int calculateTotalCapacity() {
		return this.averagePickrate * this.currentNumberOfPickers;
	}
	
	public double estimatedTimeRequired() {
		
		int totalCapacity = calculateTotalCapacity();
		if(totalCapacity == 0) {
			return 0.0;
		}
		
		return (double) itemsRemaining / (double) totalCapacity;
	}
*/