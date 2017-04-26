/* Shadow's Map-Icon Generator
* Version 2 */

#define FILTERSCRIPT

#include <a_samp>
#include <zcmd>

#define RED 0xE60000FF

new Float:x, Float:y, Float:z;

main()
{
	print("\n----------------------------------");
	print("Shadows - Map Icon Generator");
	print("Last Edited: 8th January 2012 (22:52 GMT+0)");
	print("Thanks for using Shadow's Map Icon Generator");
	print("----------------------------------\n");
}

COMMAND:createicon(playerid, params[])
{
	ShowPlayerDialog(playerid, 1, DIALOG_STYLE_LIST, "Click the icon you wish to create", "White Square\nPlayer Position\nPlayer (MapMenu)\nNorth\nAir Yard\nAmmunation\nBarber\nBig Smoke\nBoat Yard\nBurger Shot\nQuarry\nCatalina\nCesar\nCluckin'Bell\nCarl Johnson\nC.R.A.S.H\nDiner\nEmmet\nEnemy Attack\nFire\nGirlfriend\nHospital\nLoco\nMadd Dogg\nCaligulas\nOG Loc\n\nMod Shop\nOG\nWell Stacked Pizza Co'\nPolice\nProperty(green)\nProperty(red)\nRace\nRyder\nSave Gave\nSchool\nUnknown", "Select", "Cancel");
 	SendClientMessage(playerid, RED, "If you cannot find the icon you're looking for try, /createicon2");
  	return 1;
}

COMMAND:createicon2(playerid, params[])
{
	ShowPlayerDialog(playerid, 2, DIALOG_STYLE_LIST, "Click the icon you wish to create", "Sweet\nTatto\nThe Truth\nWaypoint\nToreno\nTraids\nTriads Casino\nClothes\nWoozie\nZero\nDisco\nBar\nRestaurant\nTruck\nRobbery\nRace\nGym\nCar\nLight\nClosest Airport\nVarrio Los Aztecas\nBallas\nLos Santos Vagos\nSan Fierro Rifa\nGrove Street\nPay'N'Spray", "Select", "Cancel");
	return 1;
}

public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	new string[256];
	if(dialogid == 1 && response)
	{
	    switch(listitem)
	    {
	        case 0:
	        {
	            GetPlayerPos(playerid, x, y, z);
	            SetPlayerMapIcon(playerid, 1, x, y, z, 1, 1);
      		 	new File:map = fopen("shadowicon.txt", io_append);
  		 		format(string, sizeof string, "SetPlayerMapIcon(playerid, 1, %.2f, %.2f, %.2f, 1, 1); // Map icon Created by Shadow\r\n", x, y, z);
 				fwrite(map, string);
 				fclose(map);
			}
			case 1:
			{
			    GetPlayerPos(playerid, x, y, z);
			    SetPlayerMapIcon(playerid, 2, x, y, z, 2, 0);
   		 		new File:map = fopen("shadowicon.txt", io_append);
  		 		format(string, sizeof string, "SetPlayerMapIcon(playerid, 2, %.2f, %.2f, %.2f, 2, 0); // Map icon Created by Shadow\r\n", x, y, z);
 				fwrite(map, string);
 				fclose(map);
			}
			case 2:
			{
   				GetPlayerPos(playerid, x, y, z);
			    SetPlayerMapIcon(playerid, 3, x, y, z, 3, 0);
   		 		new File:map = fopen("shadowicon.txt", io_append);
  		 		format(string, sizeof string, "SetPlayerMapIcon(playerid, 3, %.2f, %.2f, %.2f, 4, 0); // Map icon Created by Shadow\r\n", x, y, z);
 				fwrite(map, string);
 				fclose(map);
			}
			case 3:
   			{
			   	GetPlayerPos(playerid, x, y, z);
			    SetPlayerMapIcon(playerid, 4, x, y, z, 4, 0);
   		 		new File:map = fopen("shadowicon.txt", io_append);
  		 		format(string, sizeof string, "SetPlayerMapIcon(playerid, 4, %.2f, %.2f, %.2f, 4, 0); // Map icon Created by Shadow\r\n", x, y, z);
 				fwrite(map, string);
 				fclose(map);
			}
			case 4:
			{
   				GetPlayerPos(playerid, x, y, z);
			    SetPlayerMapIcon(playerid, 5, x, y, z, 5, 0);
   		 		new File:map = fopen("shadowicon.txt", io_append);
  		 		format(string, sizeof string, "SetPlayerMapIcon(playerid, 5, %.2f, %.2f, %.2f, 5, 0); // Map icon Created by Shadow\r\n", x, y, z);
 				fwrite(map, string);
 				fclose(map);
			}
			case 5:
			{
   				GetPlayerPos(playerid, x, y, z);
			    SetPlayerMapIcon(playerid, 6, x, y, z, 6, 0);
   		 		new File:map = fopen("shadowicon.txt", io_append);
  		 		format(string, sizeof string, "SetPlayerMapIcon(playerid, 6, %.2f, %.2f, %.2f, 6, 0); // Map icon Created by Shadow\r\n", x, y, z);
 				fwrite(map, string);
 				fclose(map);
			}
			case 6:
			{
   				GetPlayerPos(playerid, x, y, z);
			    SetPlayerMapIcon(playerid, 7, x, y, z, 7, 0);
   		 		new File:map = fopen("shadowicon.txt", io_append);
  		 		format(string, sizeof string, "SetPlayerMapIcon(playerid, 7, %.2f, %.2f, %.2f, 7, 0); // Map icon Created by Shadow\r\n", x, y, z);
 				fwrite(map, string);
 				fclose(map);
			}
			case 7:
			{
   				GetPlayerPos(playerid, x, y, z);
			    SetPlayerMapIcon(playerid, 8, x, y, z, 8, 0);
   		 		new File:map = fopen("shadowicon.txt", io_append);
  		 		format(string, sizeof string, "SetPlayerMapIcon(playerid, 8, %.2f, %.2f, %.2f, 8, 0); // Map icon Created by Shadow\r\n", x, y, z);
 				fwrite(map, string);
 				fclose(map);
			}
			case 8:
			{
   				GetPlayerPos(playerid, x, y, z);
			    SetPlayerMapIcon(playerid, 9, x, y, z, 9, 0);
   		 		new File:map = fopen("shadowicon.txt", io_append);
  		 		format(string, sizeof string, "SetPlayerMapIcon(playerid, 9, %.2f, %.2f, %.2f, 9, 0); // Map icon Created by Shadow\r\n", x, y, z);
 				fwrite(map, string);
 				fclose(map);
			}
			case 9:
			{
   				GetPlayerPos(playerid, x, y, z);
			    SetPlayerMapIcon(playerid, 10, x, y, z, 10, 0);
   		 		new File:map = fopen("shadowicon.txt", io_append);
  		 		format(string, sizeof string, "SetPlayerMapIcon(playerid, 10, %.2f, %.2f, %.2f, 10, 0); // Map icon Created by Shadow\r\n", x, y, z);
 				fwrite(map, string);
 				fclose(map);
			}
			case 10:
			{
				GetPlayerPos(playerid, x, y, z);
			    SetPlayerMapIcon(playerid, 11, x, y, z, 11, 0);
   		 		new File:map = fopen("shadowicon.txt", io_append);
  		 		format(string, sizeof string, "SetPlayerMapIcon(playerid, 11, %.2f, %.2f, %.2f, 11, 0); // Map icon Created by Shadow\r\n", x, y, z);
 				fwrite(map, string);
 				fclose(map);
			}
			case 11:
			{
				GetPlayerPos(playerid, x, y, z);
			    SetPlayerMapIcon(playerid, 12, x, y, z, 12, 0);
   		 		new File:map = fopen("shadowicon.txt", io_append);
  		 		format(string, sizeof string, "SetPlayerMapIcon(playerid, 12, %.2f, %.2f, %.2f, 12, 0); // Map icon Created by Shadow\r\n", x, y, z);
 				fwrite(map, string);
 				fclose(map);
			}
			case 12:
			{
				GetPlayerPos(playerid, x, y, z);
			    SetPlayerMapIcon(playerid, 13, x, y, z, 13, 0);
   		 		new File:map = fopen("shadowicon.txt", io_append);
  		 		format(string, sizeof string, "SetPlayerMapIcon(playerid, 13, %.2f, %.2f, %.2f, 13, 0); // Map icon Created by Shadow\r\n", x, y, z);
 				fwrite(map, string);
 				fclose(map);
			}
			case 13:
			{
				GetPlayerPos(playerid, x, y, z);
			    SetPlayerMapIcon(playerid, 14, x, y, z, 14, 0);
   		 		new File:map = fopen("shadowicon.txt", io_append);
  		 		format(string, sizeof string, "SetPlayerMapIcon(playerid, 14, %.2f, %.2f, %.2f, 14, 0); // Map icon Created by Shadow\r\n", x, y, z);
 				fwrite(map, string);
 				fclose(map);
			}
			case 14:
			{
				GetPlayerPos(playerid, x, y, z);
			    SetPlayerMapIcon(playerid, 15, x, y, z, 15, 0);
   		 		new File:map = fopen("shadowicon.txt", io_append);
  		 		format(string, sizeof string, "SetPlayerMapIcon(playerid, 15, %.2f, %.2f, %.2f, 15, 0); // Map icon Created by Shadow\r\n", x, y, z);
 				fwrite(map, string);
 				fclose(map);
			}
			case 15:
			{
				GetPlayerPos(playerid, x, y, z);
			    SetPlayerMapIcon(playerid, 16, x, y, z, 16, 0);
   		 		new File:map = fopen("shadowicon.txt", io_append);
  		 		format(string, sizeof string, "SetPlayerMapIcon(playerid, 16, %.2f, %.2f, %.2f, 16, 0); // Map icon Created by Shadow\r\n", x, y, z);
 				fwrite(map, string);
 				fclose(map);
			}
			case 16:
			{
				GetPlayerPos(playerid, x, y, z);
			    SetPlayerMapIcon(playerid, 17, x, y, z, 17, 0);
   		 		new File:map = fopen("shadowicon.txt", io_append);
  		 		format(string, sizeof string, "SetPlayerMapIcon(playerid, 17, %.2f, %.2f, %.2f, 17, 0); // Map icon Created by Shadow\r\n", x, y, z);
 				fwrite(map, string);
 				fclose(map);
			}
			case 17:
			{
				GetPlayerPos(playerid, x, y, z);
			    SetPlayerMapIcon(playerid, 18, x, y, z, 18, 0);
   		 		new File:map = fopen("shadowicon.txt", io_append);
  		 		format(string, sizeof string, "SetPlayerMapIcon(playerid, 18, %.2f, %.2f, %.2f, 18, 0); // Map icon Created by Shadow\r\n", x, y, z);
 				fwrite(map, string);
 				fclose(map);
			}
			case 18:
			{
				GetPlayerPos(playerid, x, y, z);
			    SetPlayerMapIcon(playerid, 19, x, y, z, 19, 0);
   		 		new File:map = fopen("shadowicon.txt", io_append);
  		 		format(string, sizeof string, "SetPlayerMapIcon(playerid, 19, %.2f, %.2f, %.2f, 19, 0); // Map icon Created by Shadow\r\n", x, y, z);
 				fwrite(map, string);
 				fclose(map);
			}
			case 19:
			{
				GetPlayerPos(playerid, x, y, z);
			    SetPlayerMapIcon(playerid, 20, x, y, z, 20, 0);
   		 		new File:map = fopen("shadowicon.txt", io_append);
  		 		format(string, sizeof string, "SetPlayerMapIcon(playerid, 20, %.2f, %.2f, %.2f, 20, 0); // Map icon Created by Shadow\r\n", x, y, z);
 				fwrite(map, string);
 				fclose(map);
			}
			case 20:
			{
				GetPlayerPos(playerid, x, y, z);
			    SetPlayerMapIcon(playerid, 21, x, y, z, 21, 0);
   		 		new File:map = fopen("shadowicon.txt", io_append);
  		 		format(string, sizeof string, "SetPlayerMapIcon(playerid, 21, %.2f, %.2f, %.2f, 21, 0); // Map icon Created by Shadow\r\n", x, y, z);
 				fwrite(map, string);
 				fclose(map);
			}
			case 21:
   			{
				GetPlayerPos(playerid, x, y, z);
			    SetPlayerMapIcon(playerid, 22, x, y, z, 22, 0);
   		 		new File:map = fopen("shadowicon.txt", io_append);
  		 		format(string, sizeof string, "SetPlayerMapIcon(playerid, 22, %.2f, %.2f, %.2f, 22, 0); // Map icon Created by Shadow\r\n", x, y, z);
 				fwrite(map, string);
 				fclose(map);
			}
			case 22:
			{
				GetPlayerPos(playerid, x, y, z);
			    SetPlayerMapIcon(playerid, 23, x, y, z, 23, 0);
   		 		new File:map = fopen("shadowicon.txt", io_append);
  		 		format(string, sizeof string, "SetPlayerMapIcon(playerid, 23, %.2f, %.2f, %.2f, 23, 0); // Map icon Created by Shadow\r\n", x, y, z);
 				fwrite(map, string);
 				fclose(map);
			}
			case 23:
			{
				GetPlayerPos(playerid, x, y, z);
			    SetPlayerMapIcon(playerid, 24, x, y, z, 24, 0);
   		 		new File:map = fopen("shadowicon.txt", io_append);
  		 		format(string, sizeof string, "SetPlayerMapIcon(playerid, 24, %.2f, %.2f, %.2f, 24, 0); // Map icon Created by Shadow\r\n", x, y, z);
 				fwrite(map, string);
 				fclose(map);
			}
			case 24:
			{
				GetPlayerPos(playerid, x, y, z);
			    SetPlayerMapIcon(playerid, 25, x, y, z, 25, 0);
   		 		new File:map = fopen("shadowicon.txt", io_append);
  		 		format(string, sizeof string, "SetPlayerMapIcon(playerid, 25, %.2f, %.2f, %.2f, 25, 0); // Map icon Created by Shadow\r\n", x, y, z);
 				fwrite(map, string);
 				fclose(map);
			}
			case 25:
			{
				GetPlayerPos(playerid, x, y, z);
			    SetPlayerMapIcon(playerid, 26, x, y, z, 26, 0);
   		 		new File:map = fopen("shadowicon.txt", io_append);
  		 		format(string, sizeof string, "SetPlayerMapIcon(playerid, 26, %.2f, %.2f, %.2f, 26, 0); // Map icon Created by Shadow\r\n", x, y, z);
 				fwrite(map, string);
 				fclose(map);
			}
			case 26:
			{
				GetPlayerPos(playerid, x, y, z);
			    SetPlayerMapIcon(playerid, 27, x, y, z, 27, 0);
   		 		new File:map = fopen("shadowicon.txt", io_append);
  		 		format(string, sizeof string, "SetPlayerMapIcon(playerid, 27, %.2f, %.2f, %.2f, 27, 0); // Map icon Created by Shadow\r\n", x, y, z);
 				fwrite(map, string);
 				fclose(map);
			}
			case 27:
			{
				GetPlayerPos(playerid, x, y, z);
			    SetPlayerMapIcon(playerid, 28, x, y, z, 28, 0);
   		 		new File:map = fopen("shadowicon.txt", io_append);
  		 		format(string, sizeof string, "SetPlayerMapIcon(playerid, 28, %.2f, %.2f, %.2f, 28, 0); // Map icon Created by Shadow\r\n", x, y, z);
 				fwrite(map, string);
 				fclose(map);
			}
			case 28:
			{
				GetPlayerPos(playerid, x, y, z);
			    SetPlayerMapIcon(playerid, 29, x, y, z, 29, 0);
   		 		new File:map = fopen("shadowicon.txt", io_append);
  		 		format(string, sizeof string, "SetPlayerMapIcon(playerid, 29, %.2f, %.2f, %.2f, 29, 0); // Map icon Created by Shadow\r\n", x, y, z);
 				fwrite(map, string);
 				fclose(map);
			}
			case 29:
			{
				GetPlayerPos(playerid, x, y, z);
			    SetPlayerMapIcon(playerid, 30, x, y, z, 30, 0);
   		 		new File:map = fopen("shadowicon.txt", io_append);
  		 		format(string, sizeof string, "SetPlayerMapIcon(playerid, 30, %.2f, %.2f, %.2f, 30, 0); // Map icon Created by Shadow\r\n", x, y, z);
 				fwrite(map, string);
 				fclose(map);
			}
			case 30:
			{
				GetPlayerPos(playerid, x, y, z);
			    SetPlayerMapIcon(playerid, 31, x, y, z, 31, 0);
   		 		new File:map = fopen("shadowicon.txt", io_append);
  		 		format(string, sizeof string, "SetPlayerMapIcon(playerid, 31, %.2f, %.2f, %.2f, 31, 0); // Map icon Created by Shadow\r\n", x, y, z);
 				fwrite(map, string);
 				fclose(map);
			}
			case 31:
			{
				GetPlayerPos(playerid, x, y, z);
			    SetPlayerMapIcon(playerid, 32, x, y, z, 32, 0);
   		 		new File:map = fopen("shadowicon.txt", io_append);
  		 		format(string, sizeof string, "SetPlayerMapIcon(playerid, 32, %.2f, %.2f, %.2f, 32, 0); // Map icon Created by Shadow\r\n", x, y, z);
 				fwrite(map, string);
 				fclose(map);
			}
			case 32:
			{
				GetPlayerPos(playerid, x, y, z);
			    SetPlayerMapIcon(playerid, 33, x, y, z, 33, 0);
   		 		new File:map = fopen("shadowicon.txt", io_append);
  		 		format(string, sizeof string, "SetPlayerMapIcon(playerid, 33, %.2f, %.2f, %.2f, 33, 0); // Map icon Created by Shadow\r\n", x, y, z);
 				fwrite(map, string);
 				fclose(map);
			}
			case 33:
			{
				GetPlayerPos(playerid, x, y, z);
			    SetPlayerMapIcon(playerid, 34, x, y, z, 34, 0);
   		 		new File:map = fopen("shadowicon.txt", io_append);
  		 		format(string, sizeof string, "SetPlayerMapIcon(playerid, 34, %.2f, %.2f, %.2f, 34, 0); // Map icon Created by Shadow\r\n", x, y, z);
 				fwrite(map, string);
 				fclose(map);
			}
			case 34:
			{
				GetPlayerPos(playerid, x, y, z);
			    SetPlayerMapIcon(playerid, 35, x, y, z, 35, 0);
   		 		new File:map = fopen("shadowicon.txt", io_append);
  		 		format(string, sizeof string, "SetPlayerMapIcon(playerid, 35, %.2f, %.2f, %.2f, 35, 0); // Map icon Created by Shadow\r\n", x, y, z);
 				fwrite(map, string);
 				fclose(map);
			}
			case 35:
			{
				GetPlayerPos(playerid, x, y, z);
			    SetPlayerMapIcon(playerid, 36, x, y, z, 36, 0);
   		 		new File:map = fopen("shadowicon.txt", io_append);
  		 		format(string, sizeof string, "SetPlayerMapIcon(playerid, 36, %.2f, %.2f, %.2f, 36, 0); // Map icon Created by Shadow\r\n", x, y, z);
 				fwrite(map, string);
 				fclose(map);
			}
			case 36:
			{
				GetPlayerPos(playerid, x, y, z);
			    SetPlayerMapIcon(playerid, 37, x, y, z, 37, 0);
   		 		new File:map = fopen("shadowicon.txt", io_append);
  		 		format(string, sizeof string, "SetPlayerMapIcon(playerid, 37, %.2f, %.2f, %.2f, 37, 0); // Map icon Created by Shadow\r\n", x, y, z);
 				fwrite(map, string);
 				fclose(map);
			}
		}
   	}
	if(dialogid == 2 && response)
	{
	    switch(listitem)
	    {
	        case 0:
	        {
				GetPlayerPos(playerid, x, y, z);
			    SetPlayerMapIcon(playerid, 38, x, y, z, 38, 0);
   		 		new File:map = fopen("shadowicon.txt", io_append);
  		 		format(string, sizeof string, "SetPlayerMapIcon(playerid, 38, %.2f, %.2f, %.2f, 38, 0); // Map icon Created by Shadow\r\n", x, y, z);
 				fwrite(map, string);
 				fclose(map);
			}
			case 1:
			{
				GetPlayerPos(playerid, x, y, z);
			    SetPlayerMapIcon(playerid, 39, x, y, z, 39, 0);
   		 		new File:map = fopen("shadowicon.txt", io_append);
  		 		format(string, sizeof string, "SetPlayerMapIcon(playerid, 39, %.2f, %.2f, %.2f, 39, 0); // Map icon Created by Shadow\r\n", x, y, z);
 				fwrite(map, string);
 				fclose(map);
			}
			case 2:
			{
				GetPlayerPos(playerid, x, y, z);
			    SetPlayerMapIcon(playerid, 40, x, y, z, 40, 0);
   		 		new File:map = fopen("shadowicon.txt", io_append);
  		 		format(string, sizeof string, "SetPlayerMapIcon(playerid, 40, %.2f, %.2f, %.2f, 40, 0); // Map icon Created by Shadow\r\n", x, y, z);
 				fwrite(map, string);
 				fclose(map);
			}
			case 3:
			{
				GetPlayerPos(playerid, x, y, z);
			    SetPlayerMapIcon(playerid, 41, x, y, z, 41, 0);
   		 		new File:map = fopen("shadowicon.txt", io_append);
  		 		format(string, sizeof string, "SetPlayerMapIcon(playerid, 41, %.2f, %.2f, %.2f, 41, 0); // Map icon Created by Shadow\r\n", x, y, z);
 				fwrite(map, string);
 				fclose(map);
			}
			case 4:
			{
				GetPlayerPos(playerid, x, y, z);
			    SetPlayerMapIcon(playerid, 42, x, y, z, 42, 0);
   		 		new File:map = fopen("shadowicon.txt", io_append);
  		 		format(string, sizeof string, "SetPlayerMapIcon(playerid, 42, %.2f, %.2f, %.2f, 42, 0); // Map icon Created by Shadow\r\n", x, y, z);
 				fwrite(map, string);
 				fclose(map);
			}
			case 5:
			{
				GetPlayerPos(playerid, x, y, z);
			    SetPlayerMapIcon(playerid, 43, x, y, z, 43, 0);
   		 		new File:map = fopen("shadowicon.txt", io_append);
  		 		format(string, sizeof string, "SetPlayerMapIcon(playerid, 43, %.2f, %.2f, %.2f, 43, 0); // Map icon Created by Shadow\r\n", x, y, z);
 				fwrite(map, string);
 				fclose(map);
			}
			case 6:
			{
				GetPlayerPos(playerid, x, y, z);
			    SetPlayerMapIcon(playerid, 44, x, y, z, 44, 0);
   		 		new File:map = fopen("shadowicon.txt", io_append);
  		 		format(string, sizeof string, "SetPlayerMapIcon(playerid, 44, %.2f, %.2f, %.2f, 44, 0); // Map icon Created by Shadow\r\n", x, y, z);
 				fwrite(map, string);
 				fclose(map);
			}
			case 7:
			{
				GetPlayerPos(playerid, x, y, z);
			    SetPlayerMapIcon(playerid, 45, x, y, z, 45, 0);
   		 		new File:map = fopen("shadowicon.txt", io_append);
  		 		format(string, sizeof string, "SetPlayerMapIcon(playerid, 45, %.2f, %.2f, %.2f, 45, 0); // Map icon Created by Shadow\r\n", x, y, z);
 				fwrite(map, string);
 				fclose(map);
			}
			case 8:
   			{
				GetPlayerPos(playerid, x, y, z);
			    SetPlayerMapIcon(playerid, 46, x, y, z, 46, 0);
   		 		new File:map = fopen("shadowicon.txt", io_append);
  		 		format(string, sizeof string, "SetPlayerMapIcon(playerid, 46, %.2f, %.2f, %.2f, 46, 0); // Map icon Created by Shadow\r\n", x, y, z);
 				fwrite(map, string);
 				fclose(map);
			}
			case 9:
			{
				GetPlayerPos(playerid, x, y, z);
			    SetPlayerMapIcon(playerid, 47, x, y, z, 47, 0);
   		 		new File:map = fopen("shadowicon.txt", io_append);
  		 		format(string, sizeof string, "SetPlayerMapIcon(playerid, 47, %.2f, %.2f, %.2f, 47, 0); // Map icon Created by Shadow\r\n", x, y, z);
 				fwrite(map, string);
 				fclose(map);
			}
			case 10:
			{
				GetPlayerPos(playerid, x, y, z);
			    SetPlayerMapIcon(playerid, 48, x, y, z, 48, 0);
   		 		new File:map = fopen("shadowicon.txt", io_append);
  		 		format(string, sizeof string, "SetPlayerMapIcon(playerid, 48, %.2f, %.2f, %.2f, 48, 0); // Map icon Created by Shadow\r\n", x, y, z);
 				fwrite(map, string);
 				fclose(map);
			}
			case 11:
			{
				GetPlayerPos(playerid, x, y, z);
			    SetPlayerMapIcon(playerid, 49, x, y, z, 49, 0);
   		 		new File:map = fopen("shadowicon.txt", io_append);
  		 		format(string, sizeof string, "SetPlayerMapIcon(playerid, 49, %.2f, %.2f, %.2f, 49, 0); // Map icon Created by Shadow\r\n", x, y, z);
 				fwrite(map, string);
 				fclose(map);
			}
			case 12:
			{
				GetPlayerPos(playerid, x, y, z);
			    SetPlayerMapIcon(playerid, 50, x, y, z, 50, 0);
   		 		new File:map = fopen("shadowicon.txt", io_append);
  		 		format(string, sizeof string, "SetPlayerMapIcon(playerid, 50, %.2f, %.2f, %.2f, 50, 0); // Map icon Created by Shadow\r\n", x, y, z);
 				fwrite(map, string);
 				fclose(map);
			}
			case 13:
			{
				GetPlayerPos(playerid, x, y, z);
			    SetPlayerMapIcon(playerid, 51, x, y, z, 51, 0);
   		 		new File:map = fopen("shadowicon.txt", io_append);
  		 		format(string, sizeof string, "SetPlayerMapIcon(playerid, 51, %.2f, %.2f, %.2f, 51, 0); // Map icon Created by Shadow\r\n", x, y, z);
 				fwrite(map, string);
 				fclose(map);
			}
			case 14:
			{
				GetPlayerPos(playerid, x, y, z);
			    SetPlayerMapIcon(playerid, 52, x, y, z, 52, 0);
   		 		new File:map = fopen("shadowicon.txt", io_append);
  		 		format(string, sizeof string, "SetPlayerMapIcon(playerid, 52, %.2f, %.2f, %.2f, 52, 0); // Map icon Created by Shadow\r\n", x, y, z);
 				fwrite(map, string);
 				fclose(map);
			}
			case 15:
			{
				GetPlayerPos(playerid, x, y, z);
			    SetPlayerMapIcon(playerid, 53, x, y, z, 53, 0);
   		 		new File:map = fopen("shadowicon.txt", io_append);
  		 		format(string, sizeof string, "SetPlayerMapIcon(playerid, 53, %.2f, %.2f, %.2f, 53, 0); // Map icon Created by Shadow\r\n", x, y, z);
 				fwrite(map, string);
 				fclose(map);
			}
			case 16:
   			{
				GetPlayerPos(playerid, x, y, z);
			    SetPlayerMapIcon(playerid, 54, x, y, z, 54, 0);
   		 		new File:map = fopen("shadowicon.txt", io_append);
  		 		format(string, sizeof string, "SetPlayerMapIcon(playerid, 54, %.2f, %.2f, %.2f, 54, 0); // Map icon Created by Shadow\r\n", x, y, z);
 				fwrite(map, string);
 				fclose(map);
			}
			case 17:
			{
				GetPlayerPos(playerid, x, y, z);
			    SetPlayerMapIcon(playerid, 55, x, y, z, 55, 0);
   		 		new File:map = fopen("shadowicon.txt", io_append);
  		 		format(string, sizeof string, "SetPlayerMapIcon(playerid, 55, %.2f, %.2f, %.2f, 55, 0); // Map icon Created by Shadow\r\n", x, y, z);
 				fwrite(map, string);
 				fclose(map);
			}
			case 18:
			{
				GetPlayerPos(playerid, x, y, z);
			    SetPlayerMapIcon(playerid, 56, x, y, z, 56, 0);
   		 		new File:map = fopen("shadowicon.txt", io_append);
  		 		format(string, sizeof string, "SetPlayerMapIcon(playerid, 56, %.2f, %.2f, %.2f, 56, 0); // Map icon Created by Shadow\r\n", x, y, z);
 				fwrite(map, string);
 				fclose(map);
			}
			case 19:
			{
				GetPlayerPos(playerid, x, y, z);
			    SetPlayerMapIcon(playerid, 57, x, y, z, 57, 0);
   		 		new File:map = fopen("shadowicon.txt", io_append);
  		 		format(string, sizeof string, "SetPlayerMapIcon(playerid, 57, %.2f, %.2f, %.2f, 57, 0); // Map icon Created by Shadow\r\n", x, y, z);
 				fwrite(map, string);
 				fclose(map);
			}
			case 20:
			{
				GetPlayerPos(playerid, x, y, z);
			    SetPlayerMapIcon(playerid, 58, x, y, z, 58, 0);
   		 		new File:map = fopen("shadowicon.txt", io_append);
  		 		format(string, sizeof string, "SetPlayerMapIcon(playerid, 58, %.2f, %.2f, %.2f, 58, 0); // Map icon Created by Shadow\r\n", x, y, z);
 				fwrite(map, string);
 				fclose(map);
			}
			case 21:
			{
				GetPlayerPos(playerid, x, y, z);
			    SetPlayerMapIcon(playerid, 59, x, y, z, 59, 0);
   		 		new File:map = fopen("shadowicon.txt", io_append);
  		 		format(string, sizeof string, "SetPlayerMapIcon(playerid, 59, %.2f, %.2f, %.2f, 59, 0); // Map icon Created by Shadow\r\n", x, y, z);
 				fwrite(map, string);
 				fclose(map);
			}
			case 22:
			{
				GetPlayerPos(playerid, x, y, z);
			    SetPlayerMapIcon(playerid, 60, x, y, z, 60, 0);
   		 		new File:map = fopen("shadowicon.txt", io_append);
  		 		format(string, sizeof string, "SetPlayerMapIcon(playerid, 60, %.2f, %.2f, %.2f, 60, 0); // Map icon Created by Shadow\r\n", x, y, z);
 				fwrite(map, string);
 				fclose(map);
			}
			case 23:
			{
				GetPlayerPos(playerid, x, y, z);
			    SetPlayerMapIcon(playerid, 61, x, y, z, 61, 0);
   		 		new File:map = fopen("shadowicon.txt", io_append);
  		 		format(string, sizeof string, "SetPlayerMapIcon(playerid, 61, %.2f, %.2f, %.2f, 61, 0); // Map icon Created by Shadow\r\n", x, y, z);
 				fwrite(map, string);
 				fclose(map);
			}
			case 24:
			{
				GetPlayerPos(playerid, x, y, z);
			    SetPlayerMapIcon(playerid, 62, x, y, z, 62, 0);
   		 		new File:map = fopen("shadowicon.txt", io_append);
  		 		format(string, sizeof string, "SetPlayerMapIcon(playerid, 62, %.2f, %.2f, %.2f, 62, 0); // Map icon Created by Shadow\r\n", x, y, z);
 				fwrite(map, string);
 				fclose(map);
			}
			case 25:
			{
				GetPlayerPos(playerid, x, y, z);
			    SetPlayerMapIcon(playerid, 63, x, y, z, 63, 0);
   		 		new File:map = fopen("shadowicon.txt", io_append);
  		 		format(string, sizeof string, "SetPlayerMapIcon(playerid, 63, %.2f, %.2f, %.2f, 63, 0); // Map icon Created by Shadow\r\n", x, y, z);
 				fwrite(map, string);
 				fclose(map);
			}
		}
  	}
	return 1;
}
