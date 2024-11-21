:- begin_tests('softbot1').

:- spami_load_agent([name('softbot1'),file('/var/lib/myfrdcsa/codebases/minor/prolog-agent/attempts/3/autonomous_ai_agent/agents/softbot1.pasl')]).

:- start_agent.

%% test(softbot1__1__run) :-
%% 	solve(+!run(softbot1,Arguments,Output)),
%% 	assertion(x == x).

%% test(softbot1__2__test_check_and_run) :-
%% 	solve(+!test_check_and_run(Result)),
%% 	assertion(x == x).

%% test(softbot1__3__server_is_online_p) :-
%% 	solve(+!server_is_online_p(Server)),
%% 	assertion(x == x).

%% test(softbot1__4__serverOnline) :-
%% 	solve(+serverOnline(Server)),
%% 	assertion(x == x).

%% test(softbot1__5__serverNotOnline) :-
%% 	solve(+serverNotOnline(Server)),
%% 	assertion(x == x).

%% test(softbot1__6__explore_fs) :-
%% 	solve(+!explore_fs(Directory)),
%% 	assertion(x == x).

%% test(softbot1__7__readManPage) :-
%% 	solve(+!readManPage(Object,ManPage)),
%% 	assertion(x == x).

%% test(softbot1__8__generateShellCommandUsingDocumentation) :-
%% 	solve(+!generateShellCommandUsingDocumentation(Introduction,ShellCommand,Question,Output)),
%% 	assertion(x == x).

%% test(softbot1__9__getHelpForCommand) :-
%% 	solve(+!getHelpForCommand(Command,Help)),
%% 	assertion(x == x).

%% test(softbot1__10__test_bs) :-
%% 	solve(+!test_bs(Message)),
%% 	assertion(x == x).

%% test(softbot1__11__test_plan_failure) :-
%% 	solve(+!test_plan_failure(Message)),
%% 	assertion(x == x).

%% test(softbot1__12__add_belief_test) :-
%% 	solve(+!add_belief_test(Bs)),
%% 	assertion(x == x).

:- end_tests('softbot1').
