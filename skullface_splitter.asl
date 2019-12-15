state("skullface")
{
	uint level : "skullface.exe", 0x00804070, 0x4, 0x314, 0x1B4, 0x4, 0x104;
}

startup
{
	settings.Add("world1", true, "Start timer at World 1");
	settings.SetToolTip("world1", "Start timer from menu in World 1 (only begins on first level of world)");
	settings.Add("world2", false, "Start timer at World 2");
	settings.SetToolTip("world2", "Start timer from menu in World 2 (only begins on first level of world)");
	settings.Add("world3", false, "Start timer at World 3");
	settings.SetToolTip("world3", "Start timer from menu in World 3 (only begins on first level of world)");
}

init
{
	//what are these level numbers it's not that hard to count to 45
	vars.levelNums = new int[]{12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26,  //World 1
	                      27, 29, 32, 31, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43,  //World 2
						  44, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 45, 58, 59, 64}; //World 3
	vars.menu1 = 10;
	vars.menu2 = 30;
	vars.menu3 = 46;
	vars.worldSize = 15;
	
	vars.split = 0;
}

start
{
	if(current.level == vars.levelNums[0] && old.level == vars.menu1 && settings["world1"])
	{
		vars.split = 0;
		return true;
	}
	if(current.level == vars.levelNums[vars.worldSize] && old.level == vars.menu2 && settings["world2"])
	{
		vars.split = vars.worldSize;
		return true;
	}
	if(current.level == vars.levelNums[vars.worldSize * 2] && old.level == vars.menu3 && settings["world3"])
	{
		vars.split = vars.worldSize * 2;
		return true;
	}
}

reset
{
	if(current.level == vars.levelNums[0] && old.level == vars.menu1 && settings["world1"])
	{
		vars.split = 0;
		return true;
	}
	if(current.level == vars.levelNums[vars.worldSize] && old.level == vars.menu2 && settings["world2"])
	{
		vars.split = vars.worldSize;
		return true;
	}
	if(current.level == vars.levelNums[vars.worldSize * 2] && old.level == vars.menu3 && settings["world3"])
	{
		vars.split = vars.worldSize * 2;
		return true;
	}
}

split
{
	if(current.level == vars.levelNums[vars.split + 1] && old.level == vars.levelNums[vars.split])
	{
		vars.split++;
		return true;
	}
}