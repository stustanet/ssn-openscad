/**
 * 2018-2018 Johannes Walcher
 * 
 * StuStaNet common tools
 */

module stustanet_logo(height=1) {
	translate([-20, -4, 0])
	linear_extrude(height=height, convexity=100)
	//import(file="files/StuStaNet_Logo.dxf");
	import(scale=0.16, file="files/logo.dxf");
}
