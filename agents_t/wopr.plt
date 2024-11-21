:- begin_tests('wopr').

:- spami_load_agent([name('wopr'),file('/var/lib/myfrdcsa/codebases/minor/prolog-agent/attempts/3/autonomous_ai_agent/agents/wopr.pasl')]).

:- start_agent.

%% test(wopr__1__run) :-
%% 	solve(+!run(wopr,_Arguments,_Output)),
%% 	assertion(x == x).

%% test(wopr__2__getInitialWorldState) :-
%% 	solve(+!getInitialWorldState(WorldState)),
%% 	assertion(x == x).

%% test(wopr__3__getInitialWorldStates) :-
%% 	solve(+!getInitialWorldStates(WorldStates)),
%% 	assertion(x == x).

%% test(wopr__4__process_head) :-
%% 	solve(+!process_head([WorldState|_])),
%% 	assertion(x == x).

%% test(wopr__5__getThreats) :-
%% 	solve(+!getThreats(WorldState,Threats)),
%% 	assertion(x == x).

%% test(wopr__6__sortThreatsBySeriousness) :-
%% 	solve(+!sortThreatsBySeriousness(WorldState,Threats,SortedThreats)),
%% 	assertion(x == x).

%% test(wopr__7__generateContingencyPlansForSortedThreat) :-
%% 	solve(+!generateContingencyPlansForSortedThreat(WorldState,SortedThreat,ContingencyPlans)),
%% 	assertion(x == x).

%% test(wopr__8__getLikelyEffectsOfContingencyPlan) :-
%% 	solve(+!getLikelyEffectsOfContingencyPlan(WorldState,SortedThreat,ContingencyPlan,LikelyEffects)),
%% 	assertion(x == x).

%% test(wopr__9__applyLikelyEffectsToWorldState) :-
%% 	solve(+!applyLikelyEffectsToWorldState(WorldState,SortedThreat,ContingencyPlan,LikelyEffects,NewWorldState)),
%% 	assertion(x == x).

:- end_tests('wopr').
