import peasy.*;

PeasyCam cam;
PrintWriter output;
int dim = 3;
Cubie[] cube = new Cubie[dim*dim*dim];

String[] allMoves = {"F1" , "F2" , "F3" , 
                     "B1" , "B2" , "B3" , 
                     "D1" , "D2" , "D3" ,
                     "U1" , "U2" , "U3" ,
                     "R1" , "R2" , "R3" ,
                     "L1" , "L2" , "L3" };
//String[] allMoves = {"U1"};
                 

int n = int( random(10,25)); // range of size of scramble set 
//int n =19;
//ArrayList<String> Solve = new ArrayList<String>();
String[] sequence = new String[n];
int counter1 = 0;
int counter2 =0;
int counter3=0;
int counter4=0;
int counter5=0;
int counter6=0;
int counter7 = 0;
boolean manual = false;
boolean started = false;
boolean got = false;
boolean closed_man= false;
boolean closed_auto = false;
boolean twoturns = false;
char case_value = ' ';

void setup() {
  
  size(600, 600, P3D);
  cam = new PeasyCam(this, 400);
  int index = 0;
  for (int x = -1; x <= 1; x++) {
    for (int y = -1; y <= 1; y++) {
      for (int z = -1; z <= 1; z++) {
        PMatrix3D matrix = new PMatrix3D();
        matrix.translate(x, y, z);
        cube[index] = new Cubie(matrix, x, y, z);
        index++;
      }
    }
  }
  
  output = createWriter("RandomScramble.txt");
  

   
  
 
}
 
void turnZ(int index, int dir) {
  for (int i = 0; i < cube.length; i++) {
    Cubie qb = cube[i];
    if (qb.z == index) {
      
      PMatrix2D matrix = new PMatrix2D();
      matrix.rotate(dir*HALF_PI);
      matrix.translate(qb.x,qb.y);
      qb.update(round(matrix.m02) , round(matrix.m12) , round(qb.z));
      qb.turnFacesZ(dir);
    }
  }
}

void turnY(int index, int dir) {
  for (int i = 0; i < cube.length; i++) {
    Cubie qb = cube[i];
    if (qb.y == index) {
      PMatrix2D matrix = new PMatrix2D();
      matrix.rotate(dir*HALF_PI);
      matrix.translate(qb.x,qb.z);
      qb.update(round(matrix.m02) , round(qb.y) , round(matrix.m12));
      qb.turnFacesY(dir);
    }
  }
}

void turnX(int index, int dir) {
  for (int i = 0; i < cube.length; i++) {
    Cubie qb = cube[i];
    if (qb.x == index) {
      PMatrix2D matrix = new PMatrix2D();
      matrix.rotate(dir*HALF_PI);
      matrix.translate(qb.y,qb.z);
      qb.update(round(qb.x) , round(matrix.m02) , round(matrix.m12));
      qb.turnFacesX(dir);
    }
  }
}

void draw() {
  background(51); 
 if( started && counter4<1 ){
    for (int i = 0; i < n; i++) {
      int r = int(random(allMoves.length));
      //int r =;
      sequence[i] = allMoves[r];
      output.print( allMoves[r]);
      if( i !=(n-1) ) output.print(" ");
      else output.print("\n");
    
    }
    
 
  for( int i=0 ; i< n  ;++i)print( sequence[i] + "\t");
  counter4++;
  if(counter4==1){
    output.flush();
    output.close();
  }
 }
  
 
 
 
  if (started) {
    if (frameCount % 20 == 0) {
        if(counter1 < n) {
          //print('\n' +sequence[counter1]);
          if(sequence[counter1].charAt(1)=='2' && counter3 < 2){
            //print("HELLO");
            applyMove(str(sequence[counter1].charAt(0)) +"1");
            counter3++;
            if( counter3 ==2 ){
              counter1++;
              counter3 =0;
            }
          }
          else {
            applyMove(sequence[counter1]);
            counter1++; 
          }          
        } 
        else closed_auto = true;
    }
  }
  
  if(got){
    if( frameCount%20 ==0){
      String[] lines = loadStrings("SolverOutput.txt");
      if( lines.length != 0){
        String[] ans = split(lines[0], ' ');
      
        if ( counter2 < ans.length-1){
          
            if(ans[counter2].charAt(1)=='2' && counter5 < 2){
              //print(ans[counter2]);
              applyMove(str(ans[counter2].charAt(0)) +"1");
              counter5++;
              if( counter5 ==2 ){
                print(ans[counter2]);
                counter2++;
                counter5 =0;
              }
            }
            else {
              applyMove(ans[counter2]);
              print(ans[counter2]);
              counter2++; 
              
            }
        }else {
          if(counter6<1){
            print("\n"+"Solved");
            counter6++;
          }
        }
      }
      
      else {
        if( counter6 <1){
          print("Solved");
          counter6++;
        }
      }
      //else{
      //  delay(3000);
      //  exit();
      //}
      
       
      
  }
  }
 
     
  scale(50);
  for (int i = 0; i < cube.length; i++) {
    cube[i].show();
  }
    
}
 
