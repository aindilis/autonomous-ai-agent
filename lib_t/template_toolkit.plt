:- begin_tests('template_toolkit').

:- spami_load_library([name('template_toolkit'),file('/var/lib/myfrdcsa/codebases/minor/prolog-agent/attempts/3/autonomous_ai_agent/lib/template_toolkit.pasl')]).

%% /var/lib/myfrdcsa/codebases/minor/prolog-agent/attempts/3/autonomous_ai_agent/prolog_lib/template_toolkit.pl
%% /var/lib/myfrdcsa/codebases/minor/prolog-agent/attempts/3/autonomous_ai_agent/lib/template_toolkit.pasl
%% /var/lib/myfrdcsa/codebases/internal/perllib/PerlLib/TemplateToolkit.pm

:- use_module(library(debug)).

:- start_agent.


%% UNIT TESTS

test(tt_set_variable) :-
	tt_set_variable(context1,var1,hi),
	tt_get_variable(context1,var1,Value),
	assertion(Value == "hi").

test(tt_get_variable) :-
	tt_set_variable(context1,var1,hi),
	tt_get_variable(context1,var1,Value),
	assertion(Value == "hi").

option(promptDir,'/var/lib/myfrdcsa/codebases/minor/prolog-agent/attempts/3/autonomous_ai_agent/prompts').

test(tt_generate_template) :-
	solve(!generateTemplate([template([packager,select_files_containing_dependency_info]),
				 context(selectFilesContainingDependencyInfo),
				 variables([systemName('DOMAP'),fileListing('/dev/shm/test1.txt')])],
				Output)),
	debug(Output),
	assertion("hi" == "hi").


%% INTEGRATION TESTS

%% !generateTemplate([template([packager,selectFilesContainingDependencyInfo]),
%% 		   context(selectFilesContainingDependencyInfo),
%% 		   variables([systemName(System),fileListing(FileListing)])],
%% 		  Output).
		   
%% +!selectFilesContainingDependencyInfo(Arguments) <-
%% 	.argt(Arguments,[version(versionFn(System,Version))]);
%% 	!tt_set_variable(selectFilesContainingDependencyInfo, systemName, System);
%% 	!tt_set_variable(selectFilesContainingDependencyInfo, fileListing, FileListing);
%% 	!tt_process_template([packager,select_files_containing_dependency_info], selectFilesContainingDependencyInfo, Question1);
%% 	!askLLMList([Question1],Files);
%% 	.forall(member(File,Files),
%% 		solve(!locateDependencies([version(versionFn(System,Version)),file(File)]))).

%% +!locateDependencies(Arguments) <-
%% 	.argt(Arguments,[version(versionFn(System,Version)),file(File)]);
%% 	!tt_set_variable(locateDependencies, systemName, System);
%% 	readFileContents(File,FileContents);
%% 	!tt_set_variable(locateDependencies, fileContents, FileContents);
%% 	!tt_process_template([packager,locate_dependencies], locateDependencies, Question2);
%% 	!askLLMList([Question2],Dependencies);
%% 	.forall(member(Dependency,Dependencies),
%% 		solve(!freekbs2:assert(Mt,packagingDependsOn(versionFn(System,Version),versionFn(System,Version))))).

:- end_tests('template_toolkit').
