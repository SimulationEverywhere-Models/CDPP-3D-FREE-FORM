% 3D-Plastic Deformation Model using Margolus Neighborhood
#include(plastic.inc)

[top]
components : plastic

[plastic]
type : cell
dim : (10,9,12,3)
delay : transport
defaultDelayTime  : 100
border : nowrapped
neighbors : plastic(-1,-1,-1,0) plastic(-1,0,-1,0) plastic(-1,1,-1,0)
neighbors : plastic(0,-1,-1,0)  plastic(0,0,-1,0)  plastic(0,1,-1,0)
neighbors : plastic(1,-1,-1,0)  plastic(1,0,-1,0)  plastic(1,1,-1,0)

neighbors : plastic(-1,-1,0,0) plastic(-1,0,0,0) plastic(-1,1,0,0)
neighbors : plastic(0,-1,0,0)  plastic(0,0,0,0)  plastic(0,1,0,0) plastic(0,0,0,1) plastic(0,0,0,2)
neighbors : plastic(1,-1,0,0)  plastic(1,0,0,0)  plastic(1,1,0,0)

neighbors : plastic(-1,-1,1,0) plastic(-1,0,1,0) plastic(-1,1,1,0)
neighbors : plastic(0,-1,1,0)  plastic(0,0,1,0)  plastic(0,1,1,0) 
neighbors : plastic(1,-1,1,0)  plastic(1,0,1,0)  plastic(1,1,1,0)

neighbors : plastic(-1,-1,2,0) plastic(-1,0,2,0) plastic(-1,1,2,0)
neighbors : plastic(0,-1,2,0)  plastic(0,0,2,0)  plastic(0,1,2,0) 
neighbors : plastic(1,-1,2,0)  plastic(1,0,2,0)  plastic(1,1,2,0)

initialvalue : 0
initialCellsValue : 3DFreeForm.val
localtransition : deformation-rule

[deformation-rule]
% deformation
rule : { (0,0,0,0 )+ (#macro(Value<1,0,0,0>)+#macro(Value<1,1,0,0>)+ #macro(Value<0,1,0,0>)+ #macro(Value<1,0,-1,0>)+#macro(Value<1,1,-1,0>)+ #macro(Value<0,1,-1,0>)+ #macro(Value<0,0,-1,0>))/(8 - #macro(Threshhold<1,0,0,0>) - #macro(Threshhold<1,1,0,0>)- #macro(Threshhold<0,1,0,0>)- #macro(Threshhold<1,0,-1,0>) - #macro(Threshhold<1,1,-1,0>)- #macro(Threshhold<0,1,-1,0>)- #macro(Threshhold<0,0,-1,0>)) } 100 { (0,0,0,2) = 0 and cellpos(3)=0 and (0,0,0,0 )<21 and cellpos(0)<9 and cellpos(1) < 8 and cellpos(2)>0 and  ((even(cellpos(0)) and even(cellpos(1)) and even(cellpos(2)) and (0,0,0,1)=0) or (odd(cellpos(0)) and odd(cellpos(1)) and odd(cellpos(2)) and (0,0,0,1)=1))  and ((0,0,0,0 ) + (0,1,0,0)+(1,0,0,0)+(1,1,0,0))> 0 and ((0,0,-1,0 ) + (0,1,-1,0)+(1,0,-1,0)+(1,1,-1,0))> 0  and ((1,0,0,0)>=21 or (1,1,0,0)>=21  or (0,1,0,0)>=21 or (1,0,-1,0)>=21 or (1,1,-1,0)>=21  or (0,1,-1,0)>=21 or (0,0,-1,0)>=21) }

rule : { (0,0,0,0 )*0.7 } 100 { (0,0,0,2) = 0 and cellpos(3)=0 and (0,0,0,0 ) >= 21 and cellpos(0)<9 and cellpos(1) < 8 and cellpos(2)>0 and (0,0,0,0 )>21 and ((even(cellpos(0)) and even(cellpos(1)) and even(cellpos(2)) and (0,0,0,1)=0) or (odd(cellpos(0)) and odd(cellpos(1)) and odd(cellpos(2)) and (0,0,0,1)=1)) and ((0,0,-1,0 ) + (0,1,-1,0)+(1,0,-1,0)+(1,1,-1,0))> 0  and ((1,0,0,0)<21 or (1,1,0,0)<21  or (0,1,0,0)<21 or (1,0,-1,0)<21 or (1,1,-1,0)<21  or (0,1,-1,0)<21 or (0,0,-1,0)<21) }

rule : { (0,0,0,0 ) +(#macro(Value<1,0,0,0>)+#macro(Value<0,-1,0,0>)+ #macro(Value<1,-1,0,0>)+#macro(Value<1,0,-1,0>)+#macro(Value<0,-1,-1,0>)+ #macro(Value<1,-1,-1,0>)+ #macro(Value<0,0,-1,0>))/( 8 - #macro(Threshhold<1,0,0,0>)- #macro(Threshhold<0,-1,0,0>) - #macro(Threshhold<1,-1,0,0>)- #macro(Threshhold<1,0,-1,0>)- #macro(Threshhold<0,-1,-1,0>)- #macro(Threshhold<1,-1,-1,0>) - #macro(Threshhold<0,0,-1,0>)) } 100 {(0,0,0,2) = 0 and cellpos(3)=0 and (0,0,0,0 )<21 and cellpos(0)<9 and cellpos(1) > 0 and cellpos(2)>0 and ((even(cellpos(0)) and odd(cellpos(1)) and even(cellpos(2)) and (0,0,0,1)=0) or (odd(cellpos(0)) and even(cellpos(1)) and odd(cellpos(2)) and (0,0,0,1)=1)) and ((0,0,0,0 ) + (1,0,0,0)+(0,-1,0,0)+(1,-1,0,0))> 0 and ((0,0,-1,0 ) + (1,0,-1,0)+(0,-1,-1,0)+(1,-1,-1,0))> 0 and ((1,0,0,0)>=21 or (0,-1,0,0)>=21 or (1,-1,0,0)>=21 or (1,0,-1,0)>=21 or (0,-1,-1,0)>=21 or (1,-1,-1,0)>=21 or (0,0,-1,0)>=21 ) }

rule : { (0,0,0,0 )*0.7 } 100 {(0,0,0,2) = 0 and cellpos(3)=0 and (0,0,0,0 )>=21 and cellpos(0)<9 and cellpos(1) > 0 and cellpos(2)>0 and ((even(cellpos(0)) and odd(cellpos(1)) and even(cellpos(2)) and (0,0,0,1)=0) or (odd(cellpos(0)) and even(cellpos(1)) and odd(cellpos(2)) and (0,0,0,1)=1)) and ((0,0,-1,0 ) + (1,0,-1,0)+(0,-1,-1,0)+(1,-1,-1,0))> 0  and ((1,0,0,0)<21 or (0,-1,0,0)<21 or (1,-1,0,0)<21 or (1,0,-1,0)<21 or (0,-1,-1,0)<21 or (1,-1,-1,0)<21 or (0,0,-1,0)<21) }

rule : { (0,0,0,0 ) + (#macro(Value<-1,0,0,0>)+#macro(Value<0,1,0,0>)+ #macro(Value<-1,1,0,0>)+#macro(Value<-1,0,-1,0>)+#macro(Value<0,1,-1,0>)+ #macro(Value<-1,1,-1,0>)+#macro(Value<0,0,-1,0>))/( 8 - #macro(Threshhold<-1,0,0,0>)- #macro(Threshhold<0,1,0,0>)- #macro(Threshhold<-1,1,0,0>)- #macro(Threshhold<-1,0,-1,0>)- #macro(Threshhold<0,1,-1,0>)- #macro(Threshhold<-1,1,-1,0>) - #macro(Threshhold<0,0,-1,0>)) } 100 { (0,0,0,2) = 0 and cellpos(3)=0 and (0,0,0,0)<21 and cellpos(0)>0 and cellpos(1) < 8  and cellpos(2)>0 and ((odd(cellpos(0)) and even(cellpos(1)) and even(cellpos(2)) and (0,0,0,1)=0) or (even(cellpos(0)) and odd(cellpos(1)) and odd(cellpos(2)) and (0,0,0,1)=1)) and ((0,0,0,0 ) + (-1,0,0,0)+(0,1,0,0)+(-1,1,0,0))> 0 and ((0,0,-1,0 ) + (-1,0,-1,0)+(0,1,0,0)+(-1,1,-1,0))> 0  and ((-1,0,0,0)>=21 or (0,1,0,0)>=21 or (-1,1,0,0)>=21 or (-1,0,-1,0)>=21 or (0,1,-1,0)>=21 or (-1,1,-1,0)>=21 or (0,0,-1,0)>=21)}
 

rule : { (0,0,0,0 )*0.7 } 100 {(0,0,0,2) = 0 and cellpos(3)=0 and (0,0,0,0 )>=21 and cellpos(0)>0 and cellpos(1) < 8  and cellpos(2)>0 and ((odd(cellpos(0)) and even(cellpos(1)) and even(cellpos(2)) and (0,0,0,1)=0) or (even(cellpos(0)) and odd(cellpos(1)) and odd(cellpos(2)) and (0,0,0,1)=1)) and ((0,0,-1,0 ) + (-1,0,-1,0)+(0,1,-1,0)+(-1,1,-1,0))> 0  and ((-1,0,0,0)<21 or (0,1,0,0)<21 or (-1,1,-1,0)<21 or (-1,0,-1,0)<21 or (0,1,-1,0)<21 or (-1,1,-1,0)<21  or (0,0,-1,0)<21)}

rule : { (0,0,0,0 ) +(#macro(Value<-1,0,0,0>)+#macro(Value<-1,-1,0,0>)+ #macro(Value<0,-1,0,0>)+#macro(Value<-1,0,-1,0>)+#macro(Value<-1,-1,-1,0>)+ #macro(Value<0,-1,-1,0>)+#macro(Value<0,0,-1,0>))/( 8 - #macro(Threshhold<-1,0,0,0>)- #macro(Threshhold<-1,-1,0,0>)- #macro(Threshhold<0,-1,0,0>)- #macro(Threshhold<-1,0,-1,0>)- #macro(Threshhold<-1,-1,-1,0>)- #macro(Threshhold<0,-1,-1,0>)- #macro(Threshhold<0,0,-1,0>))} 100 { (0,0,0,2) = 0 and cellpos(3)=0 and (0,0,0,0 )<21 and cellpos(0)>0 and cellpos(1) >0  and cellpos(2)>0 and ((odd(cellpos(0)) and odd(cellpos(1)) and even(cellpos(2)) and (0,0,0,1)=0) or (even(cellpos(0)) and even(cellpos(1)) and odd(cellpos(2)) and (0,0,0,1)=1)) and ((0,0,0,0 ) + (-1,0,0,0)+(0,-1,0,0)+(-1,-1,0,0))> 0 and ((0,0,-1,0 ) + (-1,0,-1,0)+(0,-1,-1,0)+(-1,-1,-1,0))> 0 and ((-1,0,0,0)>=21 or (-1,-1,0,0)>=21 or (0,-1,0,0)>=21 or (-1,0,-1,0)>=21 or (-1,-1,-1,0)>=21 or (0,-1,-1,0)>=21 or (0,0,-1,0)>=21) }


rule : { (0,0,0,0 )*0.7 } 100 { (0,0,0,2) = 0  and cellpos(3)=0 and (0,0,0,0 )>=21 and cellpos(0)>0 and cellpos(1) >0 and cellpos(2)>0 and ((odd(cellpos(0)) and odd(cellpos(1)) and even(cellpos(2)) and (0,0,0,1)=0) or (even(cellpos(0)) and even(cellpos(1)) and odd(cellpos(2)) and (0,0,0,1)=1)) and ((0,0,-1,0 ) + (-1,0,-1,0)+(0,-1,-1,0)+(-1,-1,-1,0))> 0 and ((-1,0,0,0)<21 or (-1,-1,0,0)<21 or (0,-1,0,0)<21 or (-1,0,-1,0)<21 or (-1,-1,-1,0)<21 or (0,-1,-1,0)<21 or (0,0,-1,0)<21) }

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


rule : { (0,0,0,0 )+ (#macro(Value<1,0,0,0>)+#macro(Value<1,1,0,0>)+ #macro(Value<0,1,0,0>)+ #macro(Value<1,0,1,0>)+#macro(Value<1,1,1,0>)+ #macro(Value<0,1,1,0>)+ #macro(Value<0,0,1,0>))/(8 - #macro(Threshhold<1,0,0,0>) - #macro(Threshhold<1,1,0,0>)- #macro(Threshhold<0,1,0,0>)- #macro(Threshhold<1,0,1,0>) - #macro(Threshhold<1,1,1,0>)- #macro(Threshhold<0,1,1,0>)- #macro(Threshhold<0,0,1,0>)) } 100 { (0,0,0,2) = 0 and cellpos(3)=0 and (0,0,0,0 )<21 and cellpos(0)<9 and cellpos(1) < 8 and cellpos(2)<11 and ((even(cellpos(0)) and even(cellpos(1)) and odd(cellpos(2)) and (0,0,0,1)=0) or (odd(cellpos(0)) and odd(cellpos(1)) and even(cellpos(2)) and (0,0,0,1)=1)) and ((0,0,0,0 ) + (0,1,0,0)+(1,0,0,0)+(1,1,0,0))> 0 and ((0,0,1,0 ) + (0,1,1,0)+(1,0,1,0)+(1,1,1,0))> 0 and ((1,0,0,0)>=21 or (1,1,0,0)>=21  or (0,1,0,0)>=21 or (1,0,1,0)>=21 or (1,1,1,0)>=21  or (0,1,1,0)>=21 or (0,0,1,0)>=21) }

rule : { (0,0,0,0 )*0.7 } 100 { (0,0,0,2) = 0 and  cellpos(3)=0 and (0,0,0,0 ) >= 21 and cellpos(0)<9 and cellpos(1) < 8 and cellpos(2)<11 and (0,0,0,0 )>21 and ((even(cellpos(0)) and even(cellpos(1)) and odd(cellpos(2)) and (0,0,0,1)=0) or (odd(cellpos(0)) and odd(cellpos(1)) and even(cellpos(2)) and (0,0,0,1)=1))  and ((0,0,1,0) + (0,1,1,0)+(1,0,1,0)+(1,1,1,0))> 0 and ((1,0,0,0)<21 or (1,1,0,0)<21  or (0,1,0,0)<21 or (1,0,1,0)<21 or (1,1,1,0)<21  or (0,1,1,0)<21 or (0,0,1,0)<21) }

rule : { (0,0,0,0 ) +(#macro(Value<1,0,0,0>)+#macro(Value<0,-1,0,0>)+ #macro(Value<1,-1,0,0>)+#macro(Value<1,0,1,0>)+#macro(Value<0,-1,1,0>)+ #macro(Value<1,-1,1,0>)+ #macro(Value<0,0,1,0>))/( 8 - #macro(Threshhold<1,0,0,0>)- #macro(Threshhold<0,-1,0,0>) - #macro(Threshhold<1,-1,0,0>)- #macro(Threshhold<1,0,1,0>)- #macro(Threshhold<0,-1,1,0>)- #macro(Threshhold<1,-1,1,0>) - #macro(Threshhold<0,0,1,0>)) } 100 {(0,0,0,2) = 0 and  cellpos(3)=0 and (0,0,0,0 )<21 and cellpos(0)<9 and cellpos(1) > 0 and cellpos(2)<11 and ((even(cellpos(0)) and odd(cellpos(1)) and odd(cellpos(2)) and (0,0,0,1)=0) or (odd(cellpos(0)) and even(cellpos(1)) and even(cellpos(2)) and (0,0,0,1)=1)) and ((0,0,0,0 ) + (1,0,0,0)+(0,-1,0,0)+(1,-1,0,0))> 0  and ((0,0,1,0 ) + (1,0,1,0)+(0,-1,1,0)+(1,-1,1,0))> 0  and ((1,0,0,0)>=21 or (0,-1,0,0)>=21 or (1,-1,0,0)>=21 or (1,0,1,0)>=21 or (0,-1,1,0)>=21 or (1,-1,1,0)>=21 or (0,0,1,0)>=21) }

rule : { (0,0,0,0 )*0.7 } 100 {(0,0,0,2) = 0  and cellpos(3)=0 and (0,0,0,0 )>=21 and cellpos(0)<9 and cellpos(1) > 0 and cellpos(2)<11 and ((even(cellpos(0)) and odd(cellpos(1)) and odd(cellpos(2)) and (0,0,0,1)=0) or (odd(cellpos(0)) and even(cellpos(1)) and even(cellpos(2)) and (0,0,0,1)=1)) and ((0,0,1,0) + (1,0,1,0)+(0,-1,1,0)+(1,-1,1,0))> 0 and ((1,0,0,0)<21 or (0,-1,0,0)<21 or (1,-1,0,0)<21 or (1,0,1,0)<21 or (0,-1,1,0)<21 or (1,-1,1,0)<21 or (0,0,1,0)<21) }

rule : { (0,0,0,0 ) + (#macro(Value<-1,0,0,0>)+#macro(Value<0,1,0,0>)+ #macro(Value<-1,1,0,0>)+#macro(Value<-1,0,1,0>)+#macro(Value<0,1,1,0>)+ #macro(Value<-1,1,1,0>)+#macro(Value<0,0,1,0>))/( 8 - #macro(Threshhold<-1,0,0,0>)- #macro(Threshhold<0,1,0,0>)- #macro(Threshhold<-1,1,0,0>)- #macro(Threshhold<-1,0,1,0>)- #macro(Threshhold<0,1,1,0>)- #macro(Threshhold<-1,1,1,0>) - #macro(Threshhold<0,0,1,0>)) } 100 { (0,0,0,2) = 0 and cellpos(3)=0 and (0,0,0,0 )<21 and cellpos(0)>0 and cellpos(1) < 8  and cellpos(2)<11 and ((odd(cellpos(0)) and even(cellpos(1)) and odd(cellpos(2)) and (0,0,0,1)=0) or (even(cellpos(0)) and odd(cellpos(1)) and even(cellpos(2)) and (0,0,0,1)=1)) and ((0,0,0,0 ) + (-1,0,0,0)+(0,1,0,0)+(-1,1,0,0))> 0 and ((0,0,1,0 ) + (-1,0,1,0)+(0,1,1,0)+(-1,1,1,0))> 0 and ((-1,0,0,0)>=21 or (0,1,0,0)>=21 or (-1,1,0,0)>=21 or (-1,0,1,0)>=21 or (0,1,1,0)>=21 or (-1,1,1,0)>=21 or (0,0,1,0)>=21)}
 

rule : { (0,0,0,0 )*0.7 } 100 {(0,0,0,2) = 0 and cellpos(3)=0 and (0,0,0,0 )>=21 and cellpos(0)>0 and cellpos(1) < 8  and cellpos(2)<11 and ((odd(cellpos(0)) and even(cellpos(1)) and odd(cellpos(2)) and (0,0,0,1)=0) or (even(cellpos(0)) and odd(cellpos(1)) and even(cellpos(2)) and (0,0,0,1)=1)) and ((0,0,1,0) + (-1,0,1,0)+(0,1,1,0)+(-1,1,1,0))> 0  and ((-1,0,0,0)<21 or (0,1,0,0)<21 or (-1,1,1,0)<21 or (-1,0,1,0)<21 or (0,1,1,0)<21 or (-1,1,1,0)<21 or (0,0,1,0)<21)}

rule : { (0,0,0,0 ) +(#macro(Value<-1,0,0,0>)+#macro(Value<-1,-1,0,0>)+ #macro(Value<0,-1,0,0>)+#macro(Value<-1,0,1,0>)+#macro(Value<-1,-1,1,0>)+ #macro(Value<0,-1,1,0>)+#macro(Value<0,0,1,0>))/( 8 - #macro(Threshhold<-1,0,0,0>)- #macro(Threshhold<-1,-1,0,0>)- #macro(Threshhold<0,-1,0,0>)- #macro(Threshhold<-1,0,1,0>)- #macro(Threshhold<-1,-1,1,0>)- #macro(Threshhold<0,-1,1,0>)- #macro(Threshhold<0,0,1,0>))} 100 { (0,0,0,2) = 0 and  cellpos(3)=0 and (0,0,0,0 )<21 and cellpos(0)>0 and cellpos(1) >0  and cellpos(2)<11 and ((odd(cellpos(0)) and odd(cellpos(1)) and odd(cellpos(2)) and (0,0,0,1)=0) or (even(cellpos(0)) and even(cellpos(1)) and even(cellpos(2)) and (0,0,0,1)=1)) and ((0,0,0,0 ) + (-1,0,0,0)+(0,-1,0,0)+(-1,-1,0,0))> 0 and ((0,0,1,0 ) + (-1,0,1,0)+(0,-1,1,0)+(-1,-1,1,0))> 0 and ((-1,0,0,0)>=21 or (-1,-1,0,0)>=21 or (0,-1,0,0)>=21 or (-1,0,1,0)>=21 or (-1,-1,1,0)>=21 or (0,-1,1,0)>=21 or (0,0,1,0)>=21) }


rule : { (0,0,0,0 )*0.7 } 100 { (0,0,0,2) = 0 and cellpos(3)=0 and (0,0,0,0 )>=21 and cellpos(0)>0 and cellpos(1) >0 and cellpos(2)<11 and ((odd(cellpos(0)) and odd(cellpos(1)) and odd(cellpos(2)) and (0,0,0,1)=0) or (even(cellpos(0)) and even(cellpos(1)) and even(cellpos(2)) and (0,0,0,1)=1)) and ((0,0,1,0) + (-1,0,1,0)+(0,-1,1,0)+(-1,-1,1,0))> 0 and ((-1,0,0,0)<21 or (-1,-1,0,0)<21 or (0,-1,0,0)<21 or (-1,0,1,0)<21 or (-1,-1,1,0)<21 or (0,-1,1,0)<21 or (0,0,1,0)<21)}


%plate moving
rule : {(0,0,0,0 )+(0,0,1,0)} 100 {(0,0,0,2) = 1 and cellpos(3)=0 and cellpos(0)>0 and cellpos(0)<9 and cellpos(1)>0 and cellpos(1)<8 and cellpos(2) < 10 and ((-1,-1,2,0)+(-1,0,2,0)+(-1,1,2,0)+(0,-1,2,0)+(0,0,2,0) +(0,1,2,0)+(1,-1,2,0) +(1,0,2,0)+(1,1,2,0))=0 and ((-1,-1,1,0)+(-1,0,1,0)+(-1,1,1,0)+(0,-1,1,0)+(0,0,1,0) +(0,1,1,0)+(1,-1,1,0) +(1,0,1,0)+(1,1,1,0))>0 }  %step 1: add the first row to the second row
rule : 0 100 {(0,0,0,2) = 1 and cellpos(3)=0 and cellpos(0)>0 and cellpos(0)<9 and cellpos(1)>0 and cellpos(1)<8 and cellpos(0) < 11 and ((-1,-1,1,0)+(-1,0,1,0)+(-1,1,1,0)+(0,-1,1,0)+(0,0,1,0) +(0,1,1,0)+(1,-1,1,0) +(1,0,1,0)+(1,1,1,0))=0 and ((-1,-1,0,0)+(-1,0,0,0)+(-1,1,0,0)+(0,-1,0,0)+(0,0,0,0) +(0,1,0,0)+(1,-1,0,0) +(1,0,0,0)+(1,1,0,0))>0}   %step2 :change the first row to 0

rule : 1 100 { (0,0,0,1) = 0 and cellpos(3)=1 and (0,0,0,0 )=0 }
rule : 0 100 { (0,0,0,1) = 0 and cellpos(3)=1 and (0,0,0,0 )=1}   %alternate the margolus neighborhood

rule : 1 3000 { cellpos(3)=2 and (0,0,0,0 )=0 }
rule : 0 100 {cellpos(3)=2 and (0,0,0,0 )=1}   %plate moving

rule : { (0,0,0,0 ) } 100 { t }
