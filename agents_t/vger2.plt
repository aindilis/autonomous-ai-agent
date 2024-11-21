:- begin_tests('vger2').

:- spami_load_agent([name('vger2'),file('/var/lib/myfrdcsa/codebases/minor/prolog-agent/attempts/3/autonomous_ai_agent/agents/vger2.pasl')]).

:- start_agent.

%% test(vger2__1__run) :-
%% 	solve(+!run(vger2,Arguments,_Output)),
%% 	assertion(x == x).

%% test(vger2__2__acquireSoftware) :-
%% 	solve(+!acquireSoftware(Name)),
%% 	assertion(x == x).

:- end_tests('vger2').
