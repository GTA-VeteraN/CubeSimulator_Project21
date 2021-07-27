void applyMove(String move) {
  switch (move) {
  case "F1": 
    turnZ(1, 1);
    break;
  case "F3": 
    turnZ(1, -1);
    break; 
  case "F2":
    turnZ(1, 1);
    turnZ(1, 1);
    break;
  case "B1": 
    turnZ(-1, -1);
    break;
  case "B3": 
    turnZ(-1, 1);
    break;
  case "B2": 
    turnZ(-1, 1);
    turnZ(-1, 1);
    break;
  case "U1": 
    turnY(-1, 1);
    break;
  case "U3": 
    turnY(-1, -1);
    break;
  case "U2": 
    turnY(-1, 1);
    turnY(-1, 1);
    break;
  case "D1": 
    turnY(1, -1);
    break;
  case "D3": 
    turnY(1, 1);
    break;
  case "D2": 
    turnY(1, 1);
    turnY(1, 1);
    break;
  case "L1": 
    turnX(-1, -1);
    break;
  case "L3": 
    turnX(-1, 1);
    break;
  case "L2": 
    turnX(-1, -1);
    turnX(-1, -1);
    break;
  case "R1": 
    turnX(1, 1);
    break;
  case "R3": 
    turnX(1, -1);
    break;
  case "R2": 
    turnX(1, 1);
    turnX(1, 1);
    break;
  }
}
