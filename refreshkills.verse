using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /Fortnite.com/Characters}
using { /UnrealEngine.com/Temporary/Diagnostics }
using { /Fortnite.com/Teams }
using { /UnrealEngine.com/Temporary/SpatialMath }
using { /Fortnite.com/Characters}
using { /UnrealEngine.com/Temporary/UI}
using { /Fortnite.com/UI}
using { /Verse.org/Colors/NamedColors}
using { /Verse.org/Colors}
using { /Verse.org/Random }
using { /Fortnite.com/Game }

DEVICENAME:=class(creative_device):
        @editable
                KillLeader: player_reference_device = player_reference_device{}
        OnBegin<override>()<suspends>:void={
                spawn:
                    RefreshKillLeader()
        RefreshKillLeader()<suspends>:void={
                Players:=GetPlayspace().GetPlayers()
                if(VoidPlayer := Players[0]): #Get the first player that exists
                    if(VoidAgent:agent = agent[VoidPlayer]):
                        var HighestKillAgent: agent = VoidAgent #Create a void agent for the default reference
                        var HighestKills: int = 0
                        loop:
                            Sleep(0.25)
                            for (Player : Players):
                                if(Agent:agent = agent[Player]):
                                    AgentStats := GetAgentStats(Agent)
                                    if(AgentStats.TrackedElims >= HighestKills):
                                        set HighestKills = AgentStats.TrackedElims
                                        set HighestKillAgent = Agent
                                        KillLeader.Register(HighestKillAgent)
            }
