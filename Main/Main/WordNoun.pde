
public class WordNoun extends Word{
  
 public WordNoun( String _w, String _pos ) {
    super(_w, _pos);
 }

 public void render(int x, int y) {
  textFont(font, 40);
  //size 32
  text(word, x, y);
  fill(0);
 } 
  
}
