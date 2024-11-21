:- begin_tests('packager').

:- spami_load_agent([name('packager'),file('/var/lib/myfrdcsa/codebases/minor/prolog-agent/attempts/3/autonomous_ai_agent/agents/packager.pasl')]).

:- start_agent.

%% test(packager__1__run) :-
%% 	solve(+!run(packager,_Arguments,_Output)),
%% 	assertion(x == x).

%% test(packager__2__package) :-
%% 	solve(+!package(systemFn(Name,Version))),
%% 	assertion(x == x).

%% test(packager__3__package) :-
%% 	solve(+!package(systemFn(Name,Version))),
%% 	assertion(x == x).

%% test(packager__4__sandbox) :-
%% 	solve(+!sandbox(System)),
%% 	assertion(x == x).

%% test(packager__5__sandbox) :-
%% 	solve(+!sandbox(System)),
%% 	assertion(x == x).

%% test(packager__6__sandboxDebian) :-
%% 	solve(+!sandboxDebian(System)),
%% 	assertion(x == x).

%% test(packager__7__sandboxDebian) :-
%% 	solve(+!sandboxDebian(System)),
%% 	assertion(x == x).

:- end_tests('packager').
