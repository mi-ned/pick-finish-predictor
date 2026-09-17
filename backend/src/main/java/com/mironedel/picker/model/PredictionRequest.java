package com.mironedel.picker.model;

public class PredictionRequest {
	
	private String inputTime;
	private Metrics metrics;
	
	public PredictionRequest() {}
	
	public PredictionRequest(String inputTime, Metrics metrics) {
		this.inputTime = inputTime;
		this.metrics = metrics;
	}
	
	public String getInputTime() {
		return inputTime;
	}
	
	public void setInputTime(String inputTime) {
		this.inputTime = inputTime;
	}
	
	public Metrics getMetrics() {
		return metrics;
	}
	
	public void setMetrics(Metrics metrics) {
		this.metrics = metrics;
	}

}
