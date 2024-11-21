:- begin_tests('suasion').

:- spami_load_agent([name('suasion'),file('/var/lib/myfrdcsa/codebases/minor/prolog-agent/attempts/3/autonomous_ai_agent/agents/suasion.pasl')]).

:- start_agent.

%% test(suasion__1__run) :-
%% 	solve(+!run(suasion,Arguments,_Output)),
%% 	assertion(x == x).

%% test(suasion__2__goal) :-
%% 	solve(+goal(persuade(Agent1,Agent2,Conclusion))),
%% 	assertion(x == x).

%% test(suasion__3__ensureNotPromosm) :-
%% 	solve(+!ensureNotPromosm(Content)),
%% 	assertion(x == x).

:- end_tests('suasion').
