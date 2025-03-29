boolean letra = false;
Jogo jogo = new Jogo();
boolean acertou;
int erros = 0;
int cenaAtual = 3;
int tema = 1;

void setup(){
  size(800, 600);
  textSize(64);
  strokeWeight(4);
  fill(0);
  jogo.iniciar(tema);
  //println(jogo.palavra);
}

void draw(){
  println(mouseX);
  println(mouseY);
  background(220);
  if (cenaAtual == 0){
    novaPartida();
  } else if (cenaAtual == 1){
    delay(500);
    derrota();
  } else if (cenaAtual == 2){
    delay(500);
    vitoria();
  } else if (cenaAtual == 3){
    menu();
  }
  if (jogo.vitoria()){
    cenaAtual = 2;
  }
  if (erros > 7){
    cenaAtual = 1;
  }
}

void keyPressed(){
  if (cenaAtual == 0){
    if (!acertouLetra()){
      erros++;
    }
  } else if (cenaAtual == 1 || cenaAtual == 2){
    if (key == '1') {
      jogo.iniciar(tema);
      erros = 0;
      cenaAtual = 0;
    } else if (key == '2') {
      jogo.iniciar(tema);
      erros = 0;
      cenaAtual = 3;
    }
  } else if (cenaAtual == 3){
    if (key == '1'){
      tema = 1;
    } else if (key == '2'){
      tema = 2;
    } else if (key == '3'){
      tema = 3;
    } else if (key == '4'){
      tema = 4;
    } else {
      text("Escolha invalida", 150, 550);
      return;
    }
    jogo.iniciar(tema);
    cenaAtual = 0;
  }
}

void menu(){
  text("Escolha o tema!", 150, 100);
  text("1. Frutas", 150, 200);
  text("2. Animais", 150, 300);
  text("3. Paises", 150, 400);
  text("4. Objetos", 150, 500);
}

void novaPartida(){
  text("Digite uma Letra", 150, 100);
  apresentarLinhas(jogo.palavra);
  apresentarLetras();
  desenharForca(erros);
}

void derrota(){
  background(220);
  text("Voce Perdeu!", 200, 100);
  text("A palavra era: " + jogo.palavra, 100, 200);
  text("Jogar novamente?", 150, 350);
  text("1. Sim", 200, 450);
  text("2. Nao", 400, 450);
}

void vitoria(){
  background(220);
  text("Parabens!", 200, 100);
  text("A palavra era: " + jogo.palavra, 100, 200);
  text("Jogar novamente?", 150, 350);
  text("1. Sim", 200, 450);
  text("2. Nao", 400, 450);
}

void apresentarLinhas(String palavra) {
  for (int i = 0; i < palavra.length(); i++) {
    int X = 75 * i;
    int Y = 450;
    line(X, Y, X + 50, Y);
  }
}

void apresentarLetras(){
  for (int i = 0; i < jogo.letras.length; i++){
    text(jogo.letrasMostradas[i], (75 * i)+10, 440);
  }
}

void desenharForca(int numErros){
  switch (numErros){
    case 1:
      forca();
      break;
    case 2:
      forca();
      corda();
      break;
    case 3:
      forca();
      corda();
      cabeca();
      break;
    case 4:
      forca();
      corda();
      cabeca();
      torso();
      break;
    case 5:
      forca();
      corda();
      cabeca();
      torso();
      bracoD();
      break;
    case 6:
      forca();
      corda();
      cabeca();
      torso();
      bracoD();
      bracoE();
      break;
    case 7:
      forca();
      corda();
      cabeca();
      torso();
      bracoD();
      bracoE();
      pernaD();
      break;
    case 8:
      forca();
      corda();
      cabeca();
      torso();
      bracoD();
      bracoE();
      pernaD();
      pernaE();
      break;
  }
}

void forca(){
  line(50, 150, 50, 360);
  line(50, 150, 150, 150);
}

void corda(){
  line(150, 150, 150, 175);
}

void cabeca(){
  circle(150, 190, 40);
}

void torso(){
  line(150, 210, 150, 280);
}

void bracoD(){
  line(150, 210, 120, 240);
}

void bracoE(){
  line(150, 210, 180, 240);
}

void pernaD(){
  line(150, 280, 120, 320);
}

void pernaE(){
  line(150, 280, 180, 320);
}

boolean acertouLetra(){
  acertou = false;
  for (int i = 0; i < jogo.letras.length; i++){
    if (key == jogo.letras[i]){
      jogo.letrasMostradas[i] = key;
      acertou = true;
    }
  }
  return acertou;
}
