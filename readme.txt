This file is to instruct you how to run the model and validate the results for the package 
of the course 94587' final project. It also includes the list of the file.


List of files:
plastic.ma  	the model definition file
plastic.inc       Marcro definition file
plastic.val     	Initial value to run the model
execute.bat     	Batch file to simulate the model with inital values

plastic.log       Run the file execute, you can get the log file

drawlog.bat     	batch file to generate .drw file by drawlog with original version
plasticorg.drw    output of draw from plastic.log by drawlog with orginal version

ThreeDplastic.jpr	the project file of the tool which remove the celles on plane1 
			and plane2. (for JavaBuilder 3.0)
GetData.java	the class file of the tool which remove the celles on plane1 
			and plane2, choose plasticorg.drw as source
plasticnew.drw	output of the tool which remove the celles on plane1 
			and plane2. It can be used for validation on the mass of object.

remdim.bat(*)     batch file to take .log file plastic.log as its input and create a 
			separate log file for each plane 
plastic0.log
plastic1.log
plastic2.log	all the .log file for each plane generated by remdim.bat
drawlog1.bat(*)   batch file to generate .drw file from plastic0.log for plane 0 by 
			drawlog with upgraded version
plastic.drw     	output of draw from plastic0.log for plane 0 by drawlog with upgraded version

Runplastic.bat(*)	batch file to run Graflog provided by professor wainer together with color 
			table file, which can provide the 3D view for the plastic.drw file
3Dplastic.pal	the color table file which support Graflog

3DFreeFormProject.doc	the report documentation in word format
3DFreeFormProject.ps	the report documentation in postscript format

(*) this two batch files is supported by the tool provided by Professor Wainer and developed by
Toqeer A Israr and Joseph Gammal
(**) need the 3D viewer tool Graflog provided by Professor Wainer


To run the model:

Reconfigure execute.bat (set the simulator path) and run it in Cygwin, you can get plastic.log file and plastic.out files

Validating policy:
(validation on the total mass of the object)
1. reconfigure drawlog.bat (set the drawlog path) and run it, you can get plasticorg.drw.
2. open the java project ThreeDplastic.jpr and run GetData.java.
3. This tool will choose plasticorg.drw as source and remove all cells on the plane 1 and 2.
   it will generate plasticnew.drw.
4. Open it by Microsoft Excel and add up all the values of cells for each time. All summary for each time are same. 
   So we can get that the total mass of object is conserved

(validation on the behavior for the deformation of the object)
1. reconfigure remdim.bat (set the remdim path)and run it, you can get plastic0.log, plastic1.log and 
   plastic2.log for each plane.
2. reconfigure drawlog1.bat (set the drawlog path) and run it, you can get plastic.drw.
3. Check each cell and its neighborhood and validate whether the transition follows the rule defined in the paper.
4. reconfigure Runplastic.bat together with Graflog, validate the behaviour of deformation in 3D view



