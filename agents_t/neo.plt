:- begin_tests('neo').

:- spami_load_agent([name('neo'),file('/var/lib/myfrdcsa/codebases/minor/prolog-agent/attempts/3/autonomous_ai_agent/agents/neo.pasl')]).

:- start_agent.

%% test(neo__1__run) :-
%% 	solve(+!run(neo,Arguments,_Output)),
%% 	assertion(x == x).

%% test(neo__2__agentLoaded) :-
%% 	solve(+agentLoaded(Agent)),
%% 	assertion(x == x).

:- end_tests('neo').
