:- begin_tests('mush').

:- spami_load_agent([name('mush'),file('/var/lib/myfrdcsa/codebases/minor/prolog-agent/attempts/3/autonomous_ai_agent/agents/mush.pasl')]).

:- start_agent.

%% test(mush__1__run) :-
%% 	solve(+!run(mush,Arguments,Ouptut)),
%% 	assertion(x == x).

%% test(mush__2__describeError) :-
%% 	solve(+!describeError(Filename)),
%% 	assertion(x == x).

:- end_tests('mush').
