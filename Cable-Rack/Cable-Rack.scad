/*
 * Cable Rack.scad
 *
 * Brown Dog Gadgets <https://www.browndoggadgets.com/>
 *
 * Pete Prodoehl <pete@browndoggadgets.com>
 *
 */



// ----------------------------------------------------------------------------- //
// USER SETTINGS


width           = 120;
depth           = 40;
height          = 20;
wallThickness   = 3;

slotWidth       = 2.75;
slotInterval    = 10;

holeDiameter    = 3;
holeInterval    = 20;



// ----------------------------------------------------------------------------- //
// Create object(s)

cableRack();



// ----------------------------------------------------------------------------- //
// Modules

module cableRack() {

    difference() {
        
        // create object
        translate([0,0,0])
            cube([width, depth, height], center=true);
            
        // remove section to create the walls
        translate([0,wallThickness,wallThickness])
            cube([width+1, depth, height], center=true);

        // add the slots
        for (i = [-width/2+slotInterval : slotInterval : width/2-slotInterval]) {
            translate([i, 10+wallThickness, -1])
                cube([slotWidth, depth, height], center=true);
        }
        
        // add the holes
        for (i = [-width/2+holeInterval : holeInterval : width/2-holeInterval]) {
            translate([i, -depth/2, 0+wallThickness])
                rotate([90,0,0])
                    cylinder(d=holeDiameter, h=depth, center=true, $fn=100);
        }
        
        
        
    }

}