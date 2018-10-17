public class GameObject
{
  public float x,y,size;
  public boolean alive = false;
  public int numberOfNeighbours = 0;
  public float alphaV = 255;
  public color apperanceColor = color(0, 0, 0);
  
  public GameObject(float x,float y,float size)
  {
    this.x = x * size;
    this.y = y * size;
    this.size = size;
  }
  
  public void draw()
  {
    stroke(50); 

    if(alive)
    {
      alphaV = 255;
      /*Change color depending on how many neighbours around it*/
      changeCellColor();
      fill(apperanceColor,alphaV);
      ellipse(this.x,this.y,this.size,this.size);
    } else {
      alphaV -= 150;
      fill(apperanceColor,alphaV);
      ellipse(this.x,this.y,this.size,this.size);
    }
  }

  public void changeCellColor()
  {
    switch (numberOfNeighbours) {
        case 0 :
          apperanceColor = color(255, 30, 30);
        break; 
        case 1 :
          apperanceColor = color(35,125,125);
        break;
        case 2 :
          apperanceColor = color(30,255,30);
        break;  
        case 3 :
          apperanceColor = color(30,100,100);
        break;     
         default :  
          apperanceColor = color(255, 30, 30);
        break; 
      }
  }

  public void checkIfAlive() {
    if(numberOfNeighbours < 2 || numberOfNeighbours > 3 )
    {
      alive = false;
    }  
    if(numberOfNeighbours == 3)
    {
      alive = true;
    }    
  }

}
