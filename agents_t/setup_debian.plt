:- begin_tests('setup_debian').

:- spami_load_agent([name('setup_debian'),file('/var/lib/myfrdcsa/codebases/minor/prolog-agent/attempts/3/autonomous_ai_agent/agents/setup_debian.pasl')]).

:- start_agent.

%% test(setup_debian__1__run) :-
%% 	solve(+!run(setup_debian,_Arguments,_Output)),
%% 	assertion(x == x).

:- end_tests('setup_debian').
