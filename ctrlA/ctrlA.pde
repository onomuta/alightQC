import codeanticode.syphon.*;

OPC opc;
PImage dot;
PImage img;
SyphonClient client;

void settings() {
  size(128, 128, P3D);
  PJOGL.profile = 1;
}
void setup()
{
  client = new SyphonClient(this);
  // Connect to the local instance of fcserver. You can change this line to connect to another computer's fcserver
  opc = new OPC(this, "127.0.0.1", 7890);
  
  opc.ledStrip(0 * 64, 60, width * 1/8 - width/16, height * 3/4, height/54/2, radians(90), true);
  opc.ledStrip(1 * 64, 60, width * 2/8 - width/16, height * 3/4, height/54/2, radians(90), true);
  opc.ledStrip(2 * 64, 60, width * 3/8 - width/16, height * 3/4, height/54/2, radians(90), true);
  opc.ledStrip(3 * 64, 60, width * 4/8 - width/16, height * 3/4, height/54/2, radians(90), true);
  opc.ledStrip(4 * 64, 60, width * 5/8 - width/16, height * 3/4, height/54/2, radians(90), true);
  opc.ledStrip(5 * 64, 60, width * 6/8 - width/16, height * 3/4, height/54/2, radians(90), true);
  opc.ledStrip(6 * 64, 60, width * 7/8 - width/16, height * 3/4, height/54/2, radians(90), true);
  opc.ledStrip(7 * 64, 60, width * 8/8 - width/16, height * 3/4, height/54/2, radians(90), true);
  
  opc.ledStrip(8 * 64, 60, width * 1/4, height * 4/8 - height * 1/16, height/60/2, radians(0), false);
  opc.ledStrip(9 * 64, 60, width * 3/4, height * 4/8 - height * 1/16, height/60/2, radians(0), false);
  opc.ledStrip(10 * 64, 60, width * 1/4, height * 3/8 - height * 1/16, height/60/2, radians(0), false);
  opc.ledStrip(11 * 64, 60, width * 3/4, height * 3/8 - height * 1/16, height/60/2, radians(0), false);
  opc.ledStrip(12 * 64, 60, width * 1/4, height * 2/8 - height * 1/16, height/60/2, radians(0), false);
  opc.ledStrip(13 * 64, 60, width * 3/4, height * 2/8 - height * 1/16, height/60/2, radians(0), false);
  opc.ledStrip(14 * 64, 60, width * 1/4, height * 1/8 - height * 1/16, height/60/2, radians(0), false);
  opc.ledStrip(15 * 64, 60, width * 3/4, height * 1/8 - height * 1/16, height/60/2, radians(0), false);
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