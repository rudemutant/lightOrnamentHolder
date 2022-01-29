/*
    ornamentBase.scad contains the base of the related ornament holder
    Copyright (C) 2022  Robert Daniel Berne

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/

echo ("    ornamentBase.scad  Copyright (C) 2022  Robert Daniel Berne

    This program comes with ABSOLUTELY NO WARRANTY;
    This is free software, and you are welcome to redistribute it
    under certain conditions. See the GNU GPL for more details.");


module holderFoot(){
    a=15;
    b=5;
    c=15;
translate([-b/2,(-a/2),0])
    cube([b,a,c]);
}

module foot(x=0,y=0,ankle=0){
    
    if(ankle==1){
        translate([x,y,8])
        cylinder(d=8,h=6);
    }else{//bottom of foot
        
        translate([x,y])
        cylinder(d1=14,d2=6,h=12);
        
        translate([x,y])
        difference(){
            sphere(d=14);
            translate([-9,-9])
            cube([18,18,18]);
        }
    }
}

module base(){
    union(){
        hull(){
            foot(ankle=1);
            foot(35,70,1);
        }
        hull(){
            foot(ankle=1);
            foot(-35,70,1);
            
        }
        hull(){
            foot(35,70,1);
            foot(-35,70,1);
            
        }
    }
    //foot();
    foot(35,70);
    foot(-35,70);
    translate([0,0,1.5])
    cylinder(d=17,h=12.5);
    translate([0,0,1.5])
    sphere(d=17);
    
}
difference(){
    base();
    holderFoot();
    
}