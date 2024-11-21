:- begin_tests('executive_function_assistant').

:- spami_load_agent([name('executive_function_assistant'),file('/var/lib/myfrdcsa/codebases/minor/prolog-agent/attempts/3/autonomous_ai_agent/agents/executive_function_assistant.pasl')]).

:- start_agent.

%% test(executive_function_assistant__1__run) :-
%% 	solve(+!run(enhanced_executive_function, Arguments, Output)),
%% 	assertion(x == x).

%% test(executive_function_assistant__2__parse_knowledge_update) :-
%% 	solve(+!parse_knowledge_update(Update, Key, Value)),
%% 	assertion(x == x).

:- end_tests('executive_function_assistant').
