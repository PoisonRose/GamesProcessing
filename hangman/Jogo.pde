public class Jogo{
  String palavra;
  char[] letras;
  char[] letrasMostradas;
  
  void escolher(String[] arr){
    palavra = arr[int(random(arr.length))];
    letras = palavra.toCharArray();
    letrasMostradas = new char[letras.length];
    for (int i = 0; i < letras.length; i++) {
      letrasMostradas[i] = ' ';
    }
  }
  
  void iniciar(int tema){
    switch (tema){
      case 1:
        escolher(Wordbank.bancoFrutas);
        break;
      case 2:
        escolher(Wordbank.bancoAnimais);
        break;
      case 3:
        escolher(Wordbank.bancoPaises);
        break;
      case 4:
        escolher(Wordbank.bancoObjetos);
        break;
    }
  }
  
  boolean vitoria(){
    for (int i = 0; i < letras.length; i++){
      if (!(letras[i] == letrasMostradas[i])){
        return false;
      }
    }
    return true;
  }
}
