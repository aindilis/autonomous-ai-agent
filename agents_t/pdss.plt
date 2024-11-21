:- begin_tests('pdss').

:- spami_load_agent([name('pdss'),file('/var/lib/myfrdcsa/codebases/minor/prolog-agent/attempts/3/autonomous_ai_agent/agents/pdss.pasl')]).

:- start_agent.

:- end_tests('pdss').
