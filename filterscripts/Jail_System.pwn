#define FILTERSCRIPT

#include <a_samp>
#include <zcmd>

new Float:JailCellSpawns[][3] =
{
	{197.3941,162.4637,1003.0300},
	{194.3641,175.6378,1003.0234},
	{197.8117,174.2043,1003.0234}
};

forward UnJail(pId);

new InJail[MAX_PLAYERS];

public OnFilterScriptInit()
{
	print("\n--------------------------------------");
	print(" Jail System by: [T_S]DeStunter!");
	print("--------------------------------------\n");
	return 1;
}

public OnFilterScriptExit()
{
	return 1;
}
public OnPlayerSpawn(playerid)
{
	SetPlayerVirtualWorld(playerid, 0);
	SetPlayerInterior(playerid, 0);
	if(InJail[playerid] == 1)
	{
	    new rand = random(sizeof(JailCellSpawns));
		SetPlayerPos(playerid, JailCellSpawns[rand][0], JailCellSpawns[rand][1], JailCellSpawns[rand][2]);
		SendClientMessage(playerid, 0xFF0000AA, "Dieing Wont Evade You From Escaping Out Of Jail xD!");
		return 1;
	}
	return 1;
}
public OnPlayerConnect(playerid)
{
	InJail[playerid] = 0;
	return 1;
}

public OnPlayerDeath(playerid, killerid, reason)
{
	SetPlayerWantedLevel(playerid, GetPlayerWantedLevel(playerid)+1);
	return 1;
}

public OnPlayerCommandReceived(playerid, cmdtext[])
{
    if (InJail[playerid] == 1)
	{
        SendClientMessage(playerid, 0xFF0000AA, "Your Commands Have Ben Disabled While In Jail!");
		return 0;
	}
	return 1;
}


public UnJail(pId)
{
	SpawnPlayer(pId);
    SendClientMessage(pId, 0xFF0000AA, "You Have Ben Released From Jail!");
    InJail[pId] = 0;
	return 1;
}

COMMAND:tk(playerid,params[])
{
    new pId;
    new pskin = GetPlayerSkin(playerid);
	if(pskin == 265 || pskin == 266 || pskin == 267 || pskin == 280 || pskin == 281 || pskin == 284 || pskin == 285 || pskin == 286 || pskin == 287 || pskin == 288)
	{
		if(sscanf(params, "d", pId)) return SendClientMessage(playerid, 0xFF0000AA, "Usage: /tk [ID]");
			else if(!IsPlayerConnected(pId)) return SendClientMessage(playerid, 0xFF0000AA, "The ID You Entered Was Not Found.");
				else
				{
					new Float:x, Float:y, Float:z;
					GetPlayerPos(pId, x, y, z);
					if(IsPlayerInRangeOfPoint(playerid, 12.0, x, y, z))
					{
					    new pname[MAX_PLAYER_NAME], aname[MAX_PLAYER_NAME], string1[250];
					    GetPlayerName(playerid, pname, sizeof(pname));
					    GetPlayerName(pId, aname, sizeof(aname));
					    if (GetPlayerWantedLevel(pId) == 0)
					    {
					        SendClientMessage(playerid, 0xFF0000AA, "This Player Is Not Wanted!");
					        return 1;
						}
			            else if (GetPlayerWantedLevel(pId) == 1)
						{
						    SendClientMessage(pId, 0xFF0000AA, "You Have Ben Fined $1000 For Having A Level One Wanted Level!");
						    GivePlayerMoney(pId, -1000);
						    GivePlayerMoney(playerid, 1000);
						    SendClientMessage(playerid, 0xFF0000AA, "You Have Recived A $1000 Ticet Bonus!");
						    SetPlayerWantedLevel(pId, 0);
						    format(string1, sizeof(string1), "%s(%d) Has Recieved A Ticet From Officer %s(%d)", aname, pId, pname, playerid);
						    SendClientMessageToAll(0xFF0000AA, string1);
	                        return 1;
						}
						else if (GetPlayerWantedLevel(pId) > 1)
					    {
					        SendClientMessage(playerid, 0xFF0000AA, "Error: this player has to be arrested use /ar");
						    return 1;
						}
					}
				}
   			}
   			else
   			{
   			    return SendClientMessage(playerid, 0xFF0000AA, "Error: You are not a police officer!");
			}
	return 1;
}

COMMAND:ticket(playerid,params[])
{
	return cmd_tk(playerid, params);
}

COMMAND:ar(playerid,params[])
{
	new pId;
    new pskin = GetPlayerSkin(playerid);
	if(pskin == 265 || pskin == 266 || pskin == 267 || pskin == 280 || pskin == 281 || pskin == 284 || pskin == 285 || pskin == 286 || pskin == 287 || pskin == 288)
	{
		if(sscanf(params, "d", pId)) return SendClientMessage(playerid, 0xFF0000AA, "Usage: /ar [ID]");
			else if(!IsPlayerConnected(pId)) return SendClientMessage(playerid, 0xFF0000AA, "The ID You Entered Was Not Found.");
				else
				{
					new Float:x, Float:y, Float:z;
					GetPlayerPos(pId, x, y, z);
					if(IsPlayerInRangeOfPoint(playerid, 12.0, x, y, z))
					{
					    new pname[MAX_PLAYER_NAME], aname[MAX_PLAYER_NAME], string1[250], string2[256], string3[100], string4[100];
					    GetPlayerName(playerid, pname, sizeof(pname));
					    GetPlayerName(pId, aname, sizeof(aname));
					    if (GetPlayerWantedLevel(pId) == 0)
					    {
					        SendClientMessage(playerid, 0xFF0000AA, "This Player Is Not Wanted!");
					        return 1;
						}
			            else if (GetPlayerWantedLevel(pId) == 1)
						{
						    SendClientMessage(playerid, 0xFF0000AA, "Error: this player has to high of a wanted level use /tk");
	                        return 1;
						}
						else if (GetPlayerWantedLevel(pId) > 1)
					    {
					        new WantedLevel = GetPlayerWantedLevel(pId);
							SetPlayerInterior(pId, 3);
							new rand = random(sizeof(JailCellSpawns));
							SetPlayerPos(pId, JailCellSpawns[rand][0], JailCellSpawns[rand][1], JailCellSpawns[rand][2]);
							SetTimerEx("UnJail",WantedLevel*1000*60,0,"i",pId);
						    InJail[pId] = 1;
						    GivePlayerMoney(pId, -WantedLevel*1000);
						    GivePlayerMoney(playerid, WantedLevel*1000);
						    SetPlayerWantedLevel(pId, 0);
						    format(string1, sizeof(string1), "%s(%d) Has Ben Arrested By Officer %s(%d)", aname, pId, pname, playerid);
						    SendClientMessageToAll(0xFF0000AA, string1);
						    format(string2, sizeof(string2), "You Have Ben Sent To Jail For %s Minuets For Having A Level %s Wanted Level!", WantedLevel, WantedLevel);
						    SendClientMessage(pId, 0xFF0000AA, string2);
						    format(string3, sizeof(string3), "You Have Recived A %s000 Bonus For Arresting A Level %s Suspect!", WantedLevel, WantedLevel);
                            SendClientMessage(playerid, 0xFF0000AA, string3);
                            format(string4, sizeof(string4), "You Have Payed A %s000 Penalty On Your Arrest For Having A %s Wanted Level!", WantedLevel, WantedLevel);
                            SendClientMessage(pId, 0xFF0000AA, string4);
						    return 1;
						}
					}
				}
   			}
   			else
   			{
   			    return SendClientMessage(playerid, 0xFF0000AA, "Error: You are not a police officer!");
			}
	return 1;
}

COMMAND:jail(playerid,params[])
{
	if(IsPlayerAdmin(playerid))
	{
	    new pId, time;
		if(sscanf(params, "dds", pId, time, params[3])) return SendClientMessage(playerid, 0xFF0000AA, "Usage: /jail [ID] [time in minuets][reason]");
			else if(!IsPlayerConnected(pId)) return SendClientMessage(playerid, 0xFF0000AA, "The ID You Entered Was Not Found.");
				else
				{
				    new pname[MAX_PLAYER_NAME], jname[MAX_PLAYER_NAME], string1[250];
				    GetPlayerName(playerid, pname, sizeof(pname));
				    GetPlayerName(pId, jname, sizeof(jname));
					SetPlayerInterior(pId, 3);
					new rand = random(sizeof(JailCellSpawns));
					SetPlayerPos(pId, JailCellSpawns[rand][0], JailCellSpawns[rand][1], JailCellSpawns[rand][2]);
					SetTimerEx("UnJail",time*1000*60,0,"i",pId);
				    InJail[pId] = 1;
				    SetPlayerWantedLevel(pId, 0);
				    format(string1, sizeof(string1), "%s(%d) Has Ben Jailed By Admin %s(%d) For Reason: %s", jname, pId, pname, playerid, params[3]);
				    SendClientMessageToAll(0xFF0000AA, string1);
				    return 1;
				}
   			}
   			else
   			{
   			    return 0;
			}
}

COMMAND:arrest(playerid,params[])
{
	return cmd_tk(playerid, params);
}

COMMAND:copcmds(playerid,params[])
{
    new pskin = GetPlayerSkin(playerid);
	if(pskin == 265 || pskin == 266 || pskin == 267 || pskin == 280 || pskin == 281 || pskin == 284 || pskin == 285 || pskin == 286 || pskin == 287 || pskin == 288)
    {
        SendClientMessage(playerid, 0xFF0000AA, "Current Cop Commands!");
        SendClientMessage(playerid, 0xFF0000AA, "/arrest - /ar - /ticket - /tk");
        SendClientMessage(playerid, 0xFF0000AA, "Current Admin Cop Commands!");
        SendClientMessage(playerid, 0xFF0000AA, "/jail");
        return 1;
	}
	else
	{
	    return SendClientMessage(playerid, 0xFF0000AA, "Error: You are not a police officer!");
	}
}

//!!!!!!!!!!!!!!!!!!!!!!!!!THIS MUST BE AT THE BOTTOM OF THE SCRIPT!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

stock sscanf(string[], format[], {Float,_}:...)
{
	new
	formatPos = 0,
	stringPos = 0,
	paramPos = 2,
	paramCount = numargs();
	while (paramPos < paramCount && string[stringPos])
	{
		switch (format[formatPos++])
		{
			case '\0':
			{
				return 0;
			}
			case 'i', 'd':
			{
				new
				neg = 1,
				num = 0,
				ch = string[stringPos];
				if (ch == '-')
				{
					neg = -1;
					ch = string[++stringPos];
				}
				do
				{
					stringPos++;
					if (ch >= '0' && ch <= '9')
					{
						num = (num * 10) + (ch - '0');
					}
					else
					{
						return 1;
					}
				}
				while ((ch = string[stringPos]) && ch != ' ');
				setarg(paramPos, 0, num * neg);
			}
			case 'h', 'x':
			{
				new
				ch,
				num = 0;
				while ((ch = string[stringPos++]))
				{
					switch (ch)
					{
						case 'x', 'X':
						{
							num = 0;
							continue;
						}
						case '0' .. '9':
						{
							num = (num << 4) | (ch - '0');
						}
						case 'a' .. 'f':
						{
							num = (num << 4) | (ch - ('a' - 10));
						}
						case 'A' .. 'F':
						{
							num = (num << 4) | (ch - ('A' - 10));
						}
						case ' ':
						{
							break;
						}
						default:
						{
							return 1;
						}
					}
				}
				setarg(paramPos, 0, num);
			}
			case 'c':
			{
				setarg(paramPos, 0, string[stringPos++]);
			}
			case 'f':
			{
				new tmp[25];
				strmid(tmp, string, stringPos, stringPos+sizeof(tmp)-2);
				setarg(paramPos, 0, _:floatstr(tmp));
			}
			case 's', 'z':
			{
				new
				i = 0,
				ch;
				if (format[formatPos])
				{
					while ((ch = string[stringPos++]) && ch != ' ')
					{
						setarg(paramPos, i++, ch);
					}
					if (!i) return 1;
				}
				else
				{
					while ((ch = string[stringPos++]))
					{
						setarg(paramPos, i++, ch);
					}
				}
				stringPos--;
				setarg(paramPos, i, '\0');
			}
			default:
			{
				continue;
			}
		}
		while (string[stringPos] && string[stringPos] != ' ')
		{
			stringPos++;
		}
		while (string[stringPos] == ' ')
		{
			stringPos++;
		}
		paramPos++;
	}
	while (format[formatPos] == 'z') formatPos++;
	return format[formatPos];
}
