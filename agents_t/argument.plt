:- begin_tests('argument').

:- spami_load_agent([name('argument'),file('/var/lib/myfrdcsa/codebases/minor/prolog-agent/attempts/3/autonomous_ai_agent/agents/argument.pasl')]).

:- start_agent.

%% test(argument__1__run) :-
%% 	solve(+!run(argument,[])),
%% 	assertion(x == x).

%% test(argument__2__run) :-
%% 	solve(+!run(argument,_Arguments,_Output)),
%% 	assertion(x == x).

%% test(argument__3__getInitialPolemic) :-
%% 	solve(+!getInitialPolemic(Polemic)),
%% 	assertion(x == x).

%% test(argument__4__process_head) :-
%% 	solve(+!process_head([Polemic|_])),
%% 	assertion(x == x).

%% test(argument__5__getThreats) :-
%% 	solve(+!getThreats(Polemic,Threats)),
%% 	assertion(x == x).

%% test(argument__6__sortThreatsBySeriousness) :-
%% 	solve(+!sortThreatsBySeriousness(Polemic,Threats,SortedThreats)),
%% 	assertion(x == x).

%% test(argument__7__generateContingencyPlansForSortedThreat) :-
%% 	solve(+!generateContingencyPlansForSortedThreat(Polemic,SortedThreat,ContingencyPlans)),
%% 	assertion(x == x).

%% test(argument__8__getLikelyEffectsOfContingencyPlan) :-
%% 	solve(+!getLikelyEffectsOfContingencyPlan(Polemic,SortedThreat,ContingencyPlan,LikelyEffects)),
%% 	assertion(x == x).

%% test(argument__9__applyLikelyEffectsToPolemic) :-
%% 	solve(+!applyLikelyEffectsToPolemic(Polemic,SortedThreat,ContingencyPlan,LikelyEffects,NewPolemic)),
%% 	assertion(x == x).

:- end_tests('argument').
