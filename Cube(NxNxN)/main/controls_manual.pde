
void keyPressed() {

  if (key == ' ' && manual == false) {
    started = true; 
  }
  else if( key == 's'){
    if( started ) started  = false;

  }
  else if( key == 'm' && started == false){
    manual = true;
  }
  else {
    if(manual && !closed_man){
     switch (key) {
      case 'F': 
        turnZ(k, 1);
        break;
      case 'B': 
        turnZ(-k, -1);
        break;
      case 'U': 
        turnY(-k, 1);
        break;
      case 'D': 
        turnY(k, -1);
        break;
      case 'L': 
        turnX(-k, -1);
        break;
      case 'R': 
        turnX(k, 1);
        break;
      case 'f':
          if(dim >3 )
          turnZ(k-increment,1);
          break;
      case 'b':
          if(dim >3 )
          turnZ(-k+increment,-1);
          break;
      case 'u':
          if(dim >3 )
          turnY(-k+increment,1);
          break;
      case 'd':
          if(dim >3 )
          turnY(k-increment,1);
          break;
      case 'l':
          if(dim >3 )
          turnX(-k+increment,1);
          break;
      case 'r':
          if(dim >3 )
          turnX(k-increment,1);
          break;
     //for all to mid motion
      case 'z':
        if(dim>3)
        turnZmid(increment-1,k,increment);
        break;
      case 'Z':
        if(dim>3)
        turnZmid(-k,-increment+1,increment);
        break;
      case 'Y':
        if(dim>3)
        turnYmid(increment-1,k,increment);
        break;
      case 'y':
        if(dim>3)
        turnYmid(-k,-increment+1,increment);
        break;
      case 'x':
        if(dim>3)
        turnXmid(increment-1,k,increment);
        break;
      case 'X':
        if(dim>3)
        turnXmid(-k,-increment+1,increment);
        break;
      //for n/2 slice
      case 'g':
        if( dim>5)
        turnZ(1,1);
        break;
      case 'G':
        if( dim>5)
        turnZ(-1,1);
        break;
      case 'h':
        if( dim>5)
        turnY(-1,1);
        break;
      case 'H':
        if( dim>5)
        turnY(1,1);
        break;
      case 'i':
        if( dim>5)
        turnX(1,1);
        break;
      case 'I':
        if( dim>5)
        turnX(-1,1);
        break;
      //for n/4 slice
      case 'n':
        if( dim>11)
        turnZ(pro,1);
        break;
      case 'N':
        if( dim>11)
        turnZ(-pro,1);
        break;
      case 'o':
        if( dim>11)
        turnY(-pro,1);
        break;
      case 'O':
        if( dim>11)
        turnY(pro,1);
        break;
      case 'p':
        if( dim>11)
        turnX(pro,1);
        break;
      case 'P':
        if( dim>11)
        turnX(-pro,1);
        break;
      case 'e':
        output.flush();
        output.close();
        closed_man =true;
    
      }
      
    
    }
  }
  
}
