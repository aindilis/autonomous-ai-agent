%% ESP Prolog system

%% :- prolog_consult('/var/lib/myfrdcsa/codebases/minor/esp/attempts/1/esp_util.pl').

existsDirType(Type,System) :-
	getDir(Type,System,Dir),
	exists_directory(Dir).

getDir(sandboxSubdirectory,systemFn(Name,Version),Dir) :-
	atomic_list_concat(['/var/lib/myfrdcsa/sandbox/', Name,'-',Version,'/',Name,'-',Version],'',Dir),
	exists_directory(Dir).
getDir(sandboxDirectory,systemFn(Name,Version),Dir) :-
	atomic_list_concat(['/var/lib/myfrdcsa/sandbox/', Name,'-',Version],'',Dir),
	exists_directory(Dir).
getDir(binaryDirectory,systemFn(Name,Version),Dir) :-
	atomic_list_concat(['/var/lib/myfrdcsa/packages/binary/', Name,'-',Version],'',Dir),
	exists_directory(Dir).
getDir(debianDirectory,systemFn(Name,Version),Dir) :-
	getDir(sandboxSubdirectory,systemFn(Name,Version),SubDir),
	atomic_list_concat([SubDir,'/debian'],'',Dir).
