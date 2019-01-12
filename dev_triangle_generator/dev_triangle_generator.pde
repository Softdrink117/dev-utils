// This is a super simple tool to generate 'Dev Triangle Diagrams' for project planning.
// The basic idea is that for a given game project, there are different 'categories' of work that need to be done

// At the very high level, I like to think of these as three groups:
// - Engine
//     This is the programming, workflow, pipeline, debugging, etc.
// - Content
//     This is assets - models, text, voice, sounds, music, script, animations, cutscenes
// - Balance
//     This is the 'game design' considerations. Strategic balance, level design, testing, etc.


// This program was created by Tobias Heinemann c. January 2019

void setup(){
  size(1000,1000);
  background(255);
}

// This is kinda gross but whatever, it works well enough for now
void draw(){
  background(255);
  
  PVector posA = new PVector(0,0);
  PVector posB = new PVector(0,0);
  PVector posC = new PVector(0,0);
  PVector center = new PVector(width/2.0, height*0.6);
  float rad = (float)width*0.4;
  
  // Calculate vertices
  pushMatrix();
  translate(center.x, center.y);
  pushMatrix();
  translate(0,-rad);
  posA = new PVector(screenX(0,0), screenY(0,0));
  popMatrix();
  pushMatrix();
  rotate(TWO_PI/3.0);
  translate(0,-rad);
  posB = new PVector(screenX(0,0), screenY(0,0));
  popMatrix();
  pushMatrix();
  rotate(2.0*TWO_PI/3.0);
  translate(0,-rad);
  posC = new PVector(screenX(0,0), screenY(0,0));
  popMatrix();
  popMatrix();
  
  // Draw triangle from verts
  stroke(0);
  line(posA.x, posA.y, posB.x, posB.y);
  line(posB.x, posB.y, posC.x, posC.y);
  line(posC.x, posC.y, posA.x, posA.y);
  noStroke();
  fill(0);
  
  // Draw mouse position
  noFill();
  stroke(255,100,100);
  line(posA.x, posA.y, mouseX, mouseY);
  line(posB.x, posB.y, mouseX, mouseY);
  line(posC.x, posC.y, mouseX, mouseY);
  
  // Expand vertices
  posA.add(PVector.sub(posA, center).mult(0.1));
  posB.add(PVector.sub(posB, center).mult(0.1));
  posC.add(PVector.sub(posC, center).mult(0.1));
  // Draw labels
  textAlign(CENTER, CENTER);
  textSize(24);
  text("Engine", posA.x, posA.y);
  text("Content", posB.x, posB.y);
  text("Balance", posC.x, posC.y);
  
  fill(255,100,100);
  ellipse(mouseX, mouseY, 50,50);
  
  //// Calculate relative size compared to each other
  //float engine = dist(posA.x, posA.y, mouseX, mouseY);
  //float content = dist(posB.x, posB.y, mouseX, mouseY);
  //float balance = dist(posC.x, posC.y, mouseX, mouseY);
  //engine = map(engine, 0, rad, 1, 0);
  //content = map(content, 0, rad, 1, 0);
  //balance = map(balance, 0, rad, 1, 0);
  //engine = constrain(engine, 0, 1);
  //content = constrain(content, 0, 1);
  //balance = constrain(balance, 0, 1);
  ////float total = engine + content + balance;
  
  ////engine = engine/total;
  ////content = content/total;
  ////balance = balance/total;
  
  //fill(0);
  //noStroke();
  //textAlign(LEFT, TOP);
  //text("Engine: " + nf(engine*100.0, 2,1) + 
  //      "% \nContent: " + nf(content*100.0, 2,1) +
  //      "% \nBalance: " + nf(balance*100.0, 2,1) + "%", 100, height*0.8);
        
  //fill(255,100,100);
  //rect(300, height*0.8, 400*engine, 24);
  
}

void mouseClicked(){
  selectOutput("Save file as: ", "SaveFile");
}

void SaveFile(File output){
  if(output != null){
    print("Now saving output to " + output.getAbsolutePath());
    saveFrame(output.getAbsolutePath());
    println(" Done.");
  }else return;
}
