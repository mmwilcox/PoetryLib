

public class WordVerb extends Word{
  
 public WordVerb( String _w, String _pos ) {
    super(_w, _pos);
 }



 public void render(int x, int y) {
  textFont(font, 12);
  //size 32
  text(word, x, y);
  fill(41,121,255);
 } 
}

