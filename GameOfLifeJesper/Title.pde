public void updateTitle()
{
  /*Draws out on the title bar, depending on what is happening*/
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