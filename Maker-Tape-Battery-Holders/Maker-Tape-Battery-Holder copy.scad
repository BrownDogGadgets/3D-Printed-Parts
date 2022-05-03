/*
 * Maker Tape Battery Holders.scad
 *
 * Brown Dog Gadgets <https://www.browndoggadgets.com/>
 *
 */


// used for rounded corners on objects
use <MCAD/boxes.scad>

// Do not edit these settings
$fn=50;
objectDistance = 0;



// ----------------------------------------------------------------------------- //
// USER SETTINGS

numberOfBatteries = 3;  // set number of batteries
batteryType = 1;        // set size: 1 for AAA, 2 for AA



// ----------------------------------------------------------------------------- //
// BATTERY SIZE SETTINGS
// Edit these if your batteries are a bit tight after you add Maker Tape...
// Increase by 0.1 if needed, print again, and test if it fits.

aaaDiameter = 10.5;
aaaLength = 44.5;

aaDiameter = 14.5;
aaLength = 50.5;



// ----------------------------------------------------------------------------- //
// Create object(s)

if (batteryType == 1) {
    objectDistance = 14.6;
    for (batNum = [1:numberOfBatteries]) {
        translate([0,objectDistance*batNum,0])
            batteryHolderAAA();
    }
}
else if (batteryType == 2) {
    objectDistance = 18.6;
    for (batNum = [1:numberOfBatteries]) {
        translate([0,objectDistance*batNum,0])
            batteryHolderAA();
    }
}



// ----------------------------------------------------------------------------- //
// Module(s) below

// AAA Size Battery

module batteryHolderAAA() {

    difference() {
        
        // starting block
        translate([0,0,0])
            roundedCube([58.5,17,11.5], 0.9, true, true);

        // sloped sides
        hull() {
            
            // top hull part
            translate([0,0,6])
                cube([aaLength+1,aaaDiameter+1.75,0.1], center=true);
            
            // bottom hull part
            translate([0,0,2])
                cube([aaaLength,aaaDiameter,0.1], center=true);
            
        }
        
        // battery slot
        translate([0,0,3])
            cube([aaaLength,aaaDiameter,10], center=true);
        
        // side cut
        translate([0,0,2])
            cube([32,30,8], center=true);

        // terminal cut left
        translate([-15.25,0,2])
            cube([14,aaaDiameter,20], center=true);

        // terminal cut right
        translate([15.25,0,2])
            cube([14,aaaDiameter,20], center=true);


        // AAA battery
        translate([0,0,0])
            rotate([0,90,0])
                cylinder(d=aaaDiameter, h=aaaLength, center=true);

    }

}


// AA Size Battery

module batteryHolderAA() {

    difference() {
        
        // starting block
        translate([0,0,0])
            roundedCube([62.5,21,15.5], 0.9, true, true);

        // sloped sides
        hull() {
            
            // top hull part
            translate([0,0,8])
                cube([aaLength+1,aaDiameter+1.75,0.1], center=true);
            
            // bottom hull part
            translate([0,0,2])
                cube([aaLength,aaDiameter,0.1], center=true);
            
        }
        
        // battery slot
        translate([0,0,3])
            cube([aaLength,aaDiameter,14], center=true);
        
        // side cut
        translate([0,0,2])
            cube([36,30,12], center=true);

        // terminal cut left
        translate([-18.25,0,2])
            cube([14,aaDiameter,20], center=true);

        // terminal cut right
        translate([18.25,0,2])
            cube([14,aaDiameter,20], center=true);


        // AA battery
        translate([0,0,0])
            rotate([0,90,0])
                cylinder(d=aaDiameter, h=aaLength, center=true);

    }

}



