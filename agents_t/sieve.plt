:- begin_tests('sieve').

:- spami_load_agent([name('sieve'),file('/var/lib/myfrdcsa/codebases/minor/prolog-agent/attempts/3/autonomous_ai_agent/agents/sieve.pasl')]).

:- start_agent.

%% test(sieve__1__run) :-
%% 	solve(+!run(sieve,[],_Output)),
%% 	assertion(x == x).

%% test(sieve__2__run) :-
%% 	solve(+!run(sieve,Arguments,_Output)),
%% 	assertion(x == x).

:- end_tests('sieve').
