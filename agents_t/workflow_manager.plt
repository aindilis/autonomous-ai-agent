:- begin_tests('workflow_manager').

:- spami_load_agent([name('workflow_manager'),file('/var/lib/myfrdcsa/codebases/minor/prolog-agent/attempts/3/autonomous_ai_agent/agents/workflow_manager.pasl')]).

:- start_agent.

%% test(workflow_manager__1__run) :-
%% 	solve(+!run(workflow_manager,_Arguments,_Output)),
%% 	assertion(x == x).

%% test(workflow_manager__2__workflow) :-
%% 	solve(+!workflow(User,Results)),
%% 	assertion(x == x).

:- end_tests('workflow_manager').
