/*
 * MicroBit Storage Tray.scad
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

// set view to body and then render and export if you just want the tray
// set view to text and then render and export if you also want the BDG text
// set view to both if you want to make changes and need to see both parts
// 
view = "body"; // body text both


/* -------------------------------------------------------------------------- */

// edit as desired
numberOfBits = 4;   // set number of microbits you want the tray to hold
spaceBetween = 17;   // set space between each microbit (default is 17)

// change to 0 for straight up (default is -10)
slantAngle = -10;

// If the micro:bit is too loose in the slot increase bitFrictionDia, 
// and if it is too tight decrease bitFrictionDia (default is 0.7)
// 
bitFrictionDia = 1.1;


/* -------------------------------------------------------------------------- */

if (view == "body") {
    microbitStorageTrayBody();
}
else if (view == "text") {
    microbitStorageTrayText();
}
else if (view == "both") {
    microbitStorageTrayBody();
    microbitStorageTrayText();
}



/* -------------------------------------------------------------------------- */

// do not edit these
mPosZ = -17.4;
mPosY = -2;
bitWidth = 56;

mLen = numberOfBits*spaceBetween;




// ------------------------------------------------------------------------------------ //
// --  MODULE STORAGE TRAY ------------------------------------------------------------ //

module microbitStorageTrayBody() {

    difference() {

        translate([0,+numberOfBits*spaceBetween/2+spaceBetween,0])
        union() {
               
                    
            // front micro:bit holder center
            translate([0,-spaceBetween/2,-18])
                roundedCube([bitWidth,mLen,8], 1, true, true);
                    
            // front micro:bit holder left
            translate([-26.5,-spaceBetween/2,-5])
                roundedCube([3,mLen,20], 1, true, true);
                    
            // front micro:bit holder right
            translate([26.5,-spaceBetween/2,-5])
                roundedCube([3,mLen,20], 1, true, true);

            
        } // end union
        
        
        // -------------------------------------------- //
        // Subtractions go below


        // Show ghost image of microbits
        for (bitNum = [1:numberOfBits]) {
            
            %translate([0,spaceBetween*bitNum,0])
                rotate([slantAngle,0,0])
                    microbitBoardSlotFull();
        }
        
        
        // Make the slots for the microbits
        for (bitNum = [1:numberOfBits]) {
            
            translate([0,spaceBetween*bitNum,0])
                rotate([slantAngle,0,0])
                    microbitBoardSlotFull();
        }

    
        // text BDG
        translate([16.25,+mLen/2-8,-22.01])
            color("#000000")
	            linear_extrude(0.2)
	                rotate([0,180,0])
	                    scale([1.1,1.1,1.0])
                            import("BDG-VAG-Rounded-Std.svg");

    
    }  // end difference

    // -------------------------------------------- //
    // Additions go below

        
        
}



// ------------------------------------------------------------------------------------ //
// --  MODULE BOTTOM TEXT ------------------------------------------------------------- //

module microbitStorageTrayText() {
        
    // text BDG
    translate([16.25,+mLen/2-8,-22.00])
        color("#000000")
            linear_extrude(0.2)
                rotate([0,180,0])
                    scale([1.10,1.1,1.0])
                        import("BDG-VAG-Rounded-Std.svg");

}




// ------------------------------------------------------------------------------------ //
// --  MODULES ------------------------------------------------------------------------ //
 
module microbitBoard() {
    translate([0,0,0])
        roundedCube([51.75,1.6,9], 0.1, true, true);
}


module microbitBoardSlotFull() {

    varianceVal = 0.5;

    difference() {

        resize([51.75+varianceVal,1.6+varianceVal,42])
            microbitBoard();

        translate([-22, mPosY+1, -21])
            cylinder(d=bitFrictionDia, h=8, center=true);
        
        translate([0, mPosY+3, -21])
            cylinder(d=bitFrictionDia, h=8, center=true);
        
        translate([+22, mPosY+1 ,-21])
            cylinder(d=bitFrictionDia, h=8, center=true);
            
    }
}


