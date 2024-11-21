getAllAssertionsForFile(File,Assertions) :-
	setof(C,File^Clauses^(getFileClauses(File,Clauses),member(C,Clauses)),Assertions).

getAllAssertionsForFileConvertFacts(File,Assertions) :-
        getAllAssertionsForFile(File,Clauses),
        findall(FactOrClause,
                (
                    member(Clause,Clauses),
                    (   Clause = ':-'(Fact,true) -> FactOrClause = Fact ; FactOrClause = Clause)
                ),
                Assertions).
