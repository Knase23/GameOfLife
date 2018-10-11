boolean isSpacePressed = false;
ToggleStruct spaceTogg = new ToggleStruct(500);

void keyPressed() {
	if(key == 32)
		isSpacePressed = true;
	if(key == 107)
		isSpacePressed = true;
	if(key == 109)
		isSpacePressed = true;
}
void keyReleased() {
	if(key == 32)
		isSpacePressed = false;
	if(key == 107)
		isSpacePressed = true;
	if(key == 109)
		isSpacePressed = true;
}

void toggle()
{
	if(spaceTogg.CheckLastTime(isSpacePressed))
	{
		spaceTogg.toggled = !spaceTogg.toggled;
	}
}