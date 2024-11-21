:- begin_tests('api_learner').

:- spami_load_agent([name('api_learner'),file('/var/lib/myfrdcsa/codebases/minor/prolog-agent/attempts/3/autonomous_ai_agent/agents/api_learner.pasl')]).

:- start_agent.

%% test(api_learner__1__run) :-
%% 	solve(+!run(api_learner,Arguments,Output)),
%% 	assertion(x == x).

%% test(api_learner__2__test_cyc_connection) :-
%% 	solve(+!test_cyc_connection(Retval)),
%% 	assertion(x == x).

:- end_tests('api_learner').
