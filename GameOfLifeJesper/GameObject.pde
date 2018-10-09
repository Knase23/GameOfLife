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
    if(alive)
    {
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
