import javax.swing.JOptionPane;


void setup(){
  size(500,500);
}

void draw(){

  if(mousePressed)
    line(pmouseX,pmouseY,mouseX,mouseY);
    
}

void keyPressed() {
    String reply = JOptionPane.showInputDialog("What colour do you want?\n(red, green, blue):");
    if(reply.equalsIgnoreCase("red"))
      stroke(255,0,0); //change to red
    else if(reply.equalsIgnoreCase("blue"))
      stroke(0,0,255); //change to blue
    else if(reply.equalsIgnoreCase("green"))
      stroke(0,255,0); //change to green
}
