int cenaAtual = 0;
Jogo jogo = new Jogo();
Cpu cpu = new Cpu(jogo);
int dificuldade;

void setup() {
  size(800, 600);
  PImage fundo;
  fundo = loadImage("fundo.png");
  background(fundo);
  textSize(64);
  PFont font;
  font = createFont("LEOHatesSchoolMC.ttf", 64);
  textFont(font, 64);
  strokeWeight(3);
}

void draw() {
  println(mouseX);
  println(mouseY);
  if (cenaAtual == 0) {
    setup();
    menuPrincipal();
  } else if (cenaAtual == 1) {
    setup();
    dificuldade();
  } else if (cenaAtual == 2) {
    setup();
    doisJogadores();
  } else if (cenaAtual == 3) {
    setup();
    umJogador();
  } else if (cenaAtual == 94) {
    setup();
    empate();
  } else if (cenaAtual == 95) {
    setup();
    vitoriaJ1();
  } else if (cenaAtual == 96) {
    setup();
    vitoriaCPU();
  } else if (cenaAtual == 97) {
    setup();
    vitoriaJ1();
  } else if (cenaAtual == 98) {
    setup();
    vitoriaJ2();
  } else if (cenaAtual == 99) {
    setup();
    empate();
  }
}

void menuPrincipal() {
  fill(65, 105, 255);
  text("Jogo da Velha", 250, height / 6);
  text("Escolha o modo de jogo:", 150, height / 3);
  if (mouseX > 240 && mouseX < 520 && mouseY > 249 && mouseY < 320) {
      noFill();
      rect(240, 245, 275, 75);
  }
  text("1 jogador", 270, height / 2);
  if (mouseX > 220 && mouseX < 540 && mouseY > 350 && mouseY < 420) {
    noFill();
    rect(220, 345, 320, 75);
  }
  fill(65, 105, 255);
  text("2 jogadores", 250, 400);
}

void dificuldade() {
  fill(65, 105, 255);
  text("Escolha a dificuldade:", 150, 100);
  text("1. Fácil", 250, 200);
  text("2. Médio", 250, 300);
  text("3. Difícil", 250, 400);
  text("4. voltar", 250, 500);
}

void umJogador() {
  doisJogadores();
}

void doisJogadores() {
  // grid
  noFill();
  stroke(0);
  strokeWeight(6);
  
  // verticais
  line(300, 50, 300, 550);
  line(500, 50, 500, 550);
  
  // horizontais
  line(150, 200, 650, 200);
  line(150, 400, 650, 400);
  
  // display do estado de Jogo
  textSize(256);
  text(jogo.gameState[0][0], 150, 180);
  text(jogo.gameState[0][1], 350, 180);
  text(jogo.gameState[0][2], 525, 180);
  text(jogo.gameState[1][0], 150, 350);
  text(jogo.gameState[1][1], 350, 350);
  text(jogo.gameState[1][2], 525, 350);
  text(jogo.gameState[2][0], 150, 545);
  text(jogo.gameState[2][1], 350, 545);
  text(jogo.gameState[2][2], 525, 545);
}

void vitoriaJ1() {
  textSize(128);
  text("Jogador 1 Venceu!", 50, 300);
  textSize(64);
  text("1. Jogar Novamente", 200, 400);
  text("2. Menu principal", 200, 500);
}

void vitoriaJ2() {
  textSize(128);
  text("Jogador 2 Venceu!", 50, 300);
  textSize(64);
  text("1. Jogar Novamente", 200, 400);
  text("2. Menu principal", 200, 500);
}

void vitoriaCPU() {
  textSize(128);
  text("Computador Venceu!", 50, 300);
  textSize(64);
  text("1. Jogar Novamente", 200, 400);
  text("2. Menu principal", 200, 500);
}

void empate() {
  textSize(128);
  text("Empate!", 250, 300);
  textSize(64);
  text("1. Jogar Novamente", 200, 400);
  text("2. Menu principal", 200, 500);
}

void mouseClicked() {
  if (cenaAtual == 0){
    if (mouseX > 240 && mouseX < 520 && mouseY > 249 && mouseY < 320) {
      cenaAtual = 1;
    } else if (mouseX > 220 && mouseX < 540 && mouseY > 350 && mouseY < 420) {
      cenaAtual = 2;
    }
  }
  
  // marcar jogada de cada jogador.
  if (cenaAtual == 2){
    if (mouseX > 310 && mouseX < 490 && mouseY > 210 && mouseY <  385) {
      jogo.fazerJogada(1, 1);
    } else if (mouseX > 150 && mouseX < 290 && mouseY > 50 && mouseY <  190) {
      jogo.fazerJogada(0, 0);
    } else if (mouseX > 310 && mouseX < 490 && mouseY > 50 && mouseY <  190) {
      jogo.fazerJogada(0, 1);
    } else if (mouseX > 510 && mouseX < 650 && mouseY > 50 && mouseY <  190) {
      jogo.fazerJogada(0, 2);
    } else if (mouseX > 150 && mouseX < 290 && mouseY > 210 && mouseY <  385) {
      jogo.fazerJogada(1, 0);
    } else if (mouseX > 510 && mouseX < 650 && mouseY > 210 && mouseY <  385) {
      jogo.fazerJogada(1, 2);
    } else if (mouseX > 150 && mouseX < 290 && mouseY > 410 && mouseY <  550) {
      jogo.fazerJogada(2, 0);
    } else if (mouseX > 310 && mouseX < 490 && mouseY > 410 && mouseY <  550) {
      jogo.fazerJogada(2, 1);
    } else if (mouseX > 510 && mouseX < 650 && mouseY > 410 && mouseY <  550) {
      jogo.fazerJogada(2, 2);
    }
    if (jogo.checarVencedor().equals("X")) {
      jogo.limpar();
      cenaAtual = 97;  
    } else if (jogo.checarVencedor().equals("O")) {
      jogo.limpar();
      cenaAtual = 98;
    } else if (jogo.checarVencedor().equals("Empate")) {
      jogo.limpar();
      cenaAtual = 99;
    }
  } else if (cenaAtual == 3){
    if (mouseX > 310 && mouseX < 490 && mouseY > 210 && mouseY <  385) {
      jogo.fazerJogada(1, 1);
      cpu.jogar(dificuldade);
    } else if (mouseX > 150 && mouseX < 290 && mouseY > 50 && mouseY <  190) {
      jogo.fazerJogada(0, 0);
      cpu.jogar(dificuldade);
    } else if (mouseX > 310 && mouseX < 490 && mouseY > 50 && mouseY <  190) {
      jogo.fazerJogada(0, 1);
      cpu.jogar(dificuldade);
    } else if (mouseX > 510 && mouseX < 650 && mouseY > 50 && mouseY <  190) {
      jogo.fazerJogada(0, 2);
      cpu.jogar(dificuldade);
    } else if (mouseX > 150 && mouseX < 290 && mouseY > 210 && mouseY <  385) {
      jogo.fazerJogada(1, 0);
      cpu.jogar(dificuldade);
    } else if (mouseX > 510 && mouseX < 650 && mouseY > 210 && mouseY <  385) {
      jogo.fazerJogada(1, 2);
      cpu.jogar(dificuldade);
    } else if (mouseX > 150 && mouseX < 290 && mouseY > 410 && mouseY <  550) {
      jogo.fazerJogada(2, 0);
      cpu.jogar(dificuldade);
    } else if (mouseX > 310 && mouseX < 490 && mouseY > 410 && mouseY <  550) {
      jogo.fazerJogada(2, 1);
      cpu.jogar(dificuldade);
    } else if (mouseX > 510 && mouseX < 650 && mouseY > 410 && mouseY <  550) {
      jogo.fazerJogada(2, 2);
      cpu.jogar(dificuldade);
    }
    if (jogo.checarVencedor().equals("X")) {
      jogo.limpar();
      cpu.jogou = false;
      cenaAtual = 95;  
    } else if (jogo.checarVencedor().equals("O")) {
      jogo.limpar();
      cpu.jogou = false;
      cenaAtual = 96;
    } else if (jogo.checarVencedor().equals("Empate")) {
      jogo.limpar();
      cpu.jogou = false;
      cenaAtual = 94;
    }
  }
}

void keyPressed(){
  if (cenaAtual == 1){
    if (key == '4') {
      cenaAtual = 0;
    } else if (key == '1'){
      dificuldade = 1;
      cenaAtual = 3;
    } else if (key == '2'){
      dificuldade = 2;
      cenaAtual = 3;
    } else if (key == '3'){
      dificuldade = 3;
      cenaAtual = 3;
    }
  } else if (cenaAtual == 0){
    if (key == '1') {
      cenaAtual = 1;
    } else if (key == '2') {
      cenaAtual = 2;
    }
  } else if (cenaAtual == 97 || cenaAtual == 98 || cenaAtual == 99) {
    if (key == '1') {
      cenaAtual = 2;
    } else if (key == '2') {
      cenaAtual = 0;
    }
  } else if (cenaAtual == 94 || cenaAtual == 95 || cenaAtual == 96){
    if (key == '1') {
      cenaAtual = 3;
    } else if (key == '2') {
      cenaAtual = 0;
    }
  }
}
