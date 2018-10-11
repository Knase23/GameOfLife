public class GameObject
{
  public float x,y,size;
  public boolean alive = false;
  public int numberOfNeighbours = 0;
  public float alphaV = 255;
  public color apperanceColor = color(0, 0, 0);
  
  public GameObject(float x,float y,float size)
  {
    this.x = x;
    this.y = y;
    this.size = size;
  }
  
  public void draw()
  {
    
    if(alive)
    {
      alphaV = 255;
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
      fill(apperanceColor,alphaV);
      ellipse(this.x,this.y,this.size,this.size);
    } else {
      alphaV -= 150;
      fill(apperanceColor,alphaV);
      ellipse(this.x,this.y,this.size,this.size);
      
    }
  }


  public void checkIfAlive() {
    if(numberOfNeighbours < 2)
    {
      
      alive = false;
    } else if(numberOfNeighbours > 3)
    {
      alive = false;
    } else if(alive){
      alive = true;
    }

    if(!alive && numberOfNeighbours == 3)
    {
      alive = true;
    }    
  }
}
