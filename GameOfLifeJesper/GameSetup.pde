public void gameSetup() {
  numberOfRows =  (int)Math.floor(height/cellSize);
  numberOfColumns = (int)Math.floor(width/cellSize);
  ellipseMode(LEFT);
  cells = new GameObject[numberOfColumns][numberOfRows];
  
  for(int x = 0; x < numberOfColumns; x++)
  {
    for(int y = 0; y < numberOfRows; y++)
    {
      cells[x][y] = new GameObject(x*cellSize, y *cellSize,cellSize);
      if(random(0, 100) < fillPercentage)
      {
        cells[x][y].alive = true;
      }
    }
  }
}