:- module(spami_remote_execution_docker,
	  [
	   create_sandbox_container/1,
	   get_container_state/2,
	   execute_container_command/3,
	   stop_container/1,
	   remove_container/1
	  ]).

:- use_module(library(process)).

% Create a new sandbox Docker container
create_sandbox_container(Container_ID) :-
	random_string(10, RandomSuffix),
	atomic_list_concat(['spami_sandbox_', RandomSuffix], Container_Name),
	process_create(path(docker), ['run', '-d', '--name', Container_Name, 'debian:bullseye'], [stdout(pipe(Out))]),
	read_string(Out, _, Container_ID),
	assert(docker_container(Container_ID, Container_Name)).

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
	retract(docker_container(Container_ID, _)).

% Remove a Docker container
remove_container(Container_ID) :-
	process_create(path(docker), ['rm', Container_ID], []),
	retract(docker_container(Container_ID, _)).

% Helper predicate to generate a random string
random_string(Length, String) :-
	length(Chars, Length),
	maplist(random_char, Chars),
	atom_chars(String, Chars).

random_char(Char) :-
	random_between(97, 122, Code), % ASCII codes for lowercase letters
	char_code(Char, Code).

%% This module provides the following predicates:

%% create_sandbox_container/1: Creates a new Docker container based on
%% the Debian Bullseye image and returns its ID.

%% get_container_state/2: Retrieves the current state of a container
%% (e.g., "running", "exited", etc.).

%% execute_container_command/3: Executes a command inside the
%% specified container and returns the output.

%% stop_container/1: Stops a running container.

%% remove_container/1: Removes a stopped container.

%% To use this module, you'll need to have Docker installed and
%% running on your system. The module assumes that the docker command
%% is available in the system path.





%% :- use_module(spami_remote_execution_docker).

%% example_usage :-
%%     % Create a new container
%%     create_sandbox_container(Container_ID),
%%     writeln('Created container: '), writeln(Container_ID),

%%     % Check the container state
%%     get_container_state(Container_ID, State),
%%     writeln('Container state: '), writeln(State),

%%     % Execute a command in the container
%%     execute_container_command(Container_ID, 'echo "Hello from Docker!"', Output),
%%     writeln('Command output: '), writeln(Output),

%%     % Stop and remove the container
%%     stop_container(Container_ID),
%%     remove_container(Container_ID).





%% This Docker-based implementation offers several advantages:

%% Lightweight: Docker containers are generally more lightweight than
%% full VMs.

%% Fast startup: Docker containers can start up much faster than VMs.

%% Resource efficiency: Docker containers share the host's kernel,
%% making them more resource-efficient.

%% Isolation: While not as isolated as VMs, Docker containers still
%% provide a good level of isolation for many use cases.

%% Remember to adjust your other modules (like web_navigation,
%% text_processing, etc.) to work with this Docker-based execution
%% environment. You may need to install additional tools or libraries
%% in the Docker container, which you can do by extending the
%% Dockerfile or running setup commands after creating the container.

%% Also, keep in mind that while Docker provides some level of
%% isolation, it's generally considered less secure than VMs for
%% running untrusted code. Make sure to implement appropriate security
%% measures, especially if you're executing code or commands from
%% untrusted sources.
