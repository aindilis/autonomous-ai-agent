:- module(spami_web_navigation, [
				 safe_browse/2,
				 mech_browse/2,
				 mech_browse_cached/2,
				 mech_submit_form/4,
				 mech_follow_link/3,
				 mech_page_content/2
				]).

:- use_module(spami_remote_execution).
:- use_foreign_library(foreign(perl_bridge)).

% Safely browse a URL in the sandbox VM (existing implementation)
safe_browse(VM_ID, URL) :-
	atomic_list_concat(['curl -L -s ', URL], Command),
	execute_remote_command(VM_ID, Command, Output),
	(   Output == success ->
	    true
	;   throw(error(browsing_failed(URL), _))
	).

% Initialize WWW::Mechanize object
:- initialization(init_mechanize).

init_mechanize :-
	perl_eval("
		 use WWW::Mechanize;
		  use WWW::Mechanize::Cached;
		  use Cache::FileCache;
		  
		  $mech = WWW::Mechanize->new(agent => 'SPAMI Web Agent');
		  $cache = Cache::FileCache->new({
		  namespace => 'WWW-Mechanize-Cached',
		  default_expires_in => 86400 # Cache for 24 hours
		 });
		  $mech_cached = WWW::Mechanize::Cached->new(
		  cache => $cache,
		  agent => 'SPAMI Web Agent (Cached)'
		 );
		  ").

% Browse a URL using WWW::Mechanize
mech_browse(URL, Success) :-
	perl_eval_bool(["$mech->get('", URL, "');"], Success).

% Browse a URL using WWW::Mechanize::Cached
mech_browse_cached(URL, Success) :-
	perl_eval_bool(["$mech_cached->get('", URL, "');"], Success).

% Submit a form
mech_submit_form(FormNumber, FieldName, Value, Success) :-
	perl_eval_bool([
			"$mech->form_number(", FormNumber, ");",
			"$mech->field('", FieldName, "', '", Value, "');",
			"$mech->submit();"
		       ], Success).

% Follow a link
mech_follow_link(LinkText, N, Success) :-
	perl_eval_bool([
			"$mech->follow_link(text => '", LinkText, "', n => ", N, ");"
		       ], Success).

% Get the content of the current page
mech_page_content(Content, Success) :-
	perl_eval(["$content = $mech->content();"], Content),
	Success = true.

% Helper predicate to evaluate Perl code and return a boolean result
perl_eval_bool(CodeParts, Success) :-
	atomic_list_concat(CodeParts, Code),
	perl_eval(Code, Result),
	(   Result == 1 -> Success = true ; Success = false).


%% cpan WWW::Mechanize WWW::Mechanize::Cached Cache::FileCache

%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% #include <SWI-Prolog.h>
%% #include <EXTERN.h>
%% #include <perl.h>

%% static PerlInterpreter *my_perl;

%% foreign_t pl_perl_eval(term_t pl_code, term_t pl_result) {
%%     char *code;
%%     char *result;
    
%%     if (!PL_get_chars(pl_code, &code, CVT_ALL|CVT_EXCEPTION))
%%         return FALSE;
    
%%     my_perl = perl_alloc();
%%     perl_construct(my_perl);
    
%%     eval_pv(code, TRUE);
    
%%     result = SvPV_nolen(get_sv("_", FALSE));
    
%%     if (!PL_unify_chars(pl_result, PL_ATOM, strlen(result), result))
%%         return FALSE;
    
%%     perl_destruct(my_perl);
%%     perl_free(my_perl);
    
%%     return TRUE;
%% }

%% install_t install_perl_bridge() {
%%     PL_register_foreign("perl_eval", 2, pl_perl_eval, 0);
%% }