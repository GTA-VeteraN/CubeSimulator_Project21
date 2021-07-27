import peasy.*;

PeasyCam cam;
PrintWriter output;

int dim = 8; ///Place to manually change the dimension of the cube.
int k = dim/2;
int mid = dim/2;
int increment =0;
int pro=0;
int frame = 100/dim;
Cubie[] cube = new Cubie[dim*dim*dim];
ArrayList<String> allMoves = new ArrayList<String>();
           
int n = int( random(10 ,20 ))*dim/3; // range of size of scramble set 
String[] sequence = new String[n];
int counter1 = 0;
int counter2 =0;
int counter3=0;
int counter4=0;
int counter5=0;
boolean manual = false;
boolean started = false;
boolean got = false;
boolean closed_man= false;
boolean closed_auto = false;

void setup() {
  
  if( dim%2 ==0){
    k = dim-1;
    increment =2;
    pro=5;
  }
  else{
    k = dim/2;
    increment=1;
    pro=3;
  }
  size(800, 800, P3D);
  cam = new PeasyCam(this,100*dim*increment);
  
  
  int index = 0;
  for (int x = -k; x <= k; x+=increment) {
    for (int y = -k; y <= k; y+=increment) {
      for (int z = -k; z <= k; z+=increment) {
        PMatrix3D matrix = new PMatrix3D();
        matrix.translate(x, y, z);
        cube[index] = new Cubie(matrix, x, y, z);
        index++;
      }
    }
  }
  
  output = createWriter("RandomScramble.txt");
  String[] Moves = {"F","B","U","D","R","L"};
  for( int i=0 ; i<Moves.length ; ++i){
    String c = Moves[i];
    allMoves.add(c);
  }
  if( dim > 3 ){
    String[] moves = {"f","b","u","d","r","l","x","X","y","Y","z","Z"};
    for( int i=0 ; i< moves.length ; ++i){
      String c = moves[i];
      allMoves.add(c);
    }
  }
  if( dim >5){
    String[] moves = {"g","G","h","H","i","I"};
    for( int i=0 ; i< moves.length ; ++i){
      String c = moves[i];
      allMoves.add(c);
    }
  }
  if( dim >11){
    String[] moves = {"n","N","o","O","p","P","c","C","j","J","k","K"};
    for( int i=0 ; i< moves.length ; ++i){
      String c = moves[i];
      allMoves.add(c);
    }
  }
  if( dim <=8) frame = 25;
  else frame = 100/dim;
   
  
 
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
void turnZmid(int start,int last,int incre){
  for( int j=start ; j<=last ; j+=incre){
    for (int i = 0; i < cube.length; i++) {
      Cubie qb = cube[i];
      if (qb.z == j) {
        PMatrix2D matrix = new PMatrix2D();
        matrix.rotate(HALF_PI);
        matrix.translate(qb.x,qb.y);
        qb.update(round(matrix.m02) , round(matrix.m12) , round(qb.z));
        qb.turnFacesZ(1);
      }
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

void turnYmid(int start,int last,int incre){
  for( int j=start ; j<=last ; j+=incre){
    for (int i = 0; i < cube.length; i++) {
      Cubie qb = cube[i];
      if (qb.y == j) {
        PMatrix2D matrix = new PMatrix2D();
        matrix.rotate(HALF_PI);
        matrix.translate(qb.x,qb.z);
        qb.update(round(matrix.m02) , round(qb.y) , round(matrix.m12));
        qb.turnFacesY(1);
      }
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
void turnXmid(int start,int last,int incre){
  for( int j=start ; j<=last ; j+=incre){
    for (int i = 0; i < cube.length; i++) {
      Cubie qb = cube[i];
      if (qb.x == j) {
        PMatrix2D matrix = new PMatrix2D();
        matrix.rotate(HALF_PI);
        matrix.translate(qb.y,qb.z);
        qb.update(round(qb.x) , round(matrix.m02) , round(matrix.m12));
        qb.turnFacesX(1);
      }
    }
  }
}
void draw() {
  background(51); 
 if( started && counter4<1 ){
    for (int i = 0; i < n; i++) {
      int r = int(random(allMoves.size()));
      //int r =;
      sequence[i] = allMoves.get(r);
      output.print( allMoves.get(r));
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
    if (frameCount % frame == 0) {
        if(counter1 < n) {
          applyMove(sequence[counter1]); 
          counter1++;
        } 
        else closed_auto = true;
    }
  }

  
 
     
  scale(50);
  for (int i = 0; i < cube.length; i++) {
    cube[i].show();
  }
    
}
 
