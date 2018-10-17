
GameObject cells[][];
boolean runNexGen = true;

int generationNumber = 0;
int ownFrameLimit = 2;
int numberOfColumns,numberOfRows;
int fillPercentage = 15;

int lastFrame;
int time;
int deltaTime;
float timeToPass = 1000f/(float)ownFrameLimit;

float cellSize = 10;

void setup()
{
  size(800,800);
  frameRate(60);
  surface.setTitle("Generation: "+ generationNumber);
  gameSetup();  
  updateAllCellsNeighbourCount();
}

void draw()
{
  int currentTime = millis();
  deltaTime = currentTime - time; 
  runNexGen = spaceTogg.toggled;
  
  checkButtonIsToggled();
  frameLimitUpdate();

  /*Draws out depending on time since last frame*/
  if(currentTime - lastFrame > timeToPass)
  {
    if(runNexGen)
    {
        updateAllCellsNeighbourCount();
        generationNumber++;
    }

    drawBackground();
    drawGameBoard();

    if(runNexGen)
    {
        updateAllCells();
    }

    lastFrame = currentTime;
  }
  time = currentTime;
  updateTitle(); 
}


public void updateAllCellsNeighbourCount()
{
  for(int x = 0; x < numberOfColumns; x++)
  {
    for(int y = 0; y < numberOfRows; y++)
    {
      cells[x][y].numberOfNeighbours = calculateNumberOfLivingNeighbours(x,y);
    }
  }
  
}

public int calculateNumberOfLivingNeighbours(int x,int y)
{
  int numberOfLivingAround = 0;
  for (int i = -1; i < 2; ++i)
  {
    if(isNotOutsideOfArray(x,i,numberOfColumns))
    {
      for (int j = -1; j < 2; ++j) {
        if(isNotOutsideOfArray(y,j,numberOfRows))
        {
          if(cells[x+i][y+j].alive && !(i == 0 && j == 0))
          {
            numberOfLivingAround++;
          }
        }
      }
    }
  }
  return numberOfLivingAround;
}

public boolean isNotOutsideOfArray(int axis,int otherAxis,int size)
{
  if (axis + otherAxis >= 0 && axis + otherAxis < size)
    return true;
  
  return false;
}

public void drawBackground() 
{
   background(0);
}

public void drawGameBoard() 
{
  for(int x = 0; x < numberOfColumns; x++)
    {
      for(int y = 0; y < numberOfRows; y++)
      {
        cells[x][y].draw();
      }
    }
}
public void updateAllCells() 
{
   for(int x = 0; x < numberOfColumns; x++)
    {
      for(int y = 0; y < numberOfRows; y++)
      {
        cells[x][y].checkIfAlive();
      }
    }
}
