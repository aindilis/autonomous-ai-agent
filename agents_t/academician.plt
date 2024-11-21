:- begin_tests('academician').

:- spami_load_agent([name('academician'),file('/var/lib/myfrdcsa/codebases/minor/prolog-agent/attempts/3/autonomous_ai_agent/agents/academician.pasl')]).

:- start_agent.

%% test(academician__1__run) :-
%% 	solve(+!run(academician,_Arguments,_Output)),
%% 	assertion(x == x).

%% test(academician__2__study) :-
%% 	solve(+!study(User,Results)),
%% 	assertion(x == x).

%% test(academician__3__read_man_page) :-
%% 	solve(+!read_man_page(Atom,ManPage)),
%% 	assertion(x == x).

%% test(academician__4__academicianInvestigate) :-
%% 	solve(+!academicianInvestigate(Document)),
%% 	assertion(x == x).

:- end_tests('academician').
