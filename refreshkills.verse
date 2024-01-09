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
                            if(AgentStats.TrackedElims > HighestKills):
                                set HighestKills = AgentStats.TrackedElims
                                set HighestKillAgent = Agent
                                KillLeader.Register(HighestKillAgent)
    }
