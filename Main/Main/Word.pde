
public class Word {
  String word;
  String POS;
  int rate;
  int curTime, extraPixel;
  float percTime;
  int xdist = 200;
  
 public Word(String _w, String _pos) {
  rate = 1000;
  this.word = _w;
  this.POS = _pos;
 }

 
 public void render(int x, int y) {
   
  int curTime = millis() % rate;
  float percTime = (float) curTime / (float) rate;
  int extraPixel = (int)(percTime * xdist);
  
  //moveAll();
   
  textFont(font, 16);
  //size 48
  text(word, x + extraPixel, y);
  fill(252,0,252);
 } 
  
}
