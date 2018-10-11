void mousePressed() {
	int posX = mouseX/(int)cellSize;
	int posY = mouseY/(int)cellSize;

	if(posX >= 0 && posX < numberOfColumns && posY >= 0 && posY <numberOfRows )
		cells[posX][posY].alive = true;
}

void mouseDragged() {
	int posX = mouseX/(int)cellSize;
	int posY = mouseY/(int)cellSize;
	if(posX >= 0 && posX < numberOfColumns && posY >= 0 && posY <numberOfRows )
		cells[posX][posY].alive = true;
	
}