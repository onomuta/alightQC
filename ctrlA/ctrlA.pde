import codeanticode.syphon.*;

OPC opc;
PImage dot;
PImage img;
SyphonClient client;

void settings() {
  size(480, 240, P3D);
  PJOGL.profile = 1;
}
void setup()
{
  client = new SyphonClient(this);
  // Connect to the local instance of fcserver. You can change this line to connect to another computer's fcserver
  opc = new OPC(this, "127.0.0.1", 7890);
  
  //opc.ledGridCtrlA(0, width * 1/2, height * 1/2, width * 1/9 ,height * 1/60);
  opc.ledStrip(0 * 64, 50, width * 1/9, height * 1/2, height/50, radians(90), false);
  opc.ledStrip(1 * 64, 50, width * 2/9, height * 1/2, height/50, radians(90), false);
  opc.ledStrip(2 * 64, 50, width * 3/9, height * 1/2, height/50, radians(90), false);
  opc.ledStrip(3 * 64, 50, width * 4/9, height * 1/2, height/50, radians(90), false);
  opc.ledStrip(4 * 64, 50, width * 5/9, height * 1/2, height/50, radians(90), false);
  opc.ledStrip(5 * 64, 50, width * 6/9, height * 1/2, height/50, radians(90), false);
  opc.ledStrip(6 * 64, 50, width * 7/9, height * 1/2, height/50, radians(90), false);
  opc.ledStrip(7 * 64, 50, width * 8/9, height * 1/2, height/50, radians(90), false);
}

void draw()
{
  background(0);
  if (client.newFrame()) {
    // The first time getImage() is called with 
    // a null argument, it will initialize the PImage
    // object with the correct size.
    img = client.getImage(img); // load the pixels array with the updated image info (slow)
    //img = client.getImage(img, false); // does not load the pixels array (faster)    
  }
  if (img != null) {
    image(img, 0, 0, width, height); 
  }
}