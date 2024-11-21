:- begin_tests('audience').

:- spami_load_agent([name('audience'),file('/var/lib/myfrdcsa/codebases/minor/prolog-agent/attempts/3/autonomous_ai_agent/agents/audience.pasl')]).

:- start_agent.

%% test(audience__1__run) :-
%% 	solve(+!run(audience,_Arguments,_Output)),
%% 	assertion(x == x).

%% test(audience__2__ensureNotPromosm) :-
%% 	solve(+!ensureNotPromosm(Content)),
%% 	assertion(x == x).

:- end_tests('audience').
