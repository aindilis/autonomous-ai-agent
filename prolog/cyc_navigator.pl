:- dynamic study/1.

:- use_module('/var/lib/myfrdcsa/codebases/minor/flp-cyc/cyc/cyc_client.pl').

%% /var/lib/myfrdcsa/codebases/minor/free-life-planner/lib/util/util.pl

ensure_string(Item,S) :-
	ensure_atom(Item,A),
	atom_string(A,S).

cycConstantP(Item) :-
	ensure_string(Item,String),
	(   cyclifiedCycConstantP(String) -> true ;
	    (	uncyclifiedCycConstantP(String) -> true ; fail)).

cyclifiedCycConstantP(Item) :-
	ensure_string(Item,String),
	atom_concat('#$',String2,String),
	uncyclifiedCycConstantP(String2).

uncyclifiedCycConstantP(Item) :-
	ensure_string(Item,String),
	valid_cyc_constant(String).

valid_cyc_constant(String) :-
	string(String),
	string_chars(String, Chars),
	Chars = [First|Rest],
	first_char_valid(First),
	rest_chars_valid(Rest).

first_char_valid(C) :-
	char_type(C, alpha).

rest_chars_valid([]).
rest_chars_valid([C|Rest]) :-
	(   char_type(C, alnum);
	    char_type(C, space);
	    member(C, ['_', '-', ':', '.', '/', '#', '$', '@', '%', '^', '*', '+', '=', '<', '>', '~'])),
	rest_chars_valid(Rest).

% Example usage:
% ?- valid_cyc_constant("Dog").          % true
% ?- valid_cyc_constant("big-dog").      % true
% ?- valid_cyc_constant("123dog").       % false
% ?- valid_cyc_constant("").             % false
% ?- valid_cyc_constant("Dog Space").    % true
% ?- valid_cyc_constant("@special").     % false

add_to_study_agenda(Elt) :-
	(   not(study(Elt)) -> assertz(study(Elt))).
