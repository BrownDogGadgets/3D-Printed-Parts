// Brown Dog Gadgets - https://www.browndoggadgets.com/
// 
// Original Source: https://www.prusaprinters.org/prints/33038-even-more-customizable-straight-beam-for-legotm-te

// Hole sequence. o for round hole, + for plus-shaped hole, capital O for sideways hole, capital P for sideways plus, and x for blank spot. eg. "+ooo+", "oOo", "oxPxo", etc.
//holes = "+oo+"; // 5 holes with plusses at end

// If true, piece will be half-height
half_height="false"; // [true, false]

$fn=50*1.0;

Pitch = 8*1.0; //hole spacing
Radius1 = 4.8/2; //thru hole radius
Radius2 = 6.1/2; //countersunk hole radius
Height = half_height=="true"?4.0:7.8*1.0;
Depth = 0.85*1.0; //depth of beam hole counterbore
Width = 7.3*1.0;
Plus_Width = 2.0*1.0;

Overhang = 0.05*1.0;

holes  = "ooooooo";
holes1 = "ooooooo";
holes2 = "xxx";
holes3 = "xxx";
holes4 = "oxo";




// render the base
rotate([180,0,180])
    theBase();




module theBase() {
    
    union() {
        
        translate([-7.3,-7.25,0])
            drawBeam();
            
        translate([-7.3,0,0])
            drawBeam1();
            
        translate([16,7,0])
            drawBeam2();

        translate([16,12,0])
            drawBeam3();

        translate([16,19,0])
            drawBeam4();
        
    }

}


// ----------------------------------------------------------------------------- //
module body()
{
    translate([0, Width/2, 0]) 
    hull() {
        cylinder(r=Width/2, h=Height);
        
        translate([(len(holes)-1)*Pitch, 0, 0]) 
            cylinder(r=Width/2, h=Height);
    }
}

module body2()
{
    translate([0, Width/2, 0]) 
    hull() {
        cylinder(r=Width/2, h=Height);
        
        translate([(len(holes2)-1)*Pitch, 0, 0]) 
            cylinder(r=Width/2, h=Height);
    }
}

module body3()
{
    translate([0, Width/2, 0]) 
    hull() {
        cylinder(r=Width/2, h=Height);
        
        translate([(len(holes3)-1)*Pitch, 0, 0]) 
            cylinder(r=Width/2, h=Height);
    }
}


module body4()
{
    translate([0, Width/2, 0]) 
    hull() {
        cylinder(r=Width/2, h=Height);
        
        translate([(len(holes4)-1)*Pitch, 0, 0]) 
            cylinder(r=Width/2, h=Height);
    }
}

module hole()
{
    union()
	{
        //core
        cylinder(r=Radius1,h=Height);
        
        //top countersink
        translate([0,0,Height-Depth+Overhang]) 
            cylinder(r=Radius2,h=Depth);
        
        //bottom countersink
        translate([0,0,-Overhang/2]) 
            cylinder(r=Radius2,h=Depth);
        
        translate([0,0,Depth-Overhang])
            cylinder(h=(Radius2 - Radius1), r1=Radius2, r2=Radius1);
    }
}

module plus() {

    union() {
        translate([-Plus_Width/2, -Radius1, -Overhang]) 
            cube([Plus_Width, Radius1*2, Height+Overhang*2]);
        translate([-Radius1, -Plus_Width/2, -Overhang]) 
            cube([Radius1*2, Plus_Width, Height+Overhang*2]);
    }
}

module drawBeam()
{
    difference()
    {
        body();
       
        for (i = [1:len(holes)])
        {
            if (holes[i-1] == "+")
                translate([(i-1)*Pitch, Width/2, 0])
                    plus();
            else if (holes[i-1] == "o")
                translate([(i-1)*Pitch, Width/2, 0])
                    hole();
            else if (holes[i-1] == "O")
                rotate([90,0,0])
                translate([(i-1)*Pitch, Width/2,-Pitch+Depth/2])
                    hole();
            else if (holes[i-1] == "P")
                rotate([90,0,0])
                translate([(i-1)*Pitch, Width/2,-Pitch+Depth/2])
                    plus();
            else if (holes[i-1] == "x") {}
            else
                translate([(i-1)*Pitch, Width/2, 0])
                    hole();
        }
    }
}


module drawBeam1()
{
    difference()
    {
        body();
       
        for (i = [1:len(holes)])
        {
            if (holes1[i-1] == "+")
                translate([(i-1)*Pitch, Width/2, 0])
                    plus();
            else if (holes1[i-1] == "o")
                translate([(i-1)*Pitch, Width/2, 0])
                    hole();
            else if (holes1[i-1] == "O")
                rotate([90,0,0])
                translate([(i-1)*Pitch, Width/2,-Pitch+Depth/2])
                    hole();
            else if (holes1[i-1] == "P")
                rotate([90,0,0])
                translate([(i-1)*Pitch, Width/2,-Pitch+Depth/2])
                    plus();
            else if (holes1[i-1] == "x") {}
            else
                translate([(i-1)*Pitch, Width/2, 0])
                    hole();
        }
    }
}


module drawBeam2()
{
    difference()
    {
        body2();
       
        for (i = [1:len(holes2)])
        {
            if (holes2[i-1] == "+")
                translate([(i-1)*Pitch, Width/2, 0])
                    plus();
            else if (holes2[i-1] == "o")
                translate([(i-1)*Pitch, Width/2, 0])
                    hole();
            else if (holes2[i-1] == "O")
                rotate([90,0,0])
                translate([(i-1)*Pitch, Width/2,-Pitch+Depth/2])
                    hole();
            else if (holes2[i-1] == "P")
                rotate([90,0,0])
                translate([(i-1)*Pitch, Width/2,-Pitch+Depth/2])
                    plus();
            else if (holes2[i-1] == "x") {}
            else
                translate([(i-1)*Pitch, Width/2, 0])
                    hole();
        }
    }
}


module drawBeam3()
{
    difference()
    {
        body3();
       
        for (i = [1:len(holes2)])
        {
            if (holes3[i-1] == "+")
                translate([(i-1)*Pitch, Width/2, 0])
                    plus();
            else if (holes3[i-1] == "o")
                translate([(i-1)*Pitch, Width/2, 0])
                    hole();
            else if (holes3[i-1] == "O")
                rotate([90,0,0])
                translate([(i-1)*Pitch, Width/2,-Pitch+Depth/2])
                    hole();
            else if (holes3[i-1] == "P")
                rotate([90,0,0])
                translate([(i-1)*Pitch, Width/2,-Pitch+Depth/2])
                    plus();
            else if (holes3[i-1] == "x") {}
            else
                translate([(i-1)*Pitch, Width/2, 0])
                    hole();
        }
    }
}


module drawBeam4()
{
    difference()
    {
        body4();
       
        for (i = [1:len(holes2)])
        {
            if (holes4[i-1] == "+")
                translate([(i-1)*Pitch, Width/2, 0])
                    plus();
            else if (holes4[i-1] == "o")
                translate([(i-1)*Pitch, Width/2, 0])
                    hole();
            else if (holes4[i-1] == "O")
                rotate([90,0,0])
                translate([(i-1)*Pitch, Width/2,-Pitch+Depth/2])
                    hole();
            else if (holes4[i-1] == "P")
                rotate([90,0,0])
                translate([(i-1)*Pitch, Width/2,-Pitch+Depth/2])
                    plus();
            else if (holes4[i-1] == "x") {}
            else
                translate([(i-1)*Pitch, Width/2, 0])
                    hole();
        }
    }
}


