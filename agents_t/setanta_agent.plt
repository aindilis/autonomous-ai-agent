:- begin_tests('setanta_agent').

:- spami_load_agent([name('setanta_agent'),file('/var/lib/myfrdcsa/codebases/minor/prolog-agent/attempts/3/autonomous_ai_agent/agents/setanta_agent.pasl')]).

:- start_agent.

%% test(setanta_agent__1__run) :-
%% 	solve(+!run(setanta_agent,Arguments,Ouptut)),
%% 	assertion(x == x).

%% test(setanta_agent__2__map_network) :-
%% 	solve(+!map_network(NetworkMap)),
%% 	assertion(x == x).

%% test(setanta_agent__3__secure_computer) :-
%% 	solve(+!secure_computer(Machine)),
%% 	assertion(x == x).

%% test(setanta_agent__4__ensure_computer_functioning) :-
%% 	solve(+!ensure_computer_functioning(Machine)),
%% 	assertion(x == x).

%% test(setanta_agent__5__shred_data_drive) :-
%% 	solve(+!shred_data_drive(Machine,Drive)),
%% 	assertion(x == x).

%% test(setanta_agent__6__optimize_computer) :-
%% 	solve(+!optimize_computer(Machine)),
%% 	assertion(x == x).

%% test(setanta_agent__7__run_integrity_checks) :-
%% 	solve(+!run_integrity_checks(Machine)),
%% 	assertion(x == x).

:- end_tests('setanta_agent').
