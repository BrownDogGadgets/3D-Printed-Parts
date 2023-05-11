/*
 * Component Holder.scad
 *
 *
 * NOTES:
 *
 * There are two different parts, the Track (with LEGO compatible fittings
 * on the bottom) and the Jaws which slide in the groove of the track and 
 * are held tight using a rubber band.
 *
 * You will need to print one track and two jaws.
 *
 * The track should be printed standing on end, and the jaws should be 
 * printed face down (with the curved PCB groove) on the bed.
 *
 * INSTRUCTIONS:
 *
 * 1. In the RENDER section set beautyRender to 1 and the rest to 0
 * 
 * 2. In SETTINGS set componentX and componentY to the size of the 
 *    PCB of the component you will be using.
 *
 * 3. In SETTINGS adjust brickX and brickY to be sized appropriately 
 *    to fit the component you added in the first step.
 * 
 * 4. If needed, change slotWidth to a number above 0 to accommodate 
 *    elements that may need clearance on the jaws.
 * 
 * 5. In the RENDER section set only trackRender to 1 and then export
 *    that, and then do the same for jawRender.
 *
 * 
 * Pete Prodoehl <pete@browndoggadgets.com>
 *
 */


/* --- SETTIINGS ---------------------------------------------------------------------------- */

// set the size of the component
componentX = 27;
componentY = 19;

// adjust for the size you need to hold the component
brickX = 4;
brickY = 4;

// do not change these values
trackWidth  = brickX * 8;   // do not change
trackLength = brickY * 8;   // do not change
trackHeight = 5.5;          // do not change
trackMidX   = 4;            // do not change
trackMidZ   = 5;            // do not change
trackBotX   = 10;           // do not change
trackBotZ   = 2.5;          // do not change

// adjust if desired to change the width of the jaws
jawWidth = trackWidth;

// adjusting only affects preview of jaws if needed
jawPreviewSpace = 4.5;  // default to 4.5

// add a slot in the jaw for some components if needed
slotWidth = 0; // set to 0 for no slot

$fn=50;


/* --- RENDER ------------------------------------------------------------------------------- */


// toggle these to affect the preview and rendering
trackRender  = 0;
jawRender    = 0;
beautyRender = 1;



// render commands
if (jawRender) {
	translate([0,0,0/2]) jawPart();
}
if (trackRender) {
	translate([0,0,0/2]) trackPart();
}
if (beautyRender) {
	translate([0,-trackLength/2+jawPreviewSpace,0]) rotate([0,0,0])   color("#0066FF") jawPart();
	translate([0,+trackLength/2-jawPreviewSpace,0]) rotate([0,0,180]) color("#0066FF") jawPart();
	translate([0,0,0]) color("#99AA00") trackPart();
	%translate([0,0,11]) cube([componentX,componentY,1.6], center=true); // component size here
}



/* --- MODULES ------------------------------------------------------------------------------ */

// jawPart is the jaws which hold the component...
//
module jawPart() {

    difference() {
        
        // top of jaw with PCB and rubber band slot cutouts
        translate([0,0,8.5])
            cube([jawWidth,8,10], center=true);
            
        // PCB slot
        hull() {
        
            translate([0,4.75,11])
                rotate([0,90,0])
                    cylinder(d=2.6, h=jawWidth+0.01, center=true);

            translate([0,3.65,11])
                rotate([0,90,0])
                    cylinder(d=2.1, h=jawWidth+0.01, center=true);                
                
        }
            
        // rubber band slot
        translate([0,-4.5,7.5])
            cube([jawWidth+0.01,4,3.5], center=true);
            
        // slot if included
        translate([0,0,13.85])
            cube([slotWidth,10,5.75], center=true);
      
    }

	// inverted T at the bottom of the jaw
    translate([0,0,0])
        guidePart();

}

/* ------------------------------------------------------------------------------------------ */

// trackPart is the basic track sized as specified
// with the guideSlot cut out from it...
//
module trackPart() {
    
    difference() {

        translate([0,0,-trackHeight/2+3.2])
            cube([trackWidth,trackLength,trackHeight], center=true);
            
        translate([0,-0.8,0])
           guideSlot();

    }
    
    // LEGO compatible bottom portion
    translate([0,0,-4.285])
        Lego_Maker(brickY, brickX);
	
} // end trackPart

/* ------------------------------------------------------------------------------------------ */

// guidePart is the inverted T at the bottom of the jaw that fits into the slot/groove
// in the trackPart which gets created by cutting out the guideSlot...
//
module guidePart() {

    variance = 0;
    trackLength = 8; 

    // middle
    translate([0,0,3])
        color("#00FF33")
            cube([trackMidX+variance,trackLength,trackMidZ+variance], center=true);
    
    // bottom
    translate([0,0,0])
        color("#33AA66")
            cube([trackBotX+variance,trackLength,trackBotZ+variance], center=true);
        
}  // end guidePart

/* ------------------------------------------------------------------------------------------ */

// guideSlot is the cutout part from the trackPart which creates the slot/groove 
// that the guidePart fits into and slides in...
//
module guideSlot() {
    
    variance = 0.9;
    
    // middle
    translate([0,0,3])
        color("#996600")
            cube([trackMidX+variance,trackLength,trackMidZ+variance], center=true);
            
    // bottom
    translate([0,0,0])
        color("#999900")
            cube([trackBotX+variance,trackLength,trackBotZ+variance], center=true);
        
}  // end guideSlot

/* ------------------------------------------------------------------------------------------ */

// Lego_Maker creates the modified LEGO brick-like part at the bottom of the holder...
//
module Lego_Maker(width, length) {

	unit_height   = 4;    // height of main brick
	unit_width    = 8;    // width of one LEGO Unit
    wall_width_x2 = 3.15; // double wall width
    
    difference() {
    
        translate([0,0,0])
            cube([length*unit_width, width*unit_width, unit_height], center=true);
    
        translate([0,0,-1])
            cube([length*unit_width-2.4, width*unit_width-2.4, unit_height], center=true);

    }
    
    translate([trackWidth/2-unit_width,0,0])
        cube([wall_width_x2, width*unit_width, unit_height], center=true);
        
    translate([-trackWidth/2+unit_width,0,0])
        cube([wall_width_x2, width*unit_width, unit_height], center=true);

}  // end Lego_Maker

/* ------------------------------------------------------------------------------------------ */






