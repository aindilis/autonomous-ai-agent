:- begin_tests('svrs').

:- spami_load_agent([name('svrs'),file('/var/lib/myfrdcsa/codebases/minor/prolog-agent/attempts/3/autonomous_ai_agent/agents/svrs.pasl')]).

:- start_agent.

%% test(svrs__1__run) :-
%% 	solve(+!run(svrs,Arguments,Ouptut)),
%% 	assertion(x == x).

:- end_tests('svrs').
