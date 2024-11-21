:- begin_tests('freekbs2').

:- spami_load_library([name('freekbs2'),file('/var/lib/myfrdcsa/codebases/minor/prolog-agent/attempts/3/autonomous_ai_agent/lib/freekbs2.pasl')]).

:- spami_load_library([name('util1'),file('/var/lib/myfrdcsa/codebases/minor/prolog-agent/attempts/3/autonomous_ai_agent/lib/util1.pasl')]).

%% see /var/lib/myfrdcsa/codebases/minor/prolog-agent/attempts/3/autonomous_ai_agent/prolog_lib/freekbs2.pl

:- use_module(library(debug)).

:- start_agent.

test(query1) :-
	findall(belief(a(X),Y),belief(a(X),Y),Xs),
	length(Xs,0).

%% %% From Prolog:
%% fassert_argt('Prolog-Agent-Agent1','Prolog-Agent-Yaswi1',[term(mt_assertion('PrologAgent',a(b))),context('Org::FRDCSA::PrologAgent::FreeKBS2::Test')],Result1)

test(kbs_assert) :-
	Mt = 'PrologAgent',
	solve(!kbsAssert('Prolog-Agent-Agent1','Prolog-Agent-Yaswi1',[term(mt_assertion(Mt,a(b))),context('Org::FRDCSA::PrologAgent::FreeKBS2::Test')],Result1)).

%% %% From Prolog:

%% (findall(istAsserted(Mt,a(X)),istAsserted(Mt,a(X)),Xs),length(Xs,Y))

test(query2) :-
	findall(belief(a(X),Y),belief(a(X),Y),Xs),
	length(Xs,1).

%% %% From Prolog:

%% funassert_argt('Prolog-Agent-Agent1','Prolog-Agent-Yaswi1',[term(mt_assertion('PrologAgent',a(b))),context('Org::FRDCSA::PrologAgent::FreeKBS2::Test')],Result1)

test(kbs_unassert) :-
	Mt = 'PrologAgent',
	solve(!kbsUnassert('Prolog-Agent-Agent1','Prolog-Agent-Yaswi1',[term(mt_assertion(Mt,a(b))),context('Org::FRDCSA::PrologAgent::FreeKBS2::Test')],Result1)).

test(query3) :-
	findall(belief(a(X),Y),belief(a(X),Y),Xs),
	length(Xs,0).

:- end_tests('freekbs2').
