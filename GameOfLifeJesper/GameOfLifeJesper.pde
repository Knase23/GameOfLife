GameObject cells[][];
float cellSize = 10;
int numberOfColumns,numberOfRows;

int fillPercentage = 15;
int generationNumber = 0;
boolean runNexGen = true;

void setup()
{
  size(800,800);
  frameRate(60);
  //frame.setTitle("WOW");
  surface.setTitle("Generation: "+ generationNumber);

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
  // cells[1][1].alive = true;
  // cells[1][2].alive = true;
  // cells[2][1].alive = true;
  
  /* Test */

  /*Test: Gilder*/
  // cells[1][1].alive = true;
  // cells[2][2].alive = true;
  // cells[3][2].alive = true;
  // cells[3][1].alive = true;
  // cells[3][0].alive = true;
}
int ownFrameLimit = 2;
int lastFrame;
int currentTime;
void draw()
{
  int time = millis();


  println(spaceTogg.toggled);
  runNexGen = spaceTogg.toggled;
  toggle();
	surface.setTitle("Generation: "+ generationNumber);
  if(currentTime - lastFrame > 1000/ownFrameLimit)
  {
    background(0);
    updateAllCellsNeighbourCount();
  	 for(int x = 0; x < numberOfColumns; x++)
  	 {
      	for(int y = 0; y < numberOfRows; y++)
      	{
        		cells[x][y].draw();
            if(runNexGen)
            {
              cells[x][y].checkIfAlive();
            }
      	}
  	 }
      if(runNexGen)
      {
        generationNumber++;
      }
      lastFrame = time;
    }
    currentTime = time;
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

