boolean isSpacePressed = false;
boolean isNumpadPlusPressed = false;
boolean isNumpadMinusPressed = false;

// boolean isNumpadPlusStillPressed = false;
// boolean isNumpadMinusStillPressed = false;

ToggleStruct spaceTogg = new ToggleStruct(500);

void keyPressed() {
	if(keyCode == 32)
		isSpacePressed = true;
	if(keyCode == 107)
		isNumpadPlusPressed = true;
	if(keyCode == 109)
		isNumpadMinusPressed = true;
}
void keyReleased() {
	if(keyCode == 32)
		isSpacePressed = false;
	if(keyCode == 107)
		isNumpadPlusPressed = false;
	if(keyCode == 109)
		isNumpadMinusPressed = false;
}

void toggleChecks()
{
	if(spaceTogg.CheckLastTime(isSpacePressed))
	{
		spaceTogg.toggled = !spaceTogg.toggled;
	}
}