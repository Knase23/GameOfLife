boolean isAPressed = false;
boolean isBPressed = false;
boolean isGPressed = false;
boolean isSpacePressed = false;
boolean isNumpadPlusPressed = false;
boolean isNumpadMinusPressed = false;

ToggleStruct spaceTogg = new ToggleStruct();

public void keyPressed() 
{
	if(keyCode == 65)
		isAPressed = true;
	
	if(keyCode == 66)
		isBPressed = true;

	if(keyCode == 71)
		isGPressed = true;

	if(keyCode == 32)
		isSpacePressed = true;
	
	if(keyCode == 107)
		isNumpadPlusPressed = true;
	
	if(keyCode == 109)
		isNumpadMinusPressed = true;
	
	
}
public void keyReleased() 
{
	if(keyCode == 65)
		isAPressed = false;

	if(keyCode == 66)
		isBPressed = false;

	if(keyCode == 71)
		isGPressed = false;

	if(keyCode == 32)
		isSpacePressed = false;
	
	if(keyCode == 107)
		isNumpadPlusPressed = false;
	
	if(keyCode == 109)
		isNumpadMinusPressed = false;
}

public void checkButtonIsToggled()
{
	if(spaceTogg.CheckLastTime(isSpacePressed))
	{
		spaceTogg.toggled = !spaceTogg.toggled;
	}
}