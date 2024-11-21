:- module(spami_remote_execution_vagrant,
	  [
	   do_command/2,
	   do_command_remote/2
	   %% create_sandbox_vm/1,
	   %% get_vm_state/2,
	   %% execute_remote_command/3
	  ]).

:- use_module(library(process)).

:- prolog_consult('/var/lib/myfrdcsa/codebases/minor/prolog-agent/attempts/3/shell_api.pl').

%% user:situatedHostHost(<HOST>).
%% user:situatedHostIP('<IP>').
%% user:situatedUsername(vagrant).
%% user:hasIPAddress(<HOST>,'<HOST>').

% hasUserNameOnSystem(<HOST>,<USER>,<USERNAME>).

do_command_remote(List,Result) :-
	atomic_list_concat(List,' ',ShellCommand),
	situatedUsername(UserName),
	situatedHostIP(IP),
	executeCommandOnSystemNative([server(IP),userName(UserName),command(ShellCommand)],Result).

do_command(List,String) :-
	atomic_list_concat(List,' ',ShellCommand),
	shell_command_to_string(ShellCommand,String).

%% % Create a new sandbox VM using Vagrant and LibVirt
%% create_sandbox_vm(VM_ID) :-
%% 	random_string(10, VM_ID),
%% 	process_create(path(vagrant), ['init', 'debian/bookworm64'], []),
%% 	process_create(path(vagrant), ['up', '--provider=libvirt'], []),
%% 	assert(vm(VM_ID)).

%% % Get the current state of a VM
%% get_vm_state(VM_ID, State) :-
%% 	vm(VM_ID),
%% 	process_create(path(vagrant), ['status'], [stdout(pipe(Out))]),
%% 	read_string(Out, _, StateStr),
%% 	parse_vagrant_status(StateStr, State).

%% % Execute a command on the remote VM using Perl REX
%% execute_remote_command(VM_ID, Command, Output) :-
%% 	vm(VM_ID),
%% 	atomic_list_concat(['rex', '-H', 'vagrant@localhost', '-u', 'vagrant', '-p', 'vagrant', Command], ' ', FullCommand),
%% 	shell(FullCommand, Status),
%% 	(   Status == 0 ->
%% 	    Output = success
%% 	;   Output = failure
%% 	).

%% % Helper predicate to generate a random string
%% random_string(Length, String) :-
%% 	length(Chars, Length),
%% 	maplist(random_char, Chars),
%% 	atom_chars(String, Chars).

%% random_char(Char) :-
%% 	random_between(97, 122, Code), % ASCII codes for lowercase letters
%% 	char_code(Char, Code).

%% % Helper predicate to parse Vagrant status output
%% parse_vagrant_status(StatusStr, State) :-
%% 	(   sub_string(StatusStr, _, _, _, "running") -> State = running
%% 	;   sub_string(StatusStr, _, _, _, "poweroff") -> State = poweroff
%% 	;   State = unknown
%% 	).
