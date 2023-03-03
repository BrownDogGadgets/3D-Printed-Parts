/*
 * MicroBit Holder.scad
 *
 * Brown Dog Gadgets
 *
 * Pete Prodoehl <pete@browndoggadgets.com>
 *
 */


// used for rounded corners on objects
use <MCAD/boxes.scad>

/* ------------------------------------------------------------------- */

$fn=50;

// do not edit these
mPosZ = -17.4;
mPosY = -10;
bitWidth = 56;


// If the micro:bit is too loose in the slot increase bitFrictionDia, 
// and if it is too tight decrease bitFrictionDia (default is 0.7)
// 
bitFrictionDia = 0.7;


// If the battery holder is too loose in the slot increase batFrictionDia, 
// and if it is too tight decrease batFrictionDia (default is 0.7)
// 
batFrictionDia = 0.7;



// the part
microbitRemote();

                
                
                
module microbitRemote() {

    difference() {

        union() {
                    
            hull() {
            
                // handles
                translate([-35,3.0,-4.80])
                    rotate([90,0,0])
                        color("#FF9933")
                            rounded_cylinder(r=10.1*2,h=6,n=1,$fn=100);

                translate([35,3,-4.80])
                    rotate([90,0,0])
                        color("#FF9933")
                            rounded_cylinder(r=10.1*2,h=6,n=1,$fn=100);
                    
            }                    
                    
            // front micro:bit holder center
            translate([0,-7,-20])
                roundedCube([bitWidth,12,10], 1, true, true);
                    
            // front micro:bit holder left
            translate([-26.5,-7,-5])
                roundedCube([3,12,20], 1, true, true);
                    
            // front micro:bit holder right
            translate([26.5,-7,-5])
                roundedCube([3,12,20], 1, true, true);
                    
            // rear battery holder
            translate([0,12,-10])
                roundedCube([32,20,30], 1, true, true);
            
        } // end union
        
        
        // -------------------------------------------- //
        // Subtractions

        
        // DEBUG - uncomment to see micro:Bit
        //%translate([0,mPosY,mPosZ+16.5]) microbitBoardFull();
            
        // DEBUG - uncomment to see battery holder
        //%translate([0,10.775,4]) batteryBox();
        
        
        // microbit slot
        translate([0,mPosY,mPosZ+16.5])
            microbitBoardSlotFull();

        // battery box slot
        translate([0,10.775,4.5])
            batteryBoxSlot();
      
        // battery box cutout for rounded edges
        translate([0,20.5,10])
            rotate([0,90,0])
                cylinder(d=35, h=50, center=true);

        // micro:bit cutout for finger grabbing hole
        translate([0,20.5,15])
            rotate([90,0,0])
                cylinder(d=25, h=50, center=true);
               
        // round over edge on finger grabbing hole
        translate([-11.6,0,15.4])
            roundedEdge();
        
        // round over edge on finger grabbing hole
        translate([11.6,0,15.4])
            rotate([0,0,180])
                roundedEdge();
                
    
        // text BDG
        translate([12.5,8,-25.1])
            linear_extrude(1.1)
                rotate([0,180,0])
                    text("BDG", font = "stencilla:style=Bold", size=7, $fm=50);
    
        // text A
        translate([-44,-2,-8])
            rotate([90,0,0])
                linear_extrude(1.1)
                    text("A", font = "Liberation Mono:style=Regular ", size=7, $fm=50);
            
        // text B
        translate([37,-2,-8])
            rotate([90,0,0])
                linear_extrude(1.1)
                    text("B", font = "Liberation Mono:style=Regular ", size=7, $fm=50);    
    
    
    
    }  // end difference

    // -------------------------------------------- //
    // Additions

    // friction bumps for micro:bit slot
    translate([-22,-6.85-2,-21])
        cylinder(d=bitFrictionDia, h=8, center=true);
    
    translate([0,-9.2-2,-21])
        cylinder(d=bitFrictionDia, h=8, center=true);

    translate([22,-6.85-2,-21])
        cylinder(d=bitFrictionDia, h=8, center=true);

        
    // friction bumps for battery slot
    translate([13.2,5,-20])
        cylinder(d=batFrictionDia, h=9, center=true);
        
    translate([-13.2,5,-20])
        cylinder(d=batFrictionDia, h=9, center=true);
            
}



// ----------------------------------------------------------------------------- //
// MODULES        
 
module microbitBoard() {
    translate([0,0,0])
        roundedCube([51.75,1.6,9], 0.1, true, true);
}
 
module microbitBoardSlotFull() {
    resize([51.75+0.5,1.6+0.5,42])
        microbitBoard();
}

module microbitBoardFull() {
    translate([0,0,0])
        roundedCube([51.75,1.6,42], 0.1, true, true);
}

module batteryBox() {
    translate([0,0,0])
        roundedCube([25.75,15.35,52.60], 0.1, true, true);
}

module batteryBoxSlot() {
    resize([25.75+0.2,15.35+0.2,52.60])
        batteryBox();
}

// r[adius], h[eight], [rou]n[d]
module rounded_cylinder(r,h,n) {
  rotate_extrude(convexity=1) {
    offset(r=n) offset(delta=-n) square([r,h]);
    square([n,h]);
  }
}

module roundedEdge() {
    difference() {
    
        translate([0,0,0])
            cube([10,10,10], center=true);
    
        translate([-5,0,-5])
            rotate([90,0,0])
                cylinder(d=10,h=20+1, center=true);
        
    }
}


