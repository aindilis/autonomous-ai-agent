:- use_module(library(inotify)).

sentinelDirectoriesToWatch([
			    '/home/andrewdo/Downloads/sentinel-test'
			    ]).

%% has_extension(File,Ext) :-
%% 	downcase_atom(File,DCFile) &
%% 	atomic_list_concat(Items,'.',DCFile) &
%% 	reverse(Items,[Ext|_List]).

sentinel_main :-
	sentinelDirectoriesToWatch(Dirs),
	(   hasMode(sentinel,inotify2) -> 
	    sentinel_print_events(Dirs) ;
	    (	hasMode(sentinel,unilangAndInotify2) ->
		sentinel_print_events_with_unilang(Dirs) ;
		(   hasMode(sentinel,systemize) ->
		    sentinelSystemize ;
		    true))).

sentinel_print_events(Dirs) :-
	inotify_init(IN, []),
	foreach(member(Dir,Dirs),
		(
		 inotify_add_watch(IN, Dir, [all]) -> print(['Sentinel is now watching: <<<',Dir,'>>>']) ; fail
		)
	       ),
	repeat,
	(   inotify_read_event(IN, Ev, [])
	->  solve(!sentinel_act_on_event(Ev)),
	    fail
	;   format('Timeout~n'),
	    !
	).

%% sentinel_print_events_with_unilang(Dirs) :-
%% 	inotify_init(IN, []),
%% 	foreach(member(Dir,Dirs),
%% 		(
%% 		 inotify_add_watch(IN, Dir, [all]) -> print(['Sentinel is now watching: <<<',Dir,'>>>']) ; fail
%% 		)
%% 	       ),
%% 	repeat,
%% 	formalog_listen('Prolog-Agent-Agent1','Prolog-Agent-Yaswi1',_Connection),
%% 	(
%% 	 inotify_read_event(IN, Ev, [timeout(1)]) ->
%% 	 solve(!sentinel_act_on_event(Ev)) ;
%% 	 (   format('Timeout~n'), !)
%% 	),
%% 	fail.

sentinel_print_events_with_unilang(Dirs) :-
	inotify_init(IN, []),
	foreach(member(Dir,Dirs),
		(   
		    inotify_add_watch(IN, Dir, [all]) -> print(['Sentinel is now watching: <<<',Dir,'>>>']) ; fail
		)
	       ),
	repeat,
	(   
	    (	inotify_read_event(IN, Ev, [timeout(1)])) ->
	    (	solve(!sentinel_act_on_event(Ev))) ;
	    (	format('Timeout~n'))
	),
	(   formalog_listen('Prolog-Agent-Agent1','Prolog-Agent-Yaswi1',_Connection) -> true ; true),
	fail.
