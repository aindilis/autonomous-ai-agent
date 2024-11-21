:- begin_tests('architect').

:- spami_load_agent([name('architect'),file('/var/lib/myfrdcsa/codebases/minor/prolog-agent/attempts/3/autonomous_ai_agent/agents/architect.pasl')]).

:- start_agent.

%% test(architect__1__run) :-
%% 	solve(+!run(architect,Arguments,_Output)),
%% 	assertion(x == x).

:- end_tests('architect').
