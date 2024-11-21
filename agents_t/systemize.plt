:- begin_tests('systemize').

:- spami_load_agent([name('systemize'),file('/var/lib/myfrdcsa/codebases/minor/prolog-agent/attempts/3/autonomous_ai_agent/agents/systemize.pasl')]).

:- start_agent.

:- end_tests('systemize').
