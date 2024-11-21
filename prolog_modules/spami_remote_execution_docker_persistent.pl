:- module(spami_remote_execution_docker_persistent,
	  [
	   create_sandbox_container/1,
	   get_container_state/2,
	   execute_container_command/3,
	   stop_container/1,
	   remove_container/1,
	   list_containers/1
	  ]).

:- use_module(library(process)).

:- dynamic docker_container/2.

% File to store container information
:- multifile user:file_search_path/2.

user:file_search_path(data, '.').

:- absolute_file_name(data(spami_containers), ContainerFile, [access(write)]),
	asserta(container_file(ContainerFile)).

% Load existing containers on module load
:- initialization(load_containers).

% Create a new sandbox Docker container
create_sandbox_container(Container_ID) :-
	random_string(10, RandomSuffix),
	atomic_list_concat(['spami_sandbox_', RandomSuffix], Container_Name),
	process_create(path(docker), ['run', '-d', '--name', Container_Name, 'debian:bullseye'], [stdout(pipe(Out))]),
	read_string(Out, _, Container_ID),
	assert(docker_container(Container_ID, Container_Name)),
	save_containers.

% Get the current state of a Docker container
get_container_state(Container_ID, State) :-
	docker_container(Container_ID, _),
	process_create(path(docker), ['inspect', '-f', '{{.State.Status}}', Container_ID], [stdout(pipe(Out))]),
	read_string(Out, _, StateStr),
	string_trim(StateStr, State).

% Execute a command in the Docker container
execute_container_command(Container_ID, Command, Output) :-
	docker_container(Container_ID, _),
	process_create(path(docker), ['exec', Container_ID, 'sh', '-c', Command], 
		       [stdout(pipe(Out)), stderr(pipe(Err))]),
	read_string(Out, _, OutStr),
	read_string(Err, _, ErrStr),
	atomic_list_concat([OutStr, ErrStr], '\n', Output).

% Stop a Docker container
stop_container(Container_ID) :-
	docker_container(Container_ID, _),
	process_create(path(docker), ['stop', Container_ID], []),
	retract(docker_container(Container_ID, _)),
	save_containers.

% Remove a Docker container
remove_container(Container_ID) :-
	process_create(path(docker), ['rm', Container_ID], []),
	retract(docker_container(Container_ID, _)),
	save_containers.

% List all known containers
list_containers(Containers) :-
	findall(container(ID, Name), docker_container(ID, Name), Containers).

% Helper predicate to generate a random string
random_string(Length, String) :-
	length(Chars, Length),
	maplist(random_char, Chars),
	atom_chars(String, Chars).

random_char(Char) :-
	random_between(97, 122, Code), % ASCII codes for lowercase letters
	char_code(Char, Code).

% Save container information to file
save_containers :-
	container_file(File),
	open(File, write, Stream),
	forall(docker_container(ID, Name),
	       (   format(Stream, '~w,~w~n', [ID, Name]))),
	close(Stream).

% Load container information from file
load_containers :-
	container_file(File),
	(   exists_file(File) ->
	    open(File, read, Stream),
	    read_containers(Stream),
	    close(Stream)
	;   true).

read_containers(Stream) :-
	read_line_to_string(Stream, Line),
	(   Line \== end_of_file ->
	    split_string(Line, ",", "", [ID, Name]),
	    assertz(docker_container(ID, Name)),
	    read_containers(Stream)
	;   true).




%% This improved version includes several changes to ensure
%% persistence:

%% We use a file (spami_containers) to store information about created
%% containers.

%% The save_containers/0 predicate writes the current state of
%% containers to the file whenever a container is created, stopped, or
%% removed.

%% The load_containers/0 predicate reads the container information
%% from the file when the module is loaded.

%% We've added a list_containers/1 predicate to easily retrieve all
%% known containers.

%% The container_file/1 predicate is used to store the path to the
%% container information file. You can adjust the file location by
%% modifying the user:file_search_path/2 fact.

%% With these changes, the container information will persist across
%% different invocations of your agent. When the agent starts, it will
%% load the existing container information, and it will update this
%% information as containers are created, stopped, or removed.







%% :- use_module(spami_remote_execution_docker_persistent).

%% example_usage :-
%%     % List existing containers
%%     list_containers(ExistingContainers),
%%     writeln('Existing containers:'), writeln(ExistingContainers),

%%     % Create a new container if none exist
%%     (ExistingContainers = [] ->
%%         create_sandbox_container(Container_ID),
%%         writeln('Created new container: '), writeln(Container_ID)
%%     ;   [container(Container_ID, _)|_] = ExistingContainers,
%%         writeln('Using existing container: '), writeln(Container_ID)
%%     ),

%%     % Check the container state
%%     get_container_state(Container_ID, State),
%%     writeln('Container state: '), writeln(State),

%%     % Execute a command in the container
%%     execute_container_command(Container_ID, 'echo "Hello from Docker!"', Output),
%%     writeln('Command output: '), writeln(Output).

%%     % Note: We're not stopping or removing the container here to demonstrate persistence
