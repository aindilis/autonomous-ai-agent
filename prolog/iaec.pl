%% SPAMI helper functions

unknown(Statement) :-
	not(belief(Statement,[source(self)])),
	not(belief(~Statement,[source(self)])).

%% Application Logic

executable_file(A) :-
	access_file(A,execute).

has_filename_extension(A,B) :-
	file_name_extension(_,B,A).

has_mime_type(A,B) :-
	shell_quote_term(A,QA),
	atomic_list_concat(['file -b --mime-type',QA],' ',Command),
	shell_command_to_string(Command,String),
	atom_string(String,Atom),
	strip_outer_whitespace(Atom,B).

has_corresponding_text_file(A,B) :-
	file_name_extension(C,pdf,A),
	atomic_list_concat([C,'.txt'],'',B).

has_character_count(A,B) :-
	shell_quote_term(A,QA),
	atomic_list_concat(['wc -m ',QA],' ',Command),
	shell_command_to_string(Command,String),
	split_string(String,' ',[],[Substring|Rest]),
	atom_string(Substring,Atom),
	strip_outer_whitespace(Atom,BAtom),
	ensure_number(BAtom,B).
	
fewer_characters_than(N,M) :-
	ensure_number(N,N0),
	ensure_number(M,M0),
	N0 < M0.
	
exists_symlink(A) :-
	absolute_file_name(A,B),
	B \= A.

%% %% DONE: FIXME: use `file -b --mimetype <FILENAME>`, instead, so we
%% %% don't %% have to clip the result

%% has_mime_type_orig(A,B) :-
%% 	shell_quote_term(A,QA),b
%% 	atomic_list_concat(['file --mime-type',QA],' ',Command),
%% 	shell_command_to_string(Command,String),
%% 	atom_string(String,Atom),
%% 	regex_atom('^.+:(.+)$',[s],Atom,[Codes]),
%% 	atom_codes(TmpB,Codes),
%% 	strip_outer_whitespace(TmpB,B).


%% Ontology of Tests

%% what are all prolog predicates that take filenames as arguments,
%% for instance? Also translate ELisp function predicates to Prolog
%% and use those. Or just call Emacs with them. Maybe need a
%% stationary Emacs that I don't use but that is called via Unilang.


%% Configuration

currentLLM(mistralInstruct7B).

llmHasMaximumContext(mistralInstruct7B,32768).

stomping_read_text_from_file(A,B) :-
	shell_quote_term(A,QA),
	atomic_list_concat(['cat',
			    QA,
			    '|',
			    '/var/lib/myfrdcsa/codebases/internal/perllib/scripts/pen-strip-ansi',
			    '|',
			    '/var/lib/myfrdcsa/codebases/internal/kmax/scripts/kmax-stomp-preserving-whitespace-annotations'
			   ],' ',Command),
	shell_command_to_string(Command,B).
