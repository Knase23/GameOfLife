public void frameLimitUpdate() 
{
  increaseFrameLimit();
  decreaseFrameLimit();
}

public void decreaseFrameLimit()
{
  if(isNumpadMinusPressed)
  {
    ownFrameLimit--;
    if(ownFrameLimit < 1)
      ownFrameLimit = 1;
    timeToPass = 1000f/(float)ownFrameLimit;
  }
}

public void increaseFrameLimit() 
{
  if(isNumpadPlusPressed) 
  {
    ownFrameLimit++;
    timeToPass = 1000f/(float)ownFrameLimit;
  }
}