:- begin_tests('util1').

:- spami_load_agent([name('util1'),file('/var/lib/myfrdcsa/codebases/minor/prolog-agent/attempts/3/autonomous_ai_agent/lib/util1.pasl')]).

:- start_agent.

%% FIXME: have to somehow get this loaded after starting iaec, but
%% before running !run on iaec

test(test_addition) :-
	X is 2 + 2,
	assertion(X == 4).

test(test_subtraction) :-
	X is 6 - 2,
	assertion(X == 4).

test(investigate_a_file) :-
	solve(!investigate('/home/andrewdo/morbini-phd-thesis.pdf')),
	findall(X,isa(X,existingFilename),Filenames),
	assertion(Filenames == ['/home/andrewdo/morbini-phd-thesis.pdf']).

:- end_tests('util1').
