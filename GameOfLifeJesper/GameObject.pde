public class GameObject
{
  public float x,y,size;
  public boolean alive = false;
  public int numberOfNeighbours = 0;
  
  public GameObject(float x,float y,float size)
  {
    this.x = x;
    this.y = y;
    this.size = size;
  }
  
  public void draw()
  {
    color c = color(120, 120, 0);
    if(alive)
    {
      switch (numberOfNeighbours) {
        case 0 :
          c = color(255, 30, 30);
        break; 
        case 1 :
          c = color(100,100,150);
        break;
        case 2 :
          c = color(30,255,30);
        break;  
        case 3 :
          c = color(30,100,100);
        break;     
         default :  
          c = color(255, 30, 30);
        break; 
      }
      fill(c);
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
