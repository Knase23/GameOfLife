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
  updateAllCellsNeighbourCount();
}
int ownFrameLimit = 2;
int lastFrame;
int time;
int deltaTime;
float timeToPass = 1000f/(float)ownFrameLimit;

void draw()
{
  int currentTime = millis();
  deltaTime = currentTime - time; 
  runNexGen = spaceTogg.toggled;
  println(frameRate);
  //println(spaceTogg.toggled);
  //println("ownFrameLimit: "+ownFrameLimit);
  
  toggleChecks();
  increaseDecreaseTimeBetweenFrames();

  /*Draws out depending on time since last frame*/
  if(currentTime - lastFrame > timeToPass)
  {
    if(runNexGen)
    {
        updateAllCellsNeighbourCount();
        generationNumber++;
    }
    background(0);
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
     lastFrame = currentTime;
  }
  time = currentTime;
  updateTitle();
  
  //backSpaceOnce = true; 
}
public void updateAllCellsNeighbourCount()
{
  for(int x = 0; x < numberOfColumns; x++)
  {
    for(int y = 0; y < numberOfRows; y++)
    {
      int numberOfLivingAround = 0;
      /*Top to Bottom*/
      for (int i = -1; i < 2; ++i) {
        /* Check if (x + i) is outside of the Array*/
      	if(x + i >= 0 && x + i < numberOfColumns)
      	{
          /*Right to Left*/
      		for (int j = -1; j < 2; ++j) {
            /* Check if (y + j) is outside of the Array */
      			if(y + j >= 0 && y + j < numberOfRows)
      			{
              /*Count up: number of living neighbours*/
      				if(cells[x+i][y+j].alive && !(i == 0 && j == 0))
      				{
      					numberOfLivingAround++;
      				}
      			}
      		}
      	}
      }
      cells[x][y].numberOfNeighbours = numberOfLivingAround;
    }
  }
}

public void increaseDecreaseTimeBetweenFrames()
{
  /* Increases the time interval when next time it should draw out*/
  if(isNumpadPlusPressed) //&& !isNumpadPlusStillPressed)
  {
    ownFrameLimit++;
    timeToPass = 1000f/(float)ownFrameLimit;
  }
  //isNumpadPlusStillPressed = isNumpadPlusPressed;
  
  /* Increases the time interval when next time it should draw out*/
  if(isNumpadMinusPressed)// && !isNumpadMinusStillPressed)
  {
    ownFrameLimit--;
    if(ownFrameLimit < 1)
      ownFrameLimit = 1;
    timeToPass = 1000f/(float)ownFrameLimit;
  }
  //isNumpadMinusStillPressed = isNumpadMinusPressed;


}
public void updateTitle()
{
  String titleString = "Generation: "+ generationNumber;
  titleString = titleString + " | FrameLimit: "+ ownFrameLimit;

  if (!runNexGen)
    titleString = titleString + " | Paused"; 

  if(isSpacePressed)
    titleString = titleString + " | Spacebar";

  if(isNumpadPlusPressed)
    titleString = titleString + " | Increase FrameLimit";

  if(isNumpadMinusPressed)
    titleString = titleString + " | Decrease FrameLimit";

  surface.setTitle(titleString);
}