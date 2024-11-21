:- module(spami_safety_protocols, [
				   is_safe_action/1,
				   log_unsafe_action/1
				  ]).

% Check if an action is safe
is_safe_action(Action) :-
	\+ unsafe_action(Action).

% Define unsafe actions
unsafe_action(execute(_)).
unsafe_action(delete(_)).
unsafe_action(modify_system_files).

% Log unsafe actions
log_unsafe_action(Action) :-
	get_time(Timestamp),
	atomic_list_concat(['Unsafe action attempted: ', Action, ' at ', Timestamp], LogMessage),
	open('unsafe_actions.log', append, Stream),
	write(Stream, LogMessage),
	nl(Stream),
	close(Stream).
