neo_load_all_agents :-
	findall(Agent,hasUseCases(prologAgentAgentFn(Agent),_),Agents),
	view([loading,all,agents]),
	forall(member(Agent,Agents),
	       (   
		   (   (   isa(Agent,startupAgent), not(isa(Agent,specialCaseAgent))) ->
		       (   
			   atomic_list_concat(['/var/lib/myfrdcsa/codebases/minor/prolog-agent/attempts/3/autonomous_ai_agent/agents/',Agent,'.pasl'],'',File),
			   view([spami_load_agent([name(Agent),file(File)])]),
			   spami_load_agent([name(Agent),file(File)])
		       ) ;
		       true)
	       )),
	findall(Agent,loaded(agent,Agent),LoadedAgents),
	view([loadedAgents,LoadedAgents]).
