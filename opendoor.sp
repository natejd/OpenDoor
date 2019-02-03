#pragma semicolon 1

#include <sdktools>

#pragma newdecls required

public Plugin myinfo = 
{
	name = "Open Door",
	author = "natejd",
	description = "Open's all doors on the map and keeps them open.",
	version = "0.1",
	url = ""
};

public void OnMapStart()
{
	CreateTimer(5.0, Timer_OpenDoor, TIMER_REPEAT);
}

public Action Timer_OpenDoor(Handle timer)
{
	int ent = -1;
	int var1 = FindEntityByClassname(ent, "func_door_rotating");
	ent = var1;
	while (var1 != -1)
	{
		DispatchKeyValue(ent, "spawnpos", "1");
		DispatchKeyValue(ent, "spawnflags", "1");
		DispatchKeyValue(ent, "wait", "-1");
		AcceptEntityInput(ent, "Open");
		AcceptEntityInput(ent, "Lock");
	}
}