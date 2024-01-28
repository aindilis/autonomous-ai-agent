:- use_module(library(inotify)).

mush_inotify_main :-
	mushDirectoriesToWatch(Dirs),
	mush_print_events(Dirs).

mush_print_events(Dirs) :-
	inotify_init(IN, []),
	foreach(member(Dir,Dirs),
		(
		 inotify_add_watch(IN, Dir, [all]) -> print(['Mush is now watching: <<<',Dir,'>>>']) ; fail
		)
	       ),
	repeat,
	(   inotify_read_event(IN, Ev, [])
	->  solve(!mush_act_on_event(Ev)),
	    fail
	;   format('Timeout~n'),
	    !
	).

%% :- module(user).