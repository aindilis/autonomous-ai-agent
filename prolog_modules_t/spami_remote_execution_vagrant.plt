:- begin_tests('spami_remote_execution_vagrant').

:- use_module('/var/lib/myfrdcsa/codebases/minor/prolog-agent/attempts/3/autonomous_ai_agent/prolog_modules/spami_remote_execution_vagrant.pl').
:- use_module(library(debug)).

:- start_agent.

%% UNIT TESTS

user:situatedHostHost(<HOST>).
user:situatedHostIP('<IP>').
user:hasIPAddress(<HOST>,'<IP>').

test(ping_host) :-
	situatedHostIP(IP),
	do_command(['check-whether-host-is-up.pl','-h',IP],Result),
	assertion(Result == 'accessible').

test(pwd) :-
	situatedHostHost(Host),
	executeCommandOnSystem(loginFn(<USERNAME>,Host),[pwd],Result),
	assertion(Result == '<HOME>').

%% test(ls_tmp) :-
%% 	situatedHostHost(Host),
%% 	executeCommandOnSystem(loginFn(<USERNAME>,Host),[ls,' ','/tmp'],Result),
%% 	assertion(Result == '<HOME>').

test(pwd_native) :-
	executeCommandOnSystemNative([server('<IP>'),userName('<USERNAME>'),command('pwd')],Result),
	assertion(Result == '<HOME>').

%% test(pwd_native_5) :-
%% 	findnsols(5,Result,executeCommandOnSystemNative([server('<IP>'),userName('<USERNAME>'),command('pwd')],Result),Results),
%% 	view([results,Results]),
%% 	assertion(1 == 1).

test(ls_tmp_native) :-
	executeCommandOnSystemNative([server('<IP>'),userName('<USERNAME>'),command('ls /tmp')],Result),
	assertion(1 == 1).

%% %% FIXME: Need to fix REX to stay logged in, using
%% perl5_connection.pl, this currently takes WAYYYYY too long per
%% command:

%% INTEGRATION TESTS

:- end_tests('spami_remote_execution_vagrant').
