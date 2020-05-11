import java.util.List;
Circulo c1, c2, c3, tmp;
List <Circulo>lista; // <> Operador Diamante
String q="";
float x,y;
int n=-1; // para el id del circulo
int k = 30; // numero de circulos en la lista
int w =0;
void setup(){
    size(400,300);
    lista = new <Circulo>ArrayList();
    tmp = null;
    for(int i=0; i <k ;i++){
       x = random(width);
       y = random(height);
       tmp = new Circulo(x,y,50,w);
       w++;
       lista.add(tmp);
    }
}

void draw(){
   background(0);
   for(int i=0; i < lista.size() ;i++){
       tmp = lista.get(i);
       tmp.dibuja();
   }
   textSize(24);
   fill(#DB145D);
   text(q,40,50);
   if (n != -1)
       text(n,140,30);
   fill(255);
}

void mousePressed(){
  q="";
  int i;
   for(i=lista.size()-1; i>=0  ;i--){
          tmp = lista.get(i);
          if (tmp.isAdentro(mouseX, mouseY) ) {
             n = tmp.id;
             q += tmp.id;
             tmp.mover=true;
             break;
          }
   }
   q = String.valueOf(mouseX);
   
}

void mouseReleased(){
   q = "";
   n = -1; // no se está seleccionando nigún círculo.
   tmp.mover = false;
   tmp = null;
}

void mouseDragged(){
  if(n != -1){
    lista.get(n).x = mouseX;
    lista.get(n).y = mouseY;
  }
}

class Circulo{
  float x;
  float y;
  float diametro;
  int id;
  boolean mover;
 
  Circulo(float a, float b, float c, int d){
     x = a;
     y = b;
     diametro = c;
     id = d;
     ellipseMode(CENTER);
     mover = false;
  }

void dibuja(){
   ellipse(x,y,diametro,diametro);
}

boolean isAdentro(float a, float b){
   if( dist(a,b,x,y) < diametro/2)
         return true;
   else
         return false;
         
}




}
