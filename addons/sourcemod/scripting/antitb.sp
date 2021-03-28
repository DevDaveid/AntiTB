#include <sourcemod>

#pragma newdecls required
#pragma semicolon 1

public Plugin myinfo = {
    name        = "Anti Turnbind Plugin",
    author        = "Dave",
    description    = "Kicks players for using +right/+left",
    version        = "1.0.0",
    url            = ""
};

public Action OnPlayerRunCmd(int client, int& buttons, int& impulse, float vel[3], float angles[3], int& weapon, int& subtype, int& cmdnum, int& tickcount, int& seed, int mouse[2])
{
    char szName[MAX_NAME_LENGTH];

    if(buttons & IN_LEFT || buttons & IN_RIGHT)
    {
        GetClientName(client, szName, sizeof(szName));
        KickClient(client, "Turnbinds are prohibited on the server!");
        PrintToChatAll("[\x02AntiTB\x01] %s got kicked for using turnbinds!", szName);
    }
}
