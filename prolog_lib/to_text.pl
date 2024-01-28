:- prolog_ensure_loaded('/var/lib/myfrdcsa/codebases/minor/prolog-agent/attempts/3/apis/perl5_connection.pl').

%% see also 
%% /var/lib/myfrdcsa/codebases/minor/prolog-agent/attempts/3/modules/perllib_cacher.pl
%% /var/lib/myfrdcsa/codebases/minor/formalog/unilang.pl

to_text(HTMLString,Text) :-
	view([to_text(HTMLString,Text)]),
	AgentName = 'Prolog-Agent-Agent1',
	FormalogName = 'Prolog-Agent-Yaswi1',
	connectToPerl5(AgentName,FormalogName,'PerlLib::ToText',[],ToText),
	view([toText,ToText]),
	perl5_method(ToText,'ToText',['String',HTMLString],Text).

