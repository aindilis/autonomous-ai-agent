:- begin_tests('do_ooda').

:- spami_load_agent([name('do_ooda'),file('/var/lib/myfrdcsa/codebases/minor/prolog-agent/attempts/3/autonomous_ai_agent/agents/do_ooda.pasl')]).

:- start_agent.

%% test(do_ooda__1__run) :-
%% 	solve(+!run(do_ooda,_Arguments,_Output)),
%% 	assertion(x == x).

%% test(do_ooda__2__getInitialToDoList) :-
%% 	solve(+!getInitialToDoList(ToDoList)),
%% 	assertion(x == x).

%% test(do_ooda__3__getInitialToDoLists) :-
%% 	solve(+!getInitialToDoLists(ToDoLists)),
%% 	assertion(x == x).

%% test(do_ooda__4__process_head) :-
%% 	solve(+!process_head([ToDoList|_])),
%% 	assertion(x == x).

%% test(do_ooda__5__getThreats) :-
%% 	solve(+!getThreats(ToDoList,Threats)),
%% 	assertion(x == x).

%% test(do_ooda__6__sortThreatsBySeriousness) :-
%% 	solve(+!sortThreatsBySeriousness(ToDoList,Threats,SortedThreats)),
%% 	assertion(x == x).

%% test(do_ooda__7__generateContingencyPlansForSortedThreat) :-
%% 	solve(+!generateContingencyPlansForSortedThreat(ToDoList,SortedThreat,ContingencyPlans)),
%% 	assertion(x == x).

%% test(do_ooda__8__getLikelyEffectsOfContingencyPlan) :-
%% 	solve(+!getLikelyEffectsOfContingencyPlan(ToDoList,SortedThreat,ContingencyPlan,LikelyEffects)),
%% 	assertion(x == x).

%% test(do_ooda__9__applyLikelyEffectsToToDoList) :-
%% 	solve(+!applyLikelyEffectsToToDoList(ToDoList,SortedThreat,ContingencyPlan,LikelyEffects,NewToDoList)),
%% 	assertion(x == x).

:- end_tests('do_ooda').
