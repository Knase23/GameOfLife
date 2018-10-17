public void testBlock(int x,int y) 
{

  /*Test a stabile pattern: Block*/
  cells[x][y].alive = true;
  try {
    cells[x][y + 1].alive = true;
    cells[x + 1][y].alive = true;
  } catch (Exception e) {
    
  }
  
}

public void testGlider(int x,int y)
{
  /*Test: Gilder*/
  cells[x][y].alive = true;
  try {
    cells[x + 1][y + 1].alive = true;
    cells[x + 2][y + 1].alive = true;
    cells[x + 2][y].alive = true;
    cells[x + 2][y-1].alive = true;
    
  } catch (Exception e) {
    
  }
}
  