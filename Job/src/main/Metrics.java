package main;

public class Metrics {
	
	private int itemsRemaining;
	private int averagePickrate;
	private int currentNumberOfPickers;
	
	//constructor
	public Metrics(int itemsRemaining, int currentNumberOfPickers,  int averagePickrate) {
		this.itemsRemaining = itemsRemaining;
		this.currentNumberOfPickers = currentNumberOfPickers;
		this.averagePickrate = averagePickrate;
	}
	
	//getters
	public int getItemsRemaining() {
		return this.itemsRemaining;
	}
	
	public int getAveragePickrate() {
		return this.averagePickrate;
	}
	
	public int getCurrentNumberOfPickers() {
		return this.currentNumberOfPickers;
	}
	
	//setters
	public void setItemsRemaining(int itemsRemaining) {
		this.itemsRemaining = itemsRemaining;
	}
	
	public void setAveragePickrate(int averagePickrate) {
		this.averagePickrate = averagePickrate;
	}
	
	public void setCurrentNumberOfPickers(int currentNumberOfPickers) {
		this.currentNumberOfPickers = currentNumberOfPickers;
	}
	
	//calculations
	public int calculateTotalCapacity() {
		return this.averagePickrate * this.currentNumberOfPickers;
	}
	
	public double estimatedTimeRequired() {
		
		int totalCapacity = calculateTotalCapacity();
		if(totalCapacity == 0) {
			return 0;
		}
		
		return (double) itemsRemaining / (double) totalCapacity;
	}
	
	

}
