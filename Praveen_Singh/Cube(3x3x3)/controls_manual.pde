void keyPressed() {
  
   
  if (key == ' ' && manual == false) {
    started = true; 
  }
  else if( key == 's'){
    if( started ) started  = false;
    if ( got ) got = false;
  }
  else if( key == 'm' && started == false){
    manual = true;
  }
  else {
    if(manual && !closed_man){
     switch (key) {
      case 'f': 
        turnZ(1, 1);
        output.print("F1 ");
        //print("F1" +"\t");
        break;
      case 'F': 
        turnZ(1, -1);
        output.print("F3 ");
        //print("F3" +"\t");
        break; 
    
      case 'b': 
        turnZ(-1, -1);
        output.print("B1 ");
        //print("B1" +"\t");
        break;
      case 'B': 
        turnZ(-1, 1);
        output.print("B3 ");
        //print("B3" +"\t");
        break;
    
      case 'u': 
        turnY(-1, 1);
        output.print("U1 ");
        //print("U1" +"\t");
        break;
      case 'U': 
        turnY(-1, -1);
        output.print("U3 ");
        //print("U3" +"\t");
        break;
      
      case 'd': 
        turnY(1, -1);
        output.print("D1 ");
        //print("D1" +"\t");
        break;
      case 'D': 
        turnY(1, 1);
        output.print("D3 ");
        //print("D3" +"\t");
        break;
      
      case 'l': 
        turnX(-1, -1);
        output.print("L1 ");
        //print("L1" +"\t");
        break;
      case 'L': 
        turnX(-1, 1);
        output.print("L3 ");
        //print("L3" +"\t");
        break;
      
      case 'r': 
        turnX(1, 1);
        output.print("R1 ");
        //print("R1" +"\t");
        break;
      case 'R': 
        turnX(1, -1);
        output.print("R3 ");
        //print("R3" +"\t");
        break;
      case 'e':
        output.flush();
        output.close();
        closed_man = true;
        break;
      
      }
    
    }
  }
  if( key == 'a' && ( closed_auto || closed_man ) )  got = true;
  
}
