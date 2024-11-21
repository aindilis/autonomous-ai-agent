:- prolog_use_module('/var/lib/myfrdcsa/codebases/minor/prolog-agent/attempts/3/apis/perl5_interface.pl').

%% /var/lib/myfrdcsa/codebases/minor/prolog-agent/attempts/3/autonomous_ai_agent/lib/template_toolkit.pasl
%% /var/lib/myfrdcsa/codebases/minor/prolog-agent/attempts/3/autonomous_ai_agent/lib_t/template_toolkit.plt
%% /var/lib/myfrdcsa/codebases/internal/perllib/PerlLib/TemplateToolkit.pm

option(promptDirDefault,'/var/lib/myfrdcsa/codebases/minor/prompt-library/data-git/prompts/aaa').

%% option(promptDirDefault,'/var/lib/myfrdcsa/codebases/minor/prolog-agent/attempts/3/autonomous_ai_agent/prompts').

%% PerlLib::TemplateToolkit

tt_set_variable(Context,Name,Value) :-
	view([tt_set_variable(Context,Name,Value)]),
	AgentName = 'Prolog-Agent-Agent1',
	FormalogName = 'Prolog-Agent-Yaswi1',
	getOption(promptDirDefault,IncludePath),
	perl5_interface:ensure_perl5_module('PerlLib::TemplateToolkit', 'PerlLib::TemplateToolkit', ['IncludePath',IncludePath], Handle),
	perl5_interface:call_perl5_method(Handle, 'SetVariable',['Context',Context,'Name',Name,'Value',Value], string, _Result1).

tt_get_variable(Context,Name,Value) :-
	view([tt_get_variable(Context,Name,Value)]),
	AgentName = 'Prolog-Agent-Agent1',
	FormalogName = 'Prolog-Agent-Yaswi1',
	getOption(promptDirDefault,IncludePath),
	perl5_interface:ensure_perl5_module('PerlLib::TemplateToolkit', 'PerlLib::TemplateToolkit', ['IncludePath',IncludePath], Handle),
	perl5_interface:call_perl5_method(Handle, 'GetVariable',['Context',Context,'Name',Name], string, Value).

%% tt_include_template(TemplateFilename,Context,Output) :-
%% 	view([tt_include_template(TemplateFilename,Context,Output)]),
%% 	AgentName = 'Prolog-Agent-Agent1',
%% 	FormalogName = 'Prolog-Agent-Yaswi1',
%% 	getOption(promptDirDefault,IncludePath),
%% 	perl5_interface:ensure_perl5_module('PerlLib::TemplateToolkit', 'PerlLib::TemplateToolkit', ['IncludePath',IncludePath], Handle),
%% 	perl5_interface:call_perl5_method(Handle, 'IncludeTemplate',['TemplateFile',TemplateFilename,'Context',Context], string, Output).

tt_process_template(TemplateFilename,Context,Output) :-
	view([tt_process_template(TemplateFilename,Context,Output)]),
	AgentName = 'Prolog-Agent-Agent1',
	FormalogName = 'Prolog-Agent-Yaswi1',
	getOption(promptDirDefault,IncludePath),
	perl5_interface:ensure_perl5_module('PerlLib::TemplateToolkit', 'PerlLib::TemplateToolkit', ['IncludePath',IncludePath], Handle),
	perl5_interface:call_perl5_method(Handle, 'ProcessTemplate',['TemplateFullFilename',TemplateFilename,'Context',Context], _, Output),
	view([myOutput,Output]).
