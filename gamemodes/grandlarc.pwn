//----------------------------------------------------------
//
//  GRAND LARCENY  1.0
//  A freeroam gamemode for SA-MP 0.3
//
//----------------------------------------------------------

#include <a_samp>
#include <core>
#include <float>
#include "../include/gl_common.inc"
#include "../include/gl_spawns.inc"
#include <streamer>
#include <zcmd>
#include <sscanf2>


#pragma tabsize 0

//----------------------------------------------------------

#define COLOR_WHITE 		0xFFFFFFFF
#define COLOR_NORMAL_PLAYER 0xFFBB7777

#define CITY_LOS_SANTOS 	0
#define CITY_SAN_FIERRO 	1
#define CITY_LAS_VENTURAS 	2

new total_vehicles_from_files=0;

// Class selection globals
new gPlayerCitySelection[MAX_PLAYERS];
new gPlayerHasCitySelected[MAX_PLAYERS];
new gPlayerLastCitySelectionTick[MAX_PLAYERS];

new Text:txtClassSelHelper;
new Text:txtLosSantos;
new Text:txtSanFierro;
new Text:txtLasVenturas;

//new thisanimid=0;
//new lastanimid=0;

//----------------------------------------------------------


// ---------------------------------------------------------
// --------------------/* CUSTOM FUNCTION DECLARATIONS */ --------------

public SetVehSpawn(modelid, Float:x, Float:y, Float:z, Float:angle, color1, color2, comments[]);

public WriteVehSpawn(modelid, Float:x, Float:y, Float:z, Float:angle, color1, color2, comments[]);

// ---------------------------------------------------------

main()
{
	print("\n---------------------------------------");
	print("Script Testing - by the [Lsrcr]Wajeeh\n");
	print("---------------------------------------\n");
}

//----------------------------------------------------------

public OnPlayerConnect(playerid)
{
	GameTextForPlayer(playerid,"~w~Script Testing Server",3000,4);
  	SendClientMessage(playerid,COLOR_WHITE,"Welcome to {88AA88}G{FFFFFF}rand {88AA88}L{FFFFFF}arceny");
  	
  	// class selection init vars
  	gPlayerCitySelection[playerid] = -1;
	gPlayerHasCitySelected[playerid] = 0;
	gPlayerLastCitySelectionTick[playerid] = GetTickCount();

	//SetPlayerColor(playerid,COLOR_NORMAL_PLAYER);

	/*
	Removes vending machines
	RemoveBuildingForPlayer(playerid, 1302, 0.0, 0.0, 0.0, 6000.0);
	RemoveBuildingForPlayer(playerid, 1209, 0.0, 0.0, 0.0, 6000.0);
	RemoveBuildingForPlayer(playerid, 955, 0.0, 0.0, 0.0, 6000.0);
	RemoveBuildingForPlayer(playerid, 1775, 0.0, 0.0, 0.0, 6000.0);
	RemoveBuildingForPlayer(playerid, 1776, 0.0, 0.0, 0.0, 6000.0);
	*/
	
	/*
	new ClientVersion[32];
	GetPlayerVersion(playerid, ClientVersion, 32);
	printf("Player %d reports client version: %s", playerid, ClientVersion);*/

 	return 1;
}

//----------------------------------------------------------

public OnPlayerCommandText(playerid, cmdtext[])
{
     if(!strcmp(cmdtext, "/staff"))
     {
        new sendername[MAX_PLAYER_NAME];
		new string[64 + MAX_PLAYER_NAME];
		for(new i=0; i < MAX_PLAYERS; ++i)
		{
		    if(IsPlayerConnected(i))
		    {
		        if(IsPlayerAdmin(i))
		        {
		            GetPlayerName(i, sendername, sizeof(sendername));
		            format(string, 100, "Online Admins : %i, %s", IsPlayerAdmin(i), sendername);
		            SendClientMessage(playerid, 0x00FF00FF, string);
		        }
		    }
		}
		return 1;
     }
     return 0;
}

// ------------------------- /* Z COMMANDS */ ------------------------------------------

CMD:healme(playerid, params[])
{
	SetPlayerHealth(playerid, 100.0);
	return SendClientMessage(playerid, 0x00B40404, "You have been healed");
}

CMD:set(playerid, params[])
{
	new command[30], message[100], id, Float:value;
    if (!IsPlayerAdmin(playerid))
		return SendClientMessage(playerid, 0xFF0000AA, "Permission Denied!");
	else
	{
	    if (isnull(params))
	    {
	        format(message, sizeof(message), "Usage : {B40404}/set {FF0000}(armour)");
		    return SendClientMessage(playerid,0xFFFFFFFF, message);
	    }
	    else
		{
	   		sscanf(params, "s[29]rf", command, id, value);
			if(!strcmp(command, "armour"))
			{
			    if (id == INVALID_PLAYER_ID)
			    {
			        format(message, sizeof(message), "Error! {FFFFFF}Invalid player id");
					return SendClientMessage(playerid, 0x00FF0000, message);
			    }
			    else
			    if (value<0 || value>100)
			    {
			        format(message, sizeof(message), "Armour value should be between {FF0000}0 {FFFFFF}and {FF0000}100");
					return SendClientMessage(playerid, 0x00B40404, message);
			    }
			    else
			    {
			        SetPlayerArmour(id, value);
			        new idName[30];
					GetPlayerName(id, idName, 29);
			        format(message, sizeof(message),"%.0f {FFFFFF}Armour given to %s{FF0000}[%d]", value, idName, id);
			        SendClientMessage(playerid, 0x00FF0000, message);
			        format(message, sizeof(message),"Your armour is set to {FF0000}%.0f", value);
			        return SendClientMessage(id, 0xFFFFFFFF, message);
			    }
			}
			else
			    return SendClientMessage(playerid, 0xFFFFFFFF, "command not set yet");
		}
	}
}

CMD:fixme(playerid, params[])
{
	if(!IsPlayerInAnyVehicle(playerid))
	return SendClientMessage(playerid, 0xFF0000AA, "Error! not in any vehicle");
	SetVehicleHealth(GetPlayerVehicleID(playerid),999.00);
	return SendClientMessage(playerid, 0x00B40404, "Vehicle Fixed!");
}

CMD:vspawn(playerid, params[])
{
 if (!IsPlayerAdmin(playerid))
	return SendClientMessage(playerid, 0xFF0000AA, "Permission Denied!");
	else
	{
	    new string[100],color1=0,color2=1,Float:A,Float:X,Float:Y,Float:Z;
	    new vehID;
	    if (isnull(params))
	    {
		    return SendClientMessage(playerid,0xFFFFFFFF, "Usage : {B40404}/vspawn {FF0000}VehicleID{FFFFFF} color1 color2");
	    }
	    else
	    {
			sscanf(params, "iii", vehID, color1, color2);
            if(vehID < 400 || vehID > 611)
			{
				format(string, sizeof(string),"{FF0000}>> [ERROR]: {FFFFFF}ID vehicle can not be below 400 or over 611!");
				SendClientMessage(playerid, 0xFFFFFFFF, string);
				return 1;
			}
			else
			if (color1 < -1 || color1 > 255 || color2 < -2 || color2 > 255)
			{
			    format(string, sizeof(string), "{FF0000}Error! {FFFFFF}color id's must be in between 0 and 255");
			    SendClientMessage(playerid, 0xFFFFFF, string);
			    return 1;
			}
			else
			{
		        GetPlayerPos(playerid, X,Y,Z);
		        GetPlayerFacingAngle(playerid, A);
			    new carid = CreateVehicle(vehID, X,Y,Z,A,color1,color2,0);
			    PutPlayerInVehicle(playerid, carid, 0);
			    return SendClientMessage(playerid, 0x00B40404, "Vehicle spawned");
		    }
	    }
	}
}

CMD:reset(playerid, params[])
{
   	new id, command[20], message[100];
	if (!IsPlayerAdmin(playerid))
		return SendClientMessage(playerid, 0xFF0000AA, "Permission Denied!");
	else
	{
		sscanf(params, "s[19]i", command, id);
	     if(!strcmp(command, "vehicle"))
		{
		    if ( id == 0)
		    {
		        format (message, sizeof(message), "{B40404}Usage: {FFFFFF}/reset vehicle {FF0000}id");
		        return SendClientMessage(playerid, 0x00B40404, message);
		    }
		    if ( IsVehicleStreamedIn(id,playerid) )
		    {
				DestroyVehicle(id);
				format(message, sizeof(message), "{B40404}You have destroyed vehicle #%d", id);
				SendClientMessage(playerid, 0x00B40404, message);
				return 1;
			}
			else
			{
			    format(message, sizeof(message), "{FF0000}Error!{FFFFFF} Vehicle {FF0000}#%d {FFFFFF} not found", id);
			    return SendClientMessage(playerid, 0x00B40404, message);
			}
		}
		else
		{
		    format(message, sizeof(message), "{FF0000}Error! {FFFFFF}command {B40404}%s {FFFFFF}not found", command);
		    return SendClientMessage(playerid, 0x00B40404, message);
		}
	}
}

CMD:gc(playerid, params[])
{
	new receiverID, money, message[100];
	if(isnull(params))
	{
	    format(message, sizeof(message), "{FF0000}Usage: {FFFFFF}/gc id amount");
		return SendClientMessage(playerid, 0xFF0000AA, message);
	}
	else
	{
	    sscanf(params, "ii", receiverID, money);
	    if (receiverID == INVALID_PLAYER_ID)
	    {
	        format(message, sizeof(message), "{FF0000}Error! {FFFFFF}Invalid player id");
			return SendClientMessage(playerid, 0xFF0000AA, message);
		}
		else
		if ( GetPlayerMoney(playerid) < money )
		{
		    format(message, sizeof(message), "{FF0000}Error! {FFFFFF}You don't have enough money");
		    return SendClientMessage(playerid, 0xFF0000AA, message);
		}
		else
		{
    	    new Float:X,Float:Y,Float:Z;
		    GetPlayerPos(playerid, X, Y, Z);
		    if (!IsPlayerInRangeOfPoint(receiverID, 100.0, X,Y,Z))
		    {
			    format(message, sizeof(message), "{FF0000}Error! {FFFFFF}Receiver is not close enough");
			    return SendClientMessage(playerid, 0xFF0000AA, message);
		    }
		    else
		    {
			    GivePlayerMoney(receiverID, money);
			    GivePlayerMoney(playerid, -money);
			    format(message, sizeof(message), "{B40404}$%d transfered to ID %d", money, receiverID);
			    SendClientMessage(playerid, 0x00B40404, message);
   			    format(message, sizeof(message), "{B40404}ID. %d has transfered you $%d", playerid, money);
			    SendClientMessage(receiverID, 0x00B40404, message);
			    return 1;
		    }
		}
	}
}

CMD:get(playerid, params[])
{
	new command[30], Float:X, Float:Y, Float:Z, Float:A, message[300];
	if (!IsPlayerAdmin(playerid))
		return SendClientMessage(playerid, 0xFF0000AA, "Permission Denied!");
	else
	if (isnull(params))
	{
	    format(message, sizeof(message), "Usage: {FFFFFF}/get (angle/vehpos)");
		return SendClientMessage(playerid, 0x00FF0000, message);
	}
	else
	{
		sscanf(params, "s[29]", command);
	    if(!strcmp(command, "angle"))
	    {
			GetPlayerFacingAngle(playerid, A);
	    	format(message, sizeof(message), "Current Angle : {FFFFFF}%f", A);
	    	return SendClientMessage(playerid, 0x00B40404, message);
	    }
	    else
	    if(!strcmp(command, "vehpos"))
	    {
			GetVehicleZAngle(GetPlayerVehicleID(playerid), A);
		    GetVehiclePos(GetPlayerVehicleID(playerid), X, Y, Z);
	    	format(message, sizeof(message), "X : %f, Y : %f, Z : %f, A : %f", X,Y,Z,A);
	    	return SendClientMessage(playerid, 0x00B40404, message);
	    }
	    else
	    {
	    format(message, sizeof(message), "%s {FFFFFF}is not defined yet", command);
	    return SendClientMessage(playerid, 0x00FF0000, message);
	    }
	}
}

CMD:vspawnd(playerid, params[])
{
    if (!IsPlayerAdmin(playerid))
		return SendClientMessage(playerid, 0xFF0000AA, "Permission Denied!");
	else
	{
        new id, Float:x, Float:y, Float:z, Float:a, color1, color2, comments[50], returnID;
		if (isnull(params))
		{
			return SendClientMessage(playerid, 0x00FF0000, "Usage : {FFFFFF}vspawnd vehicleid xVal yVal zVal aVal colorid1 colorid2 comments");
		}
		else
		{

			sscanf(params, "iffffiis[49]", id, x, y, z, a, color1, color2, comments);
			returnID = SetVehSpawn(id, x, y, z, a, color1, color2,comments);
			if (returnID == 65535)
			{
				return SendClientMessage(playerid, 0x00FF00AA, "Couldn't create a vehicle");
			}
			else
			{
			   	PutPlayerInVehicle(playerid, returnID, 0);
				SendClientMessage(playerid, 0x00B40404, "Vehicle created");
						/*WRITE IN CUSTOM.txt*/
				WriteVehSpawn(id, x, y, z, a, color1, color2, comments);
				return 1;
			}
		}
	}
}

CMD:tp(playerid, params[])
{
	new message[100];
    if (!IsPlayerAdmin(playerid))
		return SendClientMessage(playerid, 0xFF0000AA, "You cannot teleport!");
	else
	{
	    if ( isnull(params) )
	    {
	    	format(message, sizeof(message), "Usage : {FFFFFF}/tp tocar id");
	    	return SendClientMessage(playerid,0x00B40404, message);
	    }
	    
	    new command[100], carID;
	    sscanf(params, "s[99]i", command, carID);
	    if ( !strcmp(command, "tocar") )
	    {
		    if (carID < 1 || carID > 65534)
		    {
		    	format(message, sizeof(message), "Usage : {FFFFFF}Invalid car ID");
		    	return SendClientMessage(playerid,0x00FF0000, message);
		    }
		    else
		    {
		        new Float:X, Float:Y, Float:Z;
		        GetVehiclePos(carID, X, Y, Z);
				SetPlayerPos(playerid, X, Y, Z+3);
		    	format(message, sizeof(message), "Teleported to car ID {FF0000}%d", carID);
		    	return SendClientMessage(playerid,0x00FF0000, message);
		    }
	    }
	    else
	    {
	    	format(message, sizeof(message), "No such command exits");
	    	return SendClientMessage(playerid,-1, message);
    	}
	}
}

CMD:cmds(playerid, params[])
{
 new message[200];
	if (IsPlayerAdmin(playerid))
	{
	    format(message, sizeof(message), "Commands : {FFFFFF}/staff, /healme, /fixme, /set armour, /vspawn, /vspawnd, /reset vehicle, /gc get (angle/vehpos)");
		return SendClientMessage(playerid, 0x00FF0000, message);
	}
	else
	{
	    format(message, sizeof(message), "Commands : {FFFFFF}/staff, /healme, /fixme, /gc");
		return SendClientMessage(playerid, 0x00FF0000, message);
	}
}


// ------------------------- /* Z COMMANDS */ ------------------------------------------
										
										
// ------------------------- /* CUSTOM FUNCTIONS */ ------------------------------------

public SetVehSpawn(modelid, Float:x, Float:y, Float:z, Float:angle, color1, color2, comments[])
{
	new vehID;
	vehID = CreateVehicle(modelid, x, y, z, angle, color1, color2, -1, 0);
	return vehID;
}

public WriteVehSpawn(modelid, Float:x, Float:y, Float:z, Float:angle, color1, color2, comments[])
{

	new string[100], fileLoc[30];
	format(fileLoc, sizeof(fileLoc), "vehicles/custom.txt");
	new File:pos=fopen(fileLoc, io_append);
	format(string, sizeof(string), "%i,%f,%f,%f,%f,%i,%i ; %s\r\n", modelid, x, y, z, angle, color1, color2, comments);
	fwrite(pos, string);
	fclose(pos);
	return 1;
	
}

// ------------------------- /* CUSTOM FUNCTIONS */ ------------------------------------
										


public OnPlayerSpawn(playerid)
{
	if(IsPlayerNPC(playerid)) return 1;
	
	new randSpawn = 0;
	
	SetPlayerInterior(playerid,0);
	TogglePlayerClock(playerid,0);
 	ResetPlayerMoney(playerid);
	GivePlayerMoney(playerid, 30000);

	if(CITY_LOS_SANTOS == gPlayerCitySelection[playerid]) {
 	    randSpawn = random(sizeof(gRandomSpawns_LosSantos));
 	    SetPlayerPos(playerid,
		 gRandomSpawns_LosSantos[randSpawn][0],
		 gRandomSpawns_LosSantos[randSpawn][1],
		 gRandomSpawns_LosSantos[randSpawn][2]);
		SetPlayerFacingAngle(playerid,gRandomSpawns_LosSantos[randSpawn][3]);
	}
	else if(CITY_SAN_FIERRO == gPlayerCitySelection[playerid]) {
 	    randSpawn = random(sizeof(gRandomSpawns_SanFierro));
 	    SetPlayerPos(playerid,
		 gRandomSpawns_SanFierro[randSpawn][0],
		 gRandomSpawns_SanFierro[randSpawn][1],
		 gRandomSpawns_SanFierro[randSpawn][2]);
		SetPlayerFacingAngle(playerid,gRandomSpawns_SanFierro[randSpawn][3]);
	}
	else if(CITY_LAS_VENTURAS == gPlayerCitySelection[playerid]) {
 	    randSpawn = random(sizeof(gRandomSpawns_LasVenturas));
 	    SetPlayerPos(playerid,
		 gRandomSpawns_LasVenturas[randSpawn][0],
		 gRandomSpawns_LasVenturas[randSpawn][1],
		 gRandomSpawns_LasVenturas[randSpawn][2]);
		SetPlayerFacingAngle(playerid,gRandomSpawns_LasVenturas[randSpawn][3]);
	}

	//SetPlayerColor(playerid,COLOR_NORMAL_PLAYER);
	
	/*
	SetPlayerSkillLevel(playerid,WEAPONSKILL_PISTOL,200);
    SetPlayerSkillLevel(playerid,WEAPONSKILL_PISTOL_SILENCED,200);
    SetPlayerSkillLevel(playerid,WEAPONSKILL_DESERT_EAGLE,200);
    SetPlayerSkillLevel(playerid,WEAPONSKILL_SHOTGUN,200);
    SetPlayerSkillLevel(playerid,WEAPONSKILL_SAWNOFF_SHOTGUN,200);
    SetPlayerSkillLevel(playerid,WEAPONSKILL_SPAS12_SHOTGUN,200);
    SetPlayerSkillLevel(playerid,WEAPONSKILL_MICRO_UZI,200);
    SetPlayerSkillLevel(playerid,WEAPONSKILL_MP5,200);
    SetPlayerSkillLevel(playerid,WEAPONSKILL_AK47,200);
    SetPlayerSkillLevel(playerid,WEAPONSKILL_M4,200);
    SetPlayerSkillLevel(playerid,WEAPONSKILL_SNIPERRIFLE,200);*/
    
    GivePlayerWeapon(playerid,WEAPON_COLT45,100);
	//GivePlayerWeapon(playerid,WEAPON_MP5,100);
	TogglePlayerClock(playerid, 0);

	return 1;
}

//----------------------------------------------------------

public OnPlayerDeath(playerid, killerid, reason)
{
    new playercash;
    
    // if they ever return to class selection make them city
	// select again first
	gPlayerHasCitySelected[playerid] = 0;
    
	if(killerid == INVALID_PLAYER_ID) {
        ResetPlayerMoney(playerid);
	} else {
		playercash = GetPlayerMoney(playerid);
		if(playercash > 0)  {
			GivePlayerMoney(killerid, playercash);
			ResetPlayerMoney(playerid);
		}
	}
   	return 1;
}

//----------------------------------------------------------

ClassSel_SetupCharSelection(playerid)
{
   	if(gPlayerCitySelection[playerid] == CITY_LOS_SANTOS) {
		SetPlayerInterior(playerid,11);
		SetPlayerPos(playerid,508.7362,-87.4335,998.9609);
		SetPlayerFacingAngle(playerid,0.0);
    	SetPlayerCameraPos(playerid,508.7362,-83.4335,998.9609);
		SetPlayerCameraLookAt(playerid,508.7362,-87.4335,998.9609);
	}
	else if(gPlayerCitySelection[playerid] == CITY_SAN_FIERRO) {
		SetPlayerInterior(playerid,3);
		SetPlayerPos(playerid,-2673.8381,1399.7424,918.3516);
		SetPlayerFacingAngle(playerid,181.0);
    	SetPlayerCameraPos(playerid,-2673.2776,1394.3859,918.3516);
		SetPlayerCameraLookAt(playerid,-2673.8381,1399.7424,918.3516);
	}
	else if(gPlayerCitySelection[playerid] == CITY_LAS_VENTURAS) {
		SetPlayerInterior(playerid,3);
		SetPlayerPos(playerid,349.0453,193.2271,1014.1797);
		SetPlayerFacingAngle(playerid,286.25);
    	SetPlayerCameraPos(playerid,352.9164,194.5702,1014.1875);
		SetPlayerCameraLookAt(playerid,349.0453,193.2271,1014.1797);
	}
	
}

//----------------------------------------------------------
// Used to init textdraws of city names

ClassSel_InitCityNameText(Text:txtInit)
{
  	TextDrawUseBox(txtInit, 0);
	TextDrawLetterSize(txtInit,1.25,3.0);
	TextDrawFont(txtInit, 0);
	TextDrawSetShadow(txtInit,0);
    TextDrawSetOutline(txtInit,1);
    TextDrawColor(txtInit,0xEEEEEEFF);
    TextDrawBackgroundColor(txtClassSelHelper,0x000000FF);
}

//----------------------------------------------------------

ClassSel_InitTextDraws()
{
    // Init our observer helper text display
	txtLosSantos = TextDrawCreate(10.0, 380.0, "Los Santos");
	ClassSel_InitCityNameText(txtLosSantos);
	txtSanFierro = TextDrawCreate(10.0, 380.0, "San Fierro");
	ClassSel_InitCityNameText(txtSanFierro);
	txtLasVenturas = TextDrawCreate(10.0, 380.0, "Las Venturas");
	ClassSel_InitCityNameText(txtLasVenturas);

    // Init our observer helper text display
	txtClassSelHelper = TextDrawCreate(10.0, 415.0,
	   " Press ~b~~k~~GO_LEFT~ ~w~or ~b~~k~~GO_RIGHT~ ~w~to switch cities.~n~ Press ~r~~k~~PED_FIREWEAPON~ ~w~to select.");
	TextDrawUseBox(txtClassSelHelper, 1);
	TextDrawBoxColor(txtClassSelHelper,0x222222BB);
	TextDrawLetterSize(txtClassSelHelper,0.3,1.0);
	TextDrawTextSize(txtClassSelHelper,400.0,40.0);
	TextDrawFont(txtClassSelHelper, 2);
	TextDrawSetShadow(txtClassSelHelper,0);
    TextDrawSetOutline(txtClassSelHelper,1);
    TextDrawBackgroundColor(txtClassSelHelper,0x000000FF);
    TextDrawColor(txtClassSelHelper,0xFFFFFFFF);
}

//----------------------------------------------------------

ClassSel_SetupSelectedCity(playerid)
{
	if(gPlayerCitySelection[playerid] == -1) {
		gPlayerCitySelection[playerid] = CITY_LOS_SANTOS;
	}
	
	if(gPlayerCitySelection[playerid] == CITY_LOS_SANTOS) {
		SetPlayerInterior(playerid,0);
   		SetPlayerCameraPos(playerid,1630.6136,-2286.0298,110.0);
		SetPlayerCameraLookAt(playerid,1887.6034,-1682.1442,47.6167);
		
		TextDrawShowForPlayer(playerid,txtLosSantos);
		TextDrawHideForPlayer(playerid,txtSanFierro);
		TextDrawHideForPlayer(playerid,txtLasVenturas);
	}
	else if(gPlayerCitySelection[playerid] == CITY_SAN_FIERRO) {
		SetPlayerInterior(playerid,0);
   		SetPlayerCameraPos(playerid,-1300.8754,68.0546,129.4823);
		SetPlayerCameraLookAt(playerid,-1817.9412,769.3878,132.6589);
		
		TextDrawHideForPlayer(playerid,txtLosSantos);
		TextDrawShowForPlayer(playerid,txtSanFierro);
		TextDrawHideForPlayer(playerid,txtLasVenturas);
	}
	else if(gPlayerCitySelection[playerid] == CITY_LAS_VENTURAS) {
		SetPlayerInterior(playerid,0);
   		SetPlayerCameraPos(playerid,1310.6155,1675.9182,110.7390);
		SetPlayerCameraLookAt(playerid,2285.2944,1919.3756,68.2275);
		
		TextDrawHideForPlayer(playerid,txtLosSantos);
		TextDrawHideForPlayer(playerid,txtSanFierro);
		TextDrawShowForPlayer(playerid,txtLasVenturas);
	}
}

//----------------------------------------------------------

ClassSel_SwitchToNextCity(playerid)
{
    gPlayerCitySelection[playerid]++;
	if(gPlayerCitySelection[playerid] > CITY_LAS_VENTURAS) {
	    gPlayerCitySelection[playerid] = CITY_LOS_SANTOS;
	}
	PlayerPlaySound(playerid,1052,0.0,0.0,0.0);
	gPlayerLastCitySelectionTick[playerid] = GetTickCount();
	ClassSel_SetupSelectedCity(playerid);
}

//----------------------------------------------------------

ClassSel_SwitchToPreviousCity(playerid)
{
    gPlayerCitySelection[playerid]--;
	if(gPlayerCitySelection[playerid] < CITY_LOS_SANTOS) {
	    gPlayerCitySelection[playerid] = CITY_LAS_VENTURAS;
	}
	PlayerPlaySound(playerid,1053,0.0,0.0,0.0);
	gPlayerLastCitySelectionTick[playerid] = GetTickCount();
	ClassSel_SetupSelectedCity(playerid);
}

//----------------------------------------------------------

ClassSel_HandleCitySelection(playerid)
{
	new Keys,ud,lr;
    GetPlayerKeys(playerid,Keys,ud,lr);
    
    if(gPlayerCitySelection[playerid] == -1) {
		ClassSel_SwitchToNextCity(playerid);
		return;
	}

	// only allow new selection every ~500 ms
	if( (GetTickCount() - gPlayerLastCitySelectionTick[playerid]) < 500 ) return;
	
	if(Keys & KEY_FIRE) {
	    gPlayerHasCitySelected[playerid] = 1;
	    TextDrawHideForPlayer(playerid,txtClassSelHelper);
		TextDrawHideForPlayer(playerid,txtLosSantos);
		TextDrawHideForPlayer(playerid,txtSanFierro);
		TextDrawHideForPlayer(playerid,txtLasVenturas);
	    TogglePlayerSpectating(playerid,0);
	    return;
	}
	
	if(lr > 0) {
	   ClassSel_SwitchToNextCity(playerid);
	}
	else if(lr < 0) {
	   ClassSel_SwitchToPreviousCity(playerid);
	}
}

//----------------------------------------------------------

public OnPlayerRequestClass(playerid, classid)
{
	if(IsPlayerNPC(playerid)) return 1;

	if(gPlayerHasCitySelected[playerid]) {
		ClassSel_SetupCharSelection(playerid);
		return 1;
	} else {
		if(GetPlayerState(playerid) != PLAYER_STATE_SPECTATING) {
			TogglePlayerSpectating(playerid,1);
    		TextDrawShowForPlayer(playerid, txtClassSelHelper);
    		gPlayerCitySelection[playerid] = -1;
		}
  	}
    
	return 0;
}

//----------------------------------------------------------

public OnGameModeInit()
{
	SetGameModeText("SWAT Testing Server");
	ShowPlayerMarkers(PLAYER_MARKERS_MODE_GLOBAL);
	ShowNameTags(1);
	SetNameTagDrawDistance(40.0);
	EnableStuntBonusForAll(0);
	DisableInteriorEnterExits();
	SetWeather(2);
	SetWorldTime(11);
	
	//SetObjectsDefaultCameraCol(true);
	//UsePlayerPedAnims();
	//ManualVehicleEngineAndLights();
	//LimitGlobalChatRadius(300.0);
	
	ClassSel_InitTextDraws();

	// Player Class
	AddPlayerClass(298,1759.0189,-1898.1260,13.5622,266.4503,-1,-1,-1,-1,-1,-1);
	AddPlayerClass(299,1759.0189,-1898.1260,13.5622,266.4503,-1,-1,-1,-1,-1,-1);
	AddPlayerClass(300,1759.0189,-1898.1260,13.5622,266.4503,-1,-1,-1,-1,-1,-1);
	AddPlayerClass(301,1759.0189,-1898.1260,13.5622,266.4503,-1,-1,-1,-1,-1,-1);
	AddPlayerClass(302,1759.0189,-1898.1260,13.5622,266.4503,-1,-1,-1,-1,-1,-1);
	AddPlayerClass(303,1759.0189,-1898.1260,13.5622,266.4503,-1,-1,-1,-1,-1,-1);
	AddPlayerClass(304,1759.0189,-1898.1260,13.5622,266.4503,-1,-1,-1,-1,-1,-1);
	AddPlayerClass(305,1759.0189,-1898.1260,13.5622,266.4503,-1,-1,-1,-1,-1,-1);
	AddPlayerClass(280,1759.0189,-1898.1260,13.5622,266.4503,-1,-1,-1,-1,-1,-1);
	AddPlayerClass(281,1759.0189,-1898.1260,13.5622,266.4503,-1,-1,-1,-1,-1,-1);
	AddPlayerClass(282,1759.0189,-1898.1260,13.5622,266.4503,-1,-1,-1,-1,-1,-1);
	AddPlayerClass(283,1759.0189,-1898.1260,13.5622,266.4503,-1,-1,-1,-1,-1,-1);
	AddPlayerClass(284,1759.0189,-1898.1260,13.5622,266.4503,-1,-1,-1,-1,-1,-1);
	AddPlayerClass(285,1759.0189,-1898.1260,13.5622,266.4503,-1,-1,-1,-1,-1,-1);
	AddPlayerClass(286,1759.0189,-1898.1260,13.5622,266.4503,-1,-1,-1,-1,-1,-1);
	AddPlayerClass(287,1759.0189,-1898.1260,13.5622,266.4503,-1,-1,-1,-1,-1,-1);
	AddPlayerClass(288,1759.0189,-1898.1260,13.5622,266.4503,-1,-1,-1,-1,-1,-1);
	AddPlayerClass(289,1759.0189,-1898.1260,13.5622,266.4503,-1,-1,-1,-1,-1,-1);
	AddPlayerClass(265,1759.0189,-1898.1260,13.5622,266.4503,-1,-1,-1,-1,-1,-1);
	AddPlayerClass(266,1759.0189,-1898.1260,13.5622,266.4503,-1,-1,-1,-1,-1,-1);
	AddPlayerClass(267,1759.0189,-1898.1260,13.5622,266.4503,-1,-1,-1,-1,-1,-1);
	AddPlayerClass(268,1759.0189,-1898.1260,13.5622,266.4503,-1,-1,-1,-1,-1,-1);
	AddPlayerClass(269,1759.0189,-1898.1260,13.5622,266.4503,-1,-1,-1,-1,-1,-1);
	AddPlayerClass(270,1759.0189,-1898.1260,13.5622,266.4503,-1,-1,-1,-1,-1,-1);
	AddPlayerClass(1,1759.0189,-1898.1260,13.5622,266.4503,-1,-1,-1,-1,-1,-1);
	AddPlayerClass(2,1759.0189,-1898.1260,13.5622,266.4503,-1,-1,-1,-1,-1,-1);
	AddPlayerClass(3,1759.0189,-1898.1260,13.5622,266.4503,-1,-1,-1,-1,-1,-1);
	AddPlayerClass(4,1759.0189,-1898.1260,13.5622,266.4503,-1,-1,-1,-1,-1,-1);
	AddPlayerClass(5,1759.0189,-1898.1260,13.5622,266.4503,-1,-1,-1,-1,-1,-1);
	AddPlayerClass(6,1759.0189,-1898.1260,13.5622,266.4503,-1,-1,-1,-1,-1,-1);
	AddPlayerClass(8,1759.0189,-1898.1260,13.5622,266.4503,-1,-1,-1,-1,-1,-1);
	AddPlayerClass(42,1759.0189,-1898.1260,13.5622,266.4503,-1,-1,-1,-1,-1,-1);
	AddPlayerClass(65,1759.0189,-1898.1260,13.5622,266.4503,-1,-1,-1,-1,-1,-1);
	//AddPlayerClass(74,1759.0189,-1898.1260,13.5622,266.4503,-1,-1,-1,-1,-1,-1);
	AddPlayerClass(86,1759.0189,-1898.1260,13.5622,266.4503,-1,-1,-1,-1,-1,-1);
	AddPlayerClass(119,1759.0189,-1898.1260,13.5622,266.4503,-1,-1,-1,-1,-1,-1);
 	AddPlayerClass(149,1759.0189,-1898.1260,13.5622,266.4503,-1,-1,-1,-1,-1,-1);
	AddPlayerClass(208,1759.0189,-1898.1260,13.5622,266.4503,-1,-1,-1,-1,-1,-1);
	AddPlayerClass(273,1759.0189,-1898.1260,13.5622,266.4503,-1,-1,-1,-1,-1,-1);
	AddPlayerClass(289,1759.0189,-1898.1260,13.5622,266.4503,-1,-1,-1,-1,-1,-1);
	
	AddPlayerClass(47,1759.0189,-1898.1260,13.5622,266.4503,-1,-1,-1,-1,-1,-1);
	AddPlayerClass(48,1759.0189,-1898.1260,13.5622,266.4503,-1,-1,-1,-1,-1,-1);
	AddPlayerClass(49,1759.0189,-1898.1260,13.5622,266.4503,-1,-1,-1,-1,-1,-1);
	AddPlayerClass(50,1759.0189,-1898.1260,13.5622,266.4503,-1,-1,-1,-1,-1,-1);
	AddPlayerClass(51,1759.0189,-1898.1260,13.5622,266.4503,-1,-1,-1,-1,-1,-1);
	AddPlayerClass(52,1759.0189,-1898.1260,13.5622,266.4503,-1,-1,-1,-1,-1,-1);
	AddPlayerClass(53,1759.0189,-1898.1260,13.5622,266.4503,-1,-1,-1,-1,-1,-1);
	AddPlayerClass(54,1759.0189,-1898.1260,13.5622,266.4503,-1,-1,-1,-1,-1,-1);
	AddPlayerClass(55,1759.0189,-1898.1260,13.5622,266.4503,-1,-1,-1,-1,-1,-1);
	AddPlayerClass(56,1759.0189,-1898.1260,13.5622,266.4503,-1,-1,-1,-1,-1,-1);
	AddPlayerClass(57,1759.0189,-1898.1260,13.5622,266.4503,-1,-1,-1,-1,-1,-1);
	AddPlayerClass(58,1759.0189,-1898.1260,13.5622,266.4503,-1,-1,-1,-1,-1,-1);
   	AddPlayerClass(68,1759.0189,-1898.1260,13.5622,266.4503,-1,-1,-1,-1,-1,-1);
	AddPlayerClass(69,1759.0189,-1898.1260,13.5622,266.4503,-1,-1,-1,-1,-1,-1);
	AddPlayerClass(70,1759.0189,-1898.1260,13.5622,266.4503,-1,-1,-1,-1,-1,-1);
	AddPlayerClass(71,1759.0189,-1898.1260,13.5622,266.4503,-1,-1,-1,-1,-1,-1);
	AddPlayerClass(72,1759.0189,-1898.1260,13.5622,266.4503,-1,-1,-1,-1,-1,-1);
	AddPlayerClass(73,1759.0189,-1898.1260,13.5622,266.4503,-1,-1,-1,-1,-1,-1);
	AddPlayerClass(75,1759.0189,-1898.1260,13.5622,266.4503,-1,-1,-1,-1,-1,-1);
	AddPlayerClass(76,1759.0189,-1898.1260,13.5622,266.4503,-1,-1,-1,-1,-1,-1);
	AddPlayerClass(78,1759.0189,-1898.1260,13.5622,266.4503,-1,-1,-1,-1,-1,-1);
	AddPlayerClass(79,1759.0189,-1898.1260,13.5622,266.4503,-1,-1,-1,-1,-1,-1);
	AddPlayerClass(80,1759.0189,-1898.1260,13.5622,266.4503,-1,-1,-1,-1,-1,-1);
	AddPlayerClass(81,1759.0189,-1898.1260,13.5622,266.4503,-1,-1,-1,-1,-1,-1);
	AddPlayerClass(82,1759.0189,-1898.1260,13.5622,266.4503,-1,-1,-1,-1,-1,-1);
	AddPlayerClass(83,1759.0189,-1898.1260,13.5622,266.4503,-1,-1,-1,-1,-1,-1);
	AddPlayerClass(84,1759.0189,-1898.1260,13.5622,266.4503,-1,-1,-1,-1,-1,-1);
	AddPlayerClass(85,1759.0189,-1898.1260,13.5622,266.4503,-1,-1,-1,-1,-1,-1);
	AddPlayerClass(87,1759.0189,-1898.1260,13.5622,266.4503,-1,-1,-1,-1,-1,-1);
	AddPlayerClass(88,1759.0189,-1898.1260,13.5622,266.4503,-1,-1,-1,-1,-1,-1);
	AddPlayerClass(89,1759.0189,-1898.1260,13.5622,266.4503,-1,-1,-1,-1,-1,-1);
	AddPlayerClass(91,1759.0189,-1898.1260,13.5622,266.4503,-1,-1,-1,-1,-1,-1);
	AddPlayerClass(92,1759.0189,-1898.1260,13.5622,266.4503,-1,-1,-1,-1,-1,-1);
	AddPlayerClass(93,1759.0189,-1898.1260,13.5622,266.4503,-1,-1,-1,-1,-1,-1);
	AddPlayerClass(95,1759.0189,-1898.1260,13.5622,266.4503,-1,-1,-1,-1,-1,-1);
	AddPlayerClass(96,1759.0189,-1898.1260,13.5622,266.4503,-1,-1,-1,-1,-1,-1);
	AddPlayerClass(97,1759.0189,-1898.1260,13.5622,266.4503,-1,-1,-1,-1,-1,-1);
	AddPlayerClass(98,1759.0189,-1898.1260,13.5622,266.4503,-1,-1,-1,-1,-1,-1);
	AddPlayerClass(99,1759.0189,-1898.1260,13.5622,266.4503,-1,-1,-1,-1,-1,-1);

	// SPECIAL
	total_vehicles_from_files += LoadStaticVehiclesFromFile("vehicles/trains.txt");
	total_vehicles_from_files += LoadStaticVehiclesFromFile("vehicles/pilots.txt");
	
    // CUSTOM
	total_vehicles_from_files += LoadStaticVehiclesFromFile("vehicles/custom.txt");

    printf("Total vehicles from files: %d",total_vehicles_from_files);

	return 1;
}

//----------------------------------------------------------

public OnPlayerUpdate(playerid)
{
	if(!IsPlayerConnected(playerid)) return 0;
	if(IsPlayerNPC(playerid)) return 1;

	// changing cities by inputs
	if( !gPlayerHasCitySelected[playerid] &&
	    GetPlayerState(playerid) == PLAYER_STATE_SPECTATING ) {
	    ClassSel_HandleCitySelection(playerid);
	    return 1;
	}
	
	// No weapons in interiors
	//if(GetPlayerInterior(playerid) != 0 && GetPlayerWeapon(playerid) != 0) {
	    //SetPlayerArmedWeapon(playerid,0); // fists
	    //return 0; // no syncing until they change their weapon
	//}
	
	// Don't allow minigun
	if(GetPlayerWeapon(playerid) == WEAPON_MINIGUN) {
	    Kick(playerid);
	    return 0;
	}
	
	/* No jetpacks allowed
	if(GetPlayerSpecialAction(playerid) == SPECIAL_ACTION_USEJETPACK) {
	    Kick(playerid);
	    return 0;
	}*/

	/* For testing animations
    new msg[128+1];
	new animlib[32+1];
	new animname[32+1];

	thisanimid = GetPlayerAnimationIndex(playerid);
	if(lastanimid != thisanimid)
	{
		GetAnimationName(thisanimid,animlib,32,animname,32);
		format(msg, 128, "anim(%d,%d): %s %s", lastanimid, thisanimid, animlib, animname);
		lastanimid = thisanimid;
		SendClientMessage(playerid, 0xFFFFFFFF, msg);
	}*/

	return 1;
}



//----------------------------------------------------------
