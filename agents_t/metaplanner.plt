:- begin_tests('metaplanner').

:- spami_load_agent([name('metaplanner'),file('/var/lib/myfrdcsa/codebases/minor/prolog-agent/attempts/3/autonomous_ai_agent/agents/metaplanner.pasl')]).

:- start_agent.

%% test(metaplanner__1__run) :-
%% 	solve(+!run(metaplanner,[],[output([Results1,Results2])])),
%% 	assertion(x == x).

%% test(metaplanner__2__run) :-
%% 	solve(+!run(metaplanner,Arguments,[output([Results1,Results2])])),
%% 	assertion(x == x).

%% test(metaplanner__3__metaplan) :-
%% 	solve(+!metaplan(_IEMConfiguration,Results1,Results2)),
%% 	assertion(x == x).

:- end_tests('metaplanner').
