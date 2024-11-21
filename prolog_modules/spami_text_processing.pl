:- module(spami_text_processing, [
				  extract_text_from_url/3
				 ]).

:- use_module(spami_remote_execution).

% Extract text content from a URL
extract_text_from_url(VM_ID, URL, Text) :-
	atomic_list_concat(['curl -L -s ', URL, ' | html2text'], Command),
	execute_remote_command(VM_ID, Command, Output),
	(   Output == success ->
	    get_command_output(VM_ID, Text)
	;   Text = ''
	).

% Helper predicate to get command output
get_command_output(VM_ID, Output) :-
	execute_remote_command(VM_ID, 'cat /tmp/last_command_output', Output).