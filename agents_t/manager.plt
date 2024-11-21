:- begin_tests('manager').

:- spami_load_agent([name('manager'),file('/var/lib/myfrdcsa/codebases/minor/prolog-agent/attempts/3/autonomous_ai_agent/agents/manager.pasl')]).

:- start_agent.

%% test(manager__1__run) :-
%% 	solve(+!run(manager,_Arguments,_Output)),
%% 	assertion(x == x).

%% test(manager__2__say_msg) :-
%% 	solve(+!say_msg(Message,Results)),
%% 	assertion(x == x).

:- end_tests('manager').
