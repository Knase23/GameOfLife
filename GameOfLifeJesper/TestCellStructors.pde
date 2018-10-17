public void spawnBlock(int x,int y) 
{
  cells[x][y].alive = true;
  try 
  {
    cells[x][y + 1].alive = true;
    cells[x + 1][y].alive = true;
  } 
  catch (Exception e) 
  {
    
  }
  
}

public void spawnGlider(int x,int y)
{
  cells[x][y].alive = true;
  try 
  {
    cells[x + 1][y - 2].alive = true;
    cells[x + 1][y].alive = true;
    cells[x + 2][y].alive = true;
    cells[x + 2][y - 1].alive = true;
    
  } 
  catch (Exception e) 
  {
    
  }
}

public void spawnAcorn(int x,int y)
{
  //Base from Bottom-Left

  cells[x][y].alive = true;
  try {
    cells[x + 1][y].alive = true;
    cells[x + 1][y - 2].alive = true;
    cells[x + 3][y - 1].alive = true;
    cells[x + 4][y].alive = true;
    cells[x + 5][y].alive = true;
    cells[x + 6][y].alive = true;
  }
  catch (Exception e) {
    
  }
}

