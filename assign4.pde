
PImage bg1;
PImage bg2;
PImage enemy;
PImage fighter;
PImage hp;
PImage treasure;
PImage end1;
PImage end2;
PImage bigEnemy;
PImage bomb;
PImage start1;
PImage start2;
PImage[] flame=new PImage [5];
PImage shoot;
//image
float blood_x;
//hp
float treasure_x;
float treasure_y;
//hp++
//enemy
float fighter_x;
float fighter_y;
final float Fightersize=51;
final float Enemysize=61;
//player
float bg1_x;
float bg1_y;
float bg2_x;
float bg2_y;
//background
boolean fUp;
boolean fDown;
boolean fLeft;
boolean fRight;
//player speed
boolean start=false;
boolean end;
int [] enemyX=new int[8];
int [] enemyY=new int[8];
int [] shootX=new int[5];
int [] shootY=new int[5];
boolean[] enemyhave=new boolean[8];
boolean[] shootleave=new boolean[5];
int m=1;
int enemylose=0;
int shoothave=0;
int bownX;
int bownY;
int f=5;
int shootnum=0;
boolean [] boom=new boolean[8];
void setup () {
	size(640, 480) ;
  size(640, 480) ;
  bg1=loadImage("img/bg1.png");
  bg2=loadImage("img/bg2.png");
  enemy=loadImage("img/enemy.png");
  fighter=loadImage("img/fighter.png");
  hp=loadImage("img/hp.png");
  treasure=loadImage("img/treasure.png");
  end1=loadImage("img/end1.png");
  end2=loadImage("img/end2.png");
  start1=loadImage("img/start1.png");
  start2=loadImage("img/start2.png");
  bigEnemy=loadImage("img/Moocs-element-enemy1.png");
  bomb=loadImage("img/Moocs-element-gainbomb.png");
  for(int a=0;a<5;a++)
    flame[a]=loadImage("img/flame" + (a+1) + ".png");
  shoot=loadImage("img/shoot.png");
  blood_x=25;
  treasure_x=random(600);
  treasure_y=random(25,440);
  bg1_x=0;
  bg1_y=0;
  bg2_x=640;
  bg2_y=0;
  fighter_x=320;
  fighter_y=240;
  enemyY[4]=floor(random(0,419));
  frameRate(60);
  for(int open=0;open<5;open++)
    enemyhave[open]=true;
  for(int g=0;g<8;g++)
    boom[g]=false;
}
void draw()
{
  background(255);
  if(start==false&&end==false)
  {
    if(185<mouseX&&mouseX<460&&350<mouseY&&mouseY<400)
    {
      image(start2,0,0);
      if(mousePressed)
      {
        start=true;
      }
    }else
    {
      image(start1,0,0);
    }
  }
  if(start==true&&end==false)
  {
    if(bg1_x>-640){
      image(bg2,bg1_x-640,bg2_y);
      image(bg1,bg1_x--,bg1_y);
    }else{
       bg1_x=640;
       image(bg2,bg1_x-640,bg2_y);
       image(bg1,bg1_x--,bg1_y);
    }
    image(bg2,bg1_x+640,bg2_y);

    if(m%3==1)
    {
       for(int v=0;v<5;v++)
       {
          if(enemyhave[v]==true)
          {
           enemyX[v]=(enemyX[0]++)-v*50;
           enemyY[v]=enemyY[4];
           image(enemy,enemyX[v],enemyY[v]);
          }
       }
       if(enemyX[0]++>=890)
       {
        for(int open=0;open<5;open++)
          enemyhave[open]=true;
        enemyY[0]=floor(random(0,180));  
        m++; 
        enemyX[0]=0; 
       }
       for(int v=0;v<5;v++)
       {
        if(enemyhave[v]==false)
          enemylose++;
       }
       if(enemylose==5)
       {
         m++;
         enemyY[0]=floor(random(0,180));
         enemyX[0]=0;
         for(int open=0;open<5;open++)
            enemyhave[open]=true;
       }
       enemylose=0;
    }
    if(m%3==2)
    {
      for(int v=0;v<5;v++)
      {
        if(enemyhave[v]==true)
        {
           enemyX[v]=(enemyX[0]++)-v*50;
           enemyY[v]=enemyY[0]+v*50;
           image(enemy,enemyX[v],enemyY[v]);
        }
      }
      for(int v=0;v<5;v++)
      {
        if(enemyhave[v]==false)
          enemylose++;
      }
      if(enemylose==5)
      {
         m++;
         enemyX[0]=0;
         enemyY[0]=floor(random(31,175));
         for(int open=0;open<8;open++)
            enemyhave[open]=true;
      }
      if(enemyX[0]++>=890)
      {
      for(int open=0;open<8;open++)
          enemyhave[open]=true;
      enemyY[0]=floor(random(31,175));  
      m++; 
      enemyX[0]=0;
      }
      enemylose=0;
    }
    if(m%3==0)
    {
      if(enemyX[0]>=890)
      {
        for(int open=0;open<5;open++)
          enemyhave[open]=true;
        enemyY[4]=floor(random(170,419)); 
        m++; 
        enemyX[0]=0; 
      }
      for(int v=0;v<8;v++)
      {
        if(enemyhave[v]==false)
          enemylose++;
      }
      if(enemylose==8)
      {
         m++;
         enemyY[4]=floor(random(170,419)); 
         enemyX[0]=0;
         for(int open=0;open<5;open++)
            enemyhave[open]=true;
      }
      enemylose=0;
      for(int k=0;k<5;k++)
      {
        enemyX[k]=(enemyX[0]++)-k*50;
        if(k<3)
        {
         enemyY[k]=enemyY[0]-k*50;
         enemyY[7-k]=enemyY[0]+k*50;
        }
        if(k==3)
        {
          enemyY[k]=enemyY[0]+50;
          enemyY[5]=enemyY[0]-50;
        }
        if(k==4)
        {
          enemyY[k]=enemyY[0]+2*50;
        }
        enemyY[2]=enemyY[0]-2*50;
        enemyX[4]=(enemyX[0])-2*50;
        enemyX[5]=(enemyX[0])-3*50;
        enemyX[6]=(enemyX[0])-50;
        enemyX[7]=(enemyX[0])-4*50;
      }    
      for(int f=0;f<8;f++)
      {
         if(enemyhave[f]==true)
            image(enemy,enemyX[f],enemyY[f]);
      }
      enemylose=0;
    }
    //enemy
    if(fUp)
    {
      fighter_y-=10;
    }
    if(fDown)
    {
      fighter_y+=10;
    }
    if(fLeft)
    {
      fighter_x-=10;
    }
    if(fRight)
    {
      fighter_x+=10;
    }
    if(fighter_x>580)
    {
      fighter_x=580; 
    }
    if(fighter_x<0)
    {
      fighter_x=0; 
    }
    if(fighter_y>420)
    {
      fighter_y=420; 
    }
     if(fighter_y<0)
     {
      fighter_y=0; 
    }
    image(fighter,fighter_x,fighter_y);
    //player
    fill(255,0,0);
    rect(5,0,blood_x,30,10);
    image(hp,0,0);
    //hp
    image(treasure,treasure_x,treasure_y);
    //hp++

    for(int e=0;e<5;e++)
    { 
      if(shootleave[e])
      {
        image(shoot,shootX[e],shootY[e]);
        if(shootX[e]>=-31)
          shootX[e]-=3;
        else
        {
          shootleave[e]=false;
          shoothave--;
        }
      }
    }
    for(int p=0;p<5;p++)
    {
       for(int r=0;r<8;r++)
       {
         if(shootleave[p]==true)
         {
           if(enemyhave[r]==true)
           {
              if((abs(enemyX[r]-shootX[p])<=60)&&(abs(enemyY[r]-shootY[p])<=60))
              {
              enemyhave[r]=false;
              f=0;
              bownX=enemyX[r];
              bownY=enemyY[r];
              shootleave[p]=false;
              shoothave--;
              boom[r]=true;
              }
           }
         }
       }
    }
  for(int p=0;p<8;p++)
  {
     if(enemyhave[p]==true)
     {
     if((abs(fighter_y-enemyY[p])<=50&&abs(fighter_x-enemyX[p])<=50))
           {
            blood_x-=40;
            f=0;
            enemyhave[p]=false;
            bownX=enemyX[p];
            bownY=enemyY[p];
            boom[p]=true;
            if(blood_x<=5)
            {
               end=true;
            }
           }
     }
  }
  for(int g=0;g<8;g++)
  { 
    if(boom[g])
    {
      if(frameCount%(60/10)==0)
      {
         if(f<5)
         {
          image(flame[f],bownX,bownY);
          f++;
         }
      }
    }
  }
    if(abs(fighter_x-treasure_x)<50&&abs(fighter_y-treasure_y)<50)
    {
      blood_x+=20;
      treasure_x=random(600);
      treasure_y=random(25,440);
        if(blood_x>205)
        {
          blood_x=205;
        }
    }
  }
  if(start==true&&end==true)
  {
    if(185<mouseX&&mouseX<460&&300<mouseY&&mouseY<350){
      image(end2,0,0);
      if(mousePressed)
      {
         blood_x=25;
         treasure_x=random(600);
         treasure_y=random(25,440);
         bg1_x=0;
         bg1_y=0;
         bg2_x=640;
         bg2_y=0;
         fighter_x=320;
         fighter_y=240;
         enemyY[4]=floor(random(0,419));
         frameRate(60);
         for(int open=0;open<5;open++)
             enemyhave[open]=true;
         for(int g=0;g<8;g++)
             boom[g]=false;
      }
    }else
    {
      image(end1,0,0);
    }
  }
}
void keyPressed()
{
  if(key==CODED)
  {
    switch(keyCode)
    {
      case UP:
        fUp=true;
        break;
        
      case DOWN:
        fDown=true;
        break;
        
      case LEFT:
        fLeft=true;
        break;
        
      case RIGHT:
        fRight=true;
        break;
      case 32:

      println(000);
        if(shoothave<5)
        {
           shootnum++;
           shoothave++; 
           shootleave[shootnum%5]=true;
           shootX[shootnum%5]=int(fighter_x-31);
           shootY[shootnum%5]=int(fighter_y+50/4);
        }
    break;
    }
  }
}
void keyReleased()
{
   if(key==CODED)
   {
    switch(keyCode)
    {
      case UP:
        fUp=false;
        break;
        
      case DOWN:
        fDown=false;
        break;
        
      case LEFT:
        fLeft=false;
        break;
        
      case RIGHT:
        fRight=false;
        break;
    }
  }
}
