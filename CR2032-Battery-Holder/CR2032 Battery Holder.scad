/*
 * CR2032 Battery Holder.scad
 *
 * Brown Dog Gadgets <https://www.browndoggadgets.com/>
 *
 * Pete Prodoehl <pete@browndoggadgets.com>
 *
 */



// ----------------------------------------------------------------------------- //
// SETTINGS

$fn=100;


// ----------------------------------------------------------------------------- //
// USER SETTINGS

numberOfBatteries   = 10;    // set number of batteries
spaceBetween        = 8;    // set space between each battery (default is 10)
useFrictionBump     = true; // set to true or false



// ----------------------------------------------------------------------------- //
// BATTERY SIZE SETTINGS
// Edit these if your batteries are different
// Increase or decrease by 0.1 if needed, print again, and test if it fits.

batteryDiameter     = 20.1375;
batteryHeight       = 3.4;



// ----------------------------------------------------------------------------- //
// Create object(s)

    
for (batNum = [1:numberOfBatteries]) {
    
    translate([0,spaceBetween*batNum,0])
        batteryHolderBase();
        
}



// ----------------------------------------------------------------------------- //
// Modules


module batteryHolderBase() {

    difference() {

        // main block
        translate([0,0,0])
            holderBase();
                
        // battery
        translate([0,0,batteryDiameter/3])
            batterySlot();
        
        // half-circle slot
        translate([0,0,batteryDiameter/3])
            halfSlot();
        
        // open bottom
        translate([0,0,7.4])
            openBottom();
        
    }
    
    if (useFrictionBump == true)
        translate([0,0,0])
            frictionBump();
    
}


module holderBase() {

    translate([0,0,0.5])
        cube([batteryDiameter+6,spaceBetween+0.1,13], center=true);

}


module batterySlot() {
    
    translate([0,0,-2.25])
        //cube([batteryDiameter,batteryHeight,batteryDiameter], center=true);
        rotate([90,0,0]) cylinder(d=batteryDiameter, h=batteryHeight, center=true, $fn=50);

}


module halfSlot() {

    difference() {
        
        translate([0,0,0])
            rotate([90,0,0])
                cylinder(d=batteryDiameter-4, h=spaceBetween+0.2*numberOfBatteries, center=true);

        translate([0,0,-7])
            cube([batteryDiameter,spaceBetween+0.2,4], center=true);

    }
}


module openBottom() {

    hull() {
        
    translate([0,0,-10])
        cube([11,spaceBetween+0.2,1], center=true);

    translate([0,0,-15])
        cube([18,spaceBetween+0.2,1], center=true);

    }

}


module frictionBump() {

    // translate math maybe a bit wonky... adjust if needed
    translate([-batteryDiameter/2+0.28,0,batteryDiameter/3])
        rotate([90,0,0])
            cylinder(d=0.4, h=spaceBetween, center=true);

}






