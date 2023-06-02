/*
 * Omni Wheel Hub.scad
 *
 * These hubs work with the Nexus 58mm Plastic Omni Wheel:
 * https://www.robotshop.com/products/58mm-plastic-omni-wheel-compatible-servos-lego-mindstorms-nxt
 * 
 * Brown Dog Gadgets
 *
 * Pete Prodoehl <pete@browndoggadgets.com>
 *
 */


$fn=50;

Radius1     = 5.0/2;
Plus_Height = 50;
Plus_Width  = 2.0*1.0;
Overhang    = 0.05*1.0;

hubDiameter = 12.2; // adjust if fit is too tight or too loose
hubHeight   = 26.6;



difference() {

    union() {
            
        translate([0,0,hubHeight/2-1.55])
                cylinder(d1=hubDiameter, d2=hubDiameter-0.5, h=3, $fn=12, center=true);
            
        translate([0,0,0])
                cylinder(d=hubDiameter, h=hubHeight-6, $fn=12, center=true);
    
        translate([0,0,-hubHeight/2+1.55])
                cylinder(d1=hubDiameter+0.1, d2=hubDiameter, h=3, $fn=12, center=true);
            
    }
    
    translate([0,0,-hubHeight])
        plus();

}



module plus() {

    union() {
        translate([-Plus_Width/2, -Radius1, -Overhang]) 
            cube([Plus_Width, Radius1*2, Plus_Height+Overhang*2]);
        translate([-Radius1, -Plus_Width/2, -Overhang]) 
            cube([Radius1*2, Plus_Width, Plus_Height+Overhang*2]);
    }
    
}
