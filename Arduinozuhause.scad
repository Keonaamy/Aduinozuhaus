$fn=50;

h = 70;
dWand = 3;
ddWand = 6;
B =6;
b =2;
hh=3;
wand = [h,h-6,1];

platte = [h-ddWand-0.5,h-ddWand-0.5,1.5];

module roundcube(x,y,z,r){ 
    hull(){
        translate([  r,  r,  r]) sphere(r=r);
        translate([x-r,  r,  r]) sphere(r=r);
        translate([  r,y-r,  r]) sphere(r=r);
        translate([x-r,y-r,  r]) sphere(r=r);
        translate([  r,  r,z-r]) sphere(r=r);
        translate([x-r,  r,z-r]) sphere(r=r);
        translate([  r,y-r,z-r]) sphere(r=r);
        translate([x-r,y-r,z-r]) sphere(r=r);}
}

module gehaeuse(){
    
    
    
    difference(){
        translate([0,0,0])roundcube(h,h,h,3);
            translate([dWand,dWand,dWand])cube([h-ddWand,h-ddWand,h]);
        //hülle
        
        translate([dWand+1,34,h-dWand])rotate([90,0,0])linear_extrude(height= h-2,center=true)polygon(points=[[-B/3,-hh+3],[-b/2,hh],[b+h-9,hh],[B+h-12,-hh+3]]);
        
        
        
          
        
        
       }
        translate([h+10,35,0])rotate([90,0,0])linear_extrude(height= h-2,center=true)polygon(points=[[-B/3,-hh+3],[-b/2,hh],[b+h-9,hh],[B+h-12,-hh+3]]); //deckel
}
module inneneinrichtung(){
//Wanddeko1
        for (a=[ 2:2:62]){
            rotate([-90,0,0])translate([dWand,-60,dWand+a])linear_extrude(height= 1,center=true)polygon( points=[[0,0],[0,2],[2,0]]); 
            rotate([-90,90,0])translate([-60,-h+dWand,dWand+a])linear_extrude(height= 1,center=true)polygon( points=[[0,0],[0,2],[2,0]]);
            rotate([-90,0,0])translate([dWand,-10,dWand+a])linear_extrude(height= 1,center=true)polygon( points=[[0,0],[0,2],[2,0]]);
            rotate([-90,90,0])translate([-10,-h+dWand,dWand+a])linear_extrude(height= 1,center=true)polygon( points=[[0,0],[0,2],[2,0]]);
           
        }
           
    
          }
          
module maeuerchen(){

    difference(){
        translate([0,0,0])cube(platte);
        translate([5,5,-1])cylinder(h=4, r=3);
        translate([58.5,5,-1])cylinder(h=4, r=3);
        translate([5,58.5,-1])cylinder(h=4, r=3);
        translate([58.5,58.5,-1])cylinder(h=4, r=3);
    }
}
    
    
module fensterchen (){
    
    for(u=[0:15:45]){
        translate([10,-0.5,8+u])roundcube(12,7,7,1);
        translate([10,65,8+u])roundcube(12,7,7,1);
        translate([50,-0.8,12+u])rotate([-90,90,0])cylinder(5,5.1,5.1);
        translate([50,66,12+u])rotate([-90,90,0])cylinder(5,5.1,5.1);
    }
   
   
    
    }
// module schnipschnap (){
        difference(){
            gehaeuse();
             fensterchen();
            }
//        
//    }

inneneinrichtung();
//schnipschnap ();
b_m = platte[1]; //h-ddWand-0.5

 abst_m = 20;
 anzahl = 2;
 anzahl_2 = 3;
 anfang_m = h + abst_m;
for (j = [0 : anzahl_2-1])
{
  for( v = [0 : anzahl-1])
        {
        translate([j*(b_m+abst_m),anfang_m+v*(b_m+abst_m),0]) maeuerchen(); 
    }
}