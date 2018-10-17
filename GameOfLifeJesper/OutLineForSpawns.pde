public void outLineBlock(int x,int y) 
{	
	ellipse(x, y, cellSize, cellSize);
	ellipse(x, y + (cellSize * 1), cellSize, cellSize);
	ellipse(x + (cellSize * 1), y, cellSize, cellSize);		
}

public void outLineGlider(int x, int y) 
{
	ellipse(x, y, cellSize, cellSize);
	ellipse(x + (cellSize * 1), y - (cellSize * 2), cellSize, cellSize);
	ellipse(x + (cellSize * 1), y, cellSize, cellSize);
	ellipse(x + (cellSize * 1), y, cellSize, cellSize);
	ellipse(x + (cellSize * 2), y, cellSize, cellSize);
	ellipse(x + (cellSize * 2), y - (cellSize * 1), cellSize, cellSize);
}

public void outLineAcron(int x, int y)
{
	ellipse(x, y, cellSize, cellSize);
	ellipse(x + (cellSize * 1), y, cellSize, cellSize);
	ellipse(x + (cellSize * 1), y - (cellSize * 2), cellSize, cellSize);
	ellipse(x + (cellSize * 3), y - (cellSize * 1), cellSize, cellSize);
	ellipse(x + (cellSize * 4), y, cellSize, cellSize);
	ellipse(x + (cellSize * 5), y, cellSize, cellSize);
	ellipse(x + (cellSize * 6), y, cellSize, cellSize);
}