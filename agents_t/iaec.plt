:- begin_tests('iaec').

:- spami_load_agent([name('iaec'),file('/var/lib/myfrdcsa/codebases/minor/prolog-agent/attempts/3/autonomous_ai_agent/agents/iaec.pasl')]).

:- start_agent.

%% FIXME: have to somehow get this loaded after starting iaec, but
%% before running !run on iaec

test(iaec__1__test_addition) :-
	X is 2 + 2,
	assertion(X == 4).

test(iaec__2__test_subtraction) :-
	X is 6 - 2,
	assertion(X == 4).

test(iaec__3__investigate) :-
	solve(!investigate('/home/andrewdo/morbini-phd-thesis.pdf')),
	findall(X,isa(X,existingFilename),Filenames),
	assertion(Filenames == ['/home/andrewdo/morbini-phd-thesis.pdf']).

:- end_tests('iaec').
