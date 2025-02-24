#version 410

uniform vec3 u_colour;			// colour as a 3D vector (r,g,b)
uniform vec2 u_screenSize;  	// screen dimensions in pixels

layout(location = 0) out vec4 o_colour;	// output to colour buffer

void main() {
   vec2 p = gl_FragCoord.xy / u_screenSize;   // scale p into range (0,0) to (1,1), p is a point in the centre of the screen
      
   float d = distance(p, vec2(0.75, 0.75));     // calculate distance to midpoint
   
   vec2 v2 = abs(p - vec2(0.25, 0.75)); //Square
   float d2 = max(v2.x, v2.y);
   
   vec2 v3 = abs(p - vec2(0.35, 0.25)); //Diamond (WIP)
   float d3 = (v3.x + v3.y);
   
   
  
   if (d < 0.15) {
      o_colour = vec4(u_colour, 0.25);
   }
   else if (d2 < 0.15) {
      o_colour = vec4(0.0, 1.0, 0.55, 0.75);
   }
   else if (d3 < 0.15) {
      o_colour = vec4(0.0, 0.75, 0.95, 0.75);
   }
   else {
      o_colour = vec4(0.15,0.15,0.2,1); // NOT QUITE BLACK
   }
}