import java.time.LocalTime;

public class Time {
	
	private LocalTime time;
	
	//constructor
	public Time(LocalTime time) {
		this.time = time;
	}
	
	//getter
	public LocalTime getTime() {
		return this.time;
	}
	
	//setter
	public void setTime(LocalTime time) {
		this.time = time;
	}
}