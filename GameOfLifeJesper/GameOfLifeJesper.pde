GameObject cells[][];
float cellSize = 10;
int numberOfColumns,numberOfRows;

int fillPercentage = 15;

void setup()
{
  size(512,512);
  frameRate(2);
  //frame.setTitle("WOW");
  surface.setTitle("Generation: "+ 0);

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

  /* Test a stabile pattern: Block*/
  //cells[1][1].alive = true;
  //cells[1][2].alive = true;
  //cells[2][1].alive = true;
}
void draw()
{
	surface.setTitle("Generation: "+ (frameCount-1));
	background(0);
  	updateAllCellsNeighbourCount();
  	for(int x = 0; x < numberOfColumns; x++)
  	{
    	for(int y = 0; y < numberOfRows; y++)
    	{
      		cells[x][y].draw();
      		cells[x][y].checkIfAlive();
    	}
  	}
  //backSpaceOnce = true;
  
}
public void updateAllCellsNeighbourCount()
{
  for(int x = 0; x < numberOfColumns; x++)
  {
    for(int y = 0; y < numberOfRows; y++)
    {
      int numberOfCellsAround = 0;

      for (int i = -1; i < 2; ++i) {
      	if(x + i >= 0 && x + i < numberOfColumns)
      	{
      		for (int j = -1; j < 2; ++j) {
      			if(y + j >= 0 && y + j < numberOfRows)
      			{
      				if(cells[x+i][y+j].alive && !(i == 0 && j == 0))
      				{
      					numberOfCellsAround++;
      				}
      			}
      		}
      	}
      }
      cells[x][y].numberOfNeighbours = numberOfCellsAround;
    }
  }
}

