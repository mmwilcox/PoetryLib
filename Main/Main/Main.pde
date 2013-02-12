
import java.util.*;

PImage img;

List<Word> words;

PFont font = createFont("Arial", 25, true);
float x; // Horizontal location
int index = 0;
int moveY;
int moveX;


void setup() {
  size(600,567);
  frameRate(50);
  x = width;
  textAlign (RIGHT);
  moveY = 0;
  moveX = 0;
  img = loadImage("wave.jpg");

  
  Map<String, List<String>> wordMap = loadInWords("words.txt"); 
  
  for (String k : wordMap.keySet()) {
   //println("key = " + k); 
  
    List<String> values = wordMap.get(k);
  
    for (String v : values) {
     // println("\tvalue = " + v);
    }   
  }
  
  
  words = parseGrammar(wordMap, "grammar.txt");
}



/*** 
  Loads in a text file indicating words assoicated with parts of speech, parses it, 
  and returns a Map of each part of speech and its assoicated List of words.
  Assumes each line looks like:

    POS:word1,word2,...,wordN
***/  
Map<String, List<String>> loadInWords(String filename) {
  
  Map<String, List<String>> m = new HashMap<String, List<String>>();
  
  String[] lines = loadStrings(filename);
  
  for (int i = 0 ; i < lines.length; i++) {
    //println("LINE = " + lines[i]);
    String[] chop = split(lines[i], ':');
    
    String POS = chop[0];
    //println("POS =" + POS);
    String wordsStr = chop[1];
    //println("\tLEFT SIDE = " + POS);
    //println("\tRIGHT SIDE = " + wordsStr + "\n");
    
    String[] wordsArr = split(wordsStr, ','); //split right side into an array of Strings
    List<String> wordsList = Arrays.asList(wordsArr); //turns array into a List
    
    
   
    for (String tmpStr : wordsList) {
      //println("\t\tword="+tmpStr);
    }
    
    
    m.put(POS, wordsList);
  }
  
  return m;
}



/***
  Reads through a text file of parts of speech and looks through a Map m for a random word 
  that corresponds to each part of speech. Returns a populated List of Word objects, where
  each type of Word has its own render() method.
***/

List<Word> parseGrammar( Map<String, List<String>> m, String filename) {
  
  List<Word> ws = new ArrayList<Word>();
  // TO DO - 
  // 1. Load in Strings from "grammar.txt" and loop through each line.
  String[] lines = loadStrings(filename);
  
  
  for(String line : lines) {
    //println(line); 
    
    String[] posArr = line.split(" ");
    List<String> posList = Arrays.asList(posArr); //turns array into a List
    
    for (String p : posList) {
      //println("\t" + p);
      
      List<String> listOfWords = m.get(p);
      
      int randNum = (int) random(0,listOfWords.size());
       
      String randomWord = listOfWords.get( randNum );
      println("\t\t" + randomWord);
      
      Word w;
      if (p.equals("NOUN")) {
        w = new WordNoun(randomWord, p);
      } else {
        w = new Word(randomWord,p);
      }

      ws.add(w);
      
      if (p.equals("VERB")) {
        w = new WordVerb(randomWord, p);
      } else {
        w = new Word(randomWord,p);
      }

      ws.add(w);
      
    }
  }


  // 2. For each POS in the line, get the associated List of words from Map m.
  // 3. Choose a random word from the list.
  // 4. Place this word in a List that we will read from in the draw() loop. 
  
  return ws;

 }

void moveAll(){
 
  moveY++; // moveY = moveY+1;
  moveX++; // moveX = moveX+1;
  if(moveY+40 >= height){
    moveY=0;
  }
  if(moveX+40 >= width){
      moveX=0;
  } 

}

void draw(){
   background(380,50); 
   image (img, 0,0);
   fill(0);
   
   int pX = 10;
   int pY = 50;
   int curX = 05;
   int curY = 40;
   
   
for (Word w : words) {
     w.render(pX, pY);
     
     int sw = (int)textWidth(w.word);
     pX += sw + 10;
     
     if (pX > width) {
       pX = 10;
       pY += 30;
   }

}


}

  
