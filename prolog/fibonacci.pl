normalize_whitespace(Input, Output) :-
    atom_chars(Input, Chars),
    normalize_chars(Chars, NormalizedChars),
    atom_chars(Output, NormalizedChars).

normalize_chars([], []).
normalize_chars([C|Cs], [C|NCs]) :-
    \+ char_type(C, white),
    normalize_chars(Cs, NCs).
normalize_chars([C|Cs], [' '|NCs]) :-
    char_type(C, white),
    skip_whitespace(Cs, RemainingCs),
    normalize_chars(RemainingCs, NCs).

skip_whitespace([], []).
skip_whitespace([C|Cs], RemainingCs) :-
    (char_type(C, white) ->
        skip_whitespace(Cs, RemainingCs)
    ;
        RemainingCs = [C|Cs]
    ).


strip_whitespace(Input, Output) :-
    atom_chars(Input, Chars),
    strip_chars(Chars, StrippedChars),
    atom_chars(Output, StrippedChars).

strip_chars(Chars, StrippedChars) :-
    skip_leading_whitespace(Chars, NoLeadingChars),
    reverse(NoLeadingChars, ReversedChars),
    skip_leading_whitespace(ReversedChars, ReversedStrippedChars),
    reverse(ReversedStrippedChars, StrippedChars).

skip_leading_whitespace([], []).
skip_leading_whitespace([C|Cs], Cs) :-
    char_type(C, white),
    !,
    skip_leading_whitespace(Cs, Cs).
skip_leading_whitespace(Cs, Cs).