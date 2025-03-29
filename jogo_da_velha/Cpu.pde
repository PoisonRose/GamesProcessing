public class Cpu{
  Jogo jogo;
  boolean jogou = false;
  
  void jogadaAleatoria() {
    ArrayList<int[]> jogadasDisponiveis = new ArrayList<int[]>();
    for (int i = 0; i < 3; i++) {
        for (int j = 0; j < 3; j++) {
            if (this.jogo.gameState[i][j].isEmpty()) {
                jogadasDisponiveis.add(new int[]{i, j});
            }
        }
    }
    if (!jogadasDisponiveis.isEmpty()) {
        int[] celula = jogadasDisponiveis.get((int)random(jogadasDisponiveis.size()));
        this.jogo.fazerJogada(celula[0], celula[1]);
    }
  }
  
  void bloquear() {
    // bloquear ou completar linhas
    for (int i = 0; i < 3; i++) {
      if ((this.jogo.gameState[i][0].equals(this.jogo.gameState[i][1]) && !this.jogo.gameState[i][0].isEmpty()) || 
          (this.jogo.gameState[i][0].equals(this.jogo.gameState[i][2]) && !this.jogo.gameState[i][0].isEmpty()) ||
          (this.jogo.gameState[i][1].equals(this.jogo.gameState[i][2]) && !this.jogo.gameState[i][1].isEmpty())) {
            for (int j = 0; j < 3; j++) {
              if (this.jogo.gameState[i][j].isEmpty()){
                this.jogo.fazerJogada(i, j);
                return;
              }
            }
          }
    }
    
    // bloquear ou completar colunas
    for (int i = 0; i < 3; i++) {
      if ((this.jogo.gameState[0][i].equals(this.jogo.gameState[1][i]) && !this.jogo.gameState[0][i].isEmpty()) || 
          (this.jogo.gameState[0][i].equals(this.jogo.gameState[2][i]) && !this.jogo.gameState[0][i].isEmpty()) ||
          (this.jogo.gameState[1][i].equals(this.jogo.gameState[2][i]) && !this.jogo.gameState[1][i].isEmpty())) {
            for (int j = 0; j < 3; j++) {
              if (this.jogo.gameState[j][i].isEmpty()){
                this.jogo.fazerJogada(j, i);
                return;
              }
            }
          }
    }
    
    // bloquear ou completar diagonais
    if (((this.jogo.gameState[0][0].equals(this.jogo.gameState[1][1])) && !this.jogo.gameState[0][0].isEmpty()) ||
       ((this.jogo.gameState[0][0].equals(this.jogo.gameState[2][2])) && !this.jogo.gameState[0][0].isEmpty()) ||
       ((this.jogo.gameState[1][1].equals(this.jogo.gameState[2][2])) && !this.jogo.gameState[1][1].isEmpty())){
         for (int i = 0; i < 3; i++){
           if (this.jogo.gameState[i][i].isEmpty()){
             this.jogo.fazerJogada(i, i);
             return;
           }
         }
    }
    
    if (((this.jogo.gameState[0][2].equals(this.jogo.gameState[1][1])) && !this.jogo.gameState[0][2].isEmpty()) ||
       ((this.jogo.gameState[0][2].equals(this.jogo.gameState[2][0])) && !this.jogo.gameState[0][2].isEmpty()) ||
       ((this.jogo.gameState[1][1].equals(this.jogo.gameState[2][0])) && !this.jogo.gameState[1][1].isEmpty())){
         for (int i = 0; i < 3; i++){
           for (int j = 2; j >= 0; j--){
             if (this.jogo.gameState[i][j].isEmpty()){
               this.jogo.fazerJogada(i, j);
               return;
             } else {
               i++;
             }
           }
         }
    }
    
    jogadaAleatoria();
  }
  
  void centro(){
    if (this.jogo.gameState[1][1].isEmpty()) {
      this.jogo.fazerJogada(1, 1);
      this.jogou = true;
    } else if (this.jogou == false) {
      this.jogo.fazerJogada(0, 0);
      this.jogou = true;
    } else {
      bloquear();
    }
  }
  
  void jogar(int dificuldade){
    if (dificuldade == 1){
      jogadaAleatoria();
    } else if (dificuldade == 2){
      bloquear();
    } else {
      centro();
    }
  }
  
  Cpu(Jogo jogo) {
    this.jogo = jogo;
  }
}
