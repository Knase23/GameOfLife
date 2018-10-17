public void mousePressed() 
{
	setCellsAlive();
}

public void mouseDragged()
{
	setCellsAlive();	
}

public void setCellsAlive()
{
	int posX = mouseX/(int)cellSize;
	int posY = mouseY/(int)cellSize;
	if(isNotOutsideOfArray(posX,0,numberOfColumns) && isNotOutsideOfArray(posY,0,numberOfRows))
	{
		if(isAPressed)
		{
			spawnAcorn(posX,posY);
		}
		else if(isBPressed) 
		{
			spawnBlock(posX,posY);
		}
		else if (isGPressed)
		{
			spawnGlider(posX,posY);
		}
		else {
			cells[posX][posY].alive = true;
		}
	}	
}
public void viewOutLines()
{
	int posX = mouseX;
	int posY = mouseY;
	
	noFill();
	stroke(255, 0, 0);
	ellipseMode(CENTER);
	if(isAPressed)
	{
		outLineAcron(posX,posY);
	}
	else if(isBPressed) 
	{
		outLineBlock(posX,posY);
	}
	else if (isGPressed)
	{
		outLineGlider(posX,posY);
	}
	else {
		ellipse(posX, posY, cellSize, cellSize);
	}
}