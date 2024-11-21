:- begin_tests('system_implementor').

:- spami_load_agent([name('system_implementor'),file('/var/lib/myfrdcsa/codebases/minor/prolog-agent/attempts/3/autonomous_ai_agent/agents/system_implementor.pasl')]).

:- start_agent.

%% test(system_implementor__1__run) :-
%% 	solve(+!run(system_implementor,Arguments,Output)),
%% 	assertion(x == x).

%% test(system_implementor__2__implementSystem) :-
%% 	solve(+!implementSystem(Documents)),
%% 	assertion(x == x).

:- end_tests('system_implementor').
