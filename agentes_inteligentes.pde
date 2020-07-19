class circulo{
  float x,y,saltox,saltoy,incx,incy,radio;
  circulo(){
    x=random(0,width);
    y=random(0,height);
    saltox=random(1,2);
    saltoy=random(0,1);
    incx=random(-0.1,0.1);
    incy=random(-0.1,0.1);
    radio=60;
  }
  
  void mover(){
    x = x + saltox;
    y = y + saltoy;
    saltox += incx;
    saltoy += incy;
    
    if((x > width) || (x < 0)){
      saltox = saltox * -1;
    }
    
    if((y > height) || (y < 0)){
      saltoy = saltoy * -1;
    }
  }
  
  void draw(){
    mover();
    noStroke();
    fill(255,255,0);
    circle(x,y,radio);
  }
}
class varioscirculos
{
  
  circulo[] p;
  int n;
  varioscirculos(int n)
  {
    this.n=n;
    p=new circulo[n];
    for(int i=0; i < n; i++)
    {
      p[i]=new circulo();
    }
    print(n);
  }
  
  void draw()
  {
    for(int i=0; i < n; i++)
    {
      p[i].draw();
    }
  }
  
  
  void choquePrueba()
  {
    for(int j=0; j<n;j++)
    {
      for(int i=j+1;i < n; i++)
      {
        float distancia = sqrt( (p[j].x - p[i].x)*(p[j].x - p[i].x) + (p[j].y - p[i].y)*(p[j].y - p[i].y) );
        if ( distancia < p[j].radio ) {
        // Colisión detectada
          c1 = new varioscirculos(n+1);
          p[j].saltox*=-1;
          p[j].saltoy*=-1;
          p[i].saltox*=-1;
          p[i].saltoy*=-1;
        }
      }
    }
  }
}

static varioscirculos c1;
static circulo cir;
void setup()
{
  size(600,600);
  c1=new varioscirculos(2);
  
}

void draw()
{
  background(0,0,0);
  c1.draw();
  c1.choquePrueba();
}
