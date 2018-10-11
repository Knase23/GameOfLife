public class ToggleStruct{

	boolean toggled;
	int lastTime;
	int keyCodeNumber;
	int timeInBetweenChecks;
	public ToggleStruct (int timeBetween) {
		this.toggled = false;
		this.lastTime = 0;
		this.timeInBetweenChecks = timeBetween;
	}
	public boolean CheckLastTime(boolean isItPressed) {

		boolean result = false;
		if(isItPressed && time - lastTime > timeInBetweenChecks || lastTime == 0)
		{
			result = true;
			lastTime = time;
		}

		return result;
	}

}