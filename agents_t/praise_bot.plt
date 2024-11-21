:- begin_tests('praise_bot').

:- spami_load_agent([name('praise_bot'),file('/var/lib/myfrdcsa/codebases/minor/prolog-agent/attempts/3/autonomous_ai_agent/agents/praise_bot.pasl')]).

:- start_agent.

%% test(praise_bot__1__run) :-
%% 	solve(+!run(praise_bot,_Arguments,_Output)),
%% 	assertion(x == x).

%% test(praise_bot__2__playReward) :-
%% 	solve(+!playReward(accomplishment)),
%% 	assertion(x == x).

:- end_tests('praise_bot').
