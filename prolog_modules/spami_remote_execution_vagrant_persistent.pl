:- module(spami_remote_execution_vagrant_persistent,
	  [
	   create_sandbox_vm/1,
	   get_vm_state/2,
	   execute_remote_command/3,
	   stop_vm/1,
	   destroy_vm/1,
	   list_vms/1
	  ]).

:- use_module(library(process)).

:- dynamic vagrant_vm/2.

% File to store VM information
:- multifile user:file_search_path/2.

user:file_search_path(data, '.').

:- absolute_file_name(data(spami_vagrant_vms), VMFile, [access(write)]),
	asserta(vm_file(VMFile)).

% Load existing VMs on module load
:- initialization(load_vms).

% Create a new sandbox VM using Vagrant and LibVirt
create_sandbox_vm(VM_ID) :-
	random_string(10, RandomSuffix),
	atomic_list_concat(['spami_sandbox_', RandomSuffix], VM_Name),
	setup_vagrant_environment(VM_Name),
	process_create(path(vagrant), ['up', '--provider=libvirt'], [cwd(VM_Name)]),
	assert(vagrant_vm(VM_ID, VM_Name)),
	save_vms.

% Get the current state of a VM
get_vm_state(VM_ID, State) :-
	vagrant_vm(VM_ID, VM_Name),
	process_create(path(vagrant), ['status'], [stdout(pipe(Out)), cwd(VM_Name)]),
	read_string(Out, _, StateStr),
	parse_vagrant_status(StateStr, State).

% Execute a command on the remote VM using Perl REX
execute_remote_command(VM_ID, Command, Output) :-
	vagrant_vm(VM_ID, VM_Name),
	process_create(path(rex), [
				   '-H', 'vagrant@localhost',
				   '-u', 'vagrant',
				   '-p', 'vagrant',
				   '-E', Command
				  ], [stdout(pipe(Out)), stderr(pipe(Err)), cwd(VM_Name)]),
	read_string(Out, _, OutStr),
	read_string(Err, _, ErrStr),
	atomic_list_concat([OutStr, ErrStr], '\n', Output).

% Stop a Vagrant VM
stop_vm(VM_ID) :-
	vagrant_vm(VM_ID, VM_Name),
	process_create(path(vagrant), ['halt'], [cwd(VM_Name)]).

% Destroy a Vagrant VM
destroy_vm(VM_ID) :-
	vagrant_vm(VM_ID, VM_Name),
	process_create(path(vagrant), ['destroy', '-f'], [cwd(VM_Name)]),
	retract(vagrant_vm(VM_ID, VM_Name)),
	save_vms.

% List all known VMs
list_vms(VMs) :-
	findall(vm(ID, Name), vagrant_vm(ID, Name), VMs).

% Helper predicate to generate a random string
random_string(Length, String) :-
	length(Chars, Length),
	maplist(random_char, Chars),
	atom_chars(String, Chars).

random_char(Char) :-
	random_between(97, 122, Code), % ASCII codes for lowercase letters
	char_code(Char, Code).

% Helper predicate to parse Vagrant status output
parse_vagrant_status(StatusStr, State) :-
	(   sub_string(StatusStr, _, _, _, "running") -> State = running
	;   sub_string(StatusStr, _, _, _, "poweroff") -> State = poweroff
	;   State = unknown
	).

% Setup Vagrant environment
setup_vagrant_environment(VM_Name) :-
	make_directory(VM_Name),
	setup_vagrantfile(VM_Name).

% Create Vagrantfile
setup_vagrantfile(VM_Name) :-
	atomic_list_concat([VM_Name, '/Vagrantfile'], Filename),
	open(Filename, write, Stream),
	write(Stream, 'Vagrant.configure("2") do |config|\n'),
	write(Stream, '  config.vm.box = "debian/bullseye64"\n'),
	write(Stream, '  config.vm.provider :libvirt do |libvirt|\n'),
	write(Stream, '    libvirt.memory = 1024\n'),
	write(Stream, '    libvirt.cpus = 1\n'),
	write(Stream, '  end\n'),
	write(Stream, 'end\n'),
	close(Stream).

% Save VM information to file
save_vms :-
	vm_file(File),
	open(File, write, Stream),
	forall(vagrant_vm(ID, Name),
	       (   format(Stream, '~w,~w~n', [ID, Name]))),
	close(Stream).

% Load VM information from file
load_vms :-
	vm_file(File),
	(   exists_file(File) ->
	    open(File, read, Stream),
	    read_vms(Stream),
	    close(Stream)
	;   true).

read_vms(Stream) :-
	read_line_to_string(Stream, Line),
	(   Line \== end_of_file ->
	    split_string(Line, ",", "", [ID, Name]),
	    assertz(vagrant_vm(ID, Name)),
	    read_vms(Stream)
	;   true).



%% This updated version includes several changes to ensure persistence:

%% We use a file (spami_vagrant_vms) to store information about created
%% VMs.

%% The save_vms/0 predicate writes the current state of VMs to the file
%% whenever a VM is created or destroyed.

%% The load_vms/0 predicate reads the VM information from the file when
%% the module is loaded.

%% We've added a list_vms/1 predicate to easily retrieve all known VMs.

%% The vm_file/1 predicate is used to store the path to the VM
%% information file. You can adjust the file location by modifying the
%% user:file_search_path/2 fact.

%% The setup_vagrant_environment/1 and setup_vagrantfile/1 predicates are
%% added to create a new Vagrant environment for each VM.




%% :- use_module(spami_remote_execution).

%% example_usage :-
%% % List existing VMs
%% 	list_vms(ExistingVMs),
%% 	writeln('Existing VMs:'), writeln(ExistingVMs),

%% % Create a new VM if none exist
%% 	(   ExistingVMs = [] ->
%% 	    create_sandbox_vm(VM_ID),
%% 	    writeln('Created new VM: '), writeln(VM_ID)
%% 	;   [vm(VM_ID, _)|_] = ExistingVMs,
%% 	    writeln('Using existing VM: '), writeln(VM_ID)
%% 	),

%% % Check the VM state
%% 	get_vm_state(VM_ID, State),
%% 	writeln('VM state: '), writeln(State),

%% % Execute a command in the VM
%% 	execute_remote_command(VM_ID, 'echo "Hello from Vagrant VM!"', Output),
%% 	writeln('Command output: '), writeln(Output).

%% % Note: We're not stopping or destroying the VM here to demonstrate persistence





%% This approach ensures that your agent can keep track of Vagrant VMs
%% across multiple runs, providing a more robust and persistent execution
%% environment. The VMs are created in separate directories named after
%% their VM_Name, which allows for better organization and isolation.

%% Remember to have Vagrant, LibVirt, and Perl REX installed on your
%% system for this to work. Also, you might need to adjust paths or
%% commands based on your specific Debian setup.