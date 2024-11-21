:- begin_tests('aisa').

:- spami_load_agent([name('aisa'),file('/var/lib/myfrdcsa/codebases/minor/prolog-agent/attempts/3/autonomous_ai_agent/agents/aisa.pasl')]).

:- start_agent.

:- end_tests('aisa').
