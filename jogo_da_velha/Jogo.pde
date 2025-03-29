public class Jogo {
  String[][] gameState = new String[][] {
    {"","",""},
    {"","",""},
    {"","",""}
  };
  String turno = "X";
  
  void fazerJogada(int col, int lin){
    if (this.gameState[col][lin].isEmpty()){
      this.gameState[col][lin] = turno;
      this.turno = "X".equals(this.turno) ? "O" : "X";
    }
  }
  
  void fazerJogada(int num){
    switch(num){
      case 7:
        fazerJogada(0, 0);
        break;
      case 8:
        fazerJogada(0, 1);
        break;
      case 9:
        fazerJogada(0, 2);
        break;
      case 4:
        fazerJogada(1, 0);
        break;
      case 5:
        fazerJogada(1, 1);
        break;
      case 6:
        fazerJogada(1, 2);
        break;
      case 1:
        fazerJogada(2, 0);
        break;
      case 2:
        fazerJogada(2, 1);
        break;
      case 3:
        fazerJogada(2, 2);
        break;
    }
  }
  
  String checarVencedor(){
    // linhas
    for (int i = 0; i < 3; i++) {
      if (!this.gameState[i][0].isEmpty() && 
          this.gameState[i][0].equals(this.gameState[i][1]) && 
          this.gameState[i][0].equals(this.gameState[i][2])) {
        return this.gameState[i][0];
      }
    }
    
    // colunas
    for (int j = 0; j < 3; j++) {
      if (!this.gameState[0][j].isEmpty() && 
          this.gameState[0][j].equals(this.gameState[1][j]) && 
          this.gameState[0][j].equals(this.gameState[2][j])) {
        return this.gameState[0][j];
      }
    }
    
    // diagonais
    if (!this.gameState[0][0].isEmpty() && 
        this.gameState[0][0].equals(this.gameState[1][1]) && 
        this.gameState[0][0].equals(this.gameState[2][2])) {
        return this.gameState[0][0];
    }
    if (!this.gameState[0][2].isEmpty() && 
        this.gameState[0][2].equals(this.gameState[1][1]) && 
        this.gameState[0][2].equals(this.gameState[2][0])) {
        return this.gameState[0][2];
    }
    
    // checar empate
    for (int i = 0; i < 3; i++){
      for (int j = 0; j < 3; j++){
        if (this.gameState[i][j].isEmpty()){
          return "";
        }
      }
    }
    
    return "Empate";
  }
  
  void limpar(){
    for (int i = 0; i < 3; i++){
      for (int j = 0; j < 3; j++){
        this.gameState[i][j] = "";
      }
    }
    this.turno = "X";
  }
  
  Jogo() {
  }
}
