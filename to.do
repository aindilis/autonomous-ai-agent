(Agents should generate the next commands they are going to run,
 like from the LLM, and then prompt the user's permission to
 execute, in certain circumstances at any rate)

(i need to really refactor prolog agent to get rid of the
 duplicated capabilities)

(it would be nice to use formal specification, prog synth, and
 generate/check methodology to create provably correct program
 solutions)

(if we design Prolog-Agent to make enough sense, it's possible
 Claude might be able to do a type of Goedel machine with
 Prolog-Agent, to the point where it generates Prolog-Agent code)

(need to know when to use which model, such as Claude3.5Sonnet,
 or Llama3 Instruct etc)

(one thing that we can do is present a situation, and instead of
 running shell commands per se, we can have the LLM write a
 program that fixes the situation)

(ensure that agents properly set up their test environments, such
 as starting up (if necessary) the remote vagrant machine for
 remote execution support)

(commands should work whether run locally or remotely, so for
 instance, a clamav.pasl agent should be able to remote execute
 commands to run freshclam, or do it locally)

(every prolog-agent should have its own microtheory, and every
 agent should probably load FreeKBS2.pasl by default, just as
 with formalog. And, we ought to write some helper functions to
 make assert and retract more natural)

(For our web-agent stuff, have it do clamscan on anything it
 downloads. Have it freshclam and not run if it can't first. Have
 it spider and always check whether something is safe before
 going to it online, i.e. don't go to suspicious URLs, etc. Do a
 lot of security in the process.)

(Clean up the print debug noise from Prolog-Agent's output. Have
 it have optional log levels, configurable in a logging
 module. Here is present noise:

 ;; [f]

 ;; [g,' 377']
 ;; [answer,' 377']
 ;; '377'
 ;; [ nextNumber,
 ;;   '377',
 ;;   newSequence,
 ;;   [0,1,'1','2','3','5','8','13','21','34','55','89','144','233','377']
 ;; ]
 ;; [ defaultPromptDir,
 ;;   '/var/lib/myfrdcsa/codebases/minor/prompt-library/data-git/prompts/aaa'
 ;; ]
 ;; [ template([fibonacci,add]),
 ;;   context(fibonacciAdd),
 ;;   variables([x('233'),y('377')])
 ;; ]
 ;; [tt_set_variable(fibonacciAdd,x,'233')]
 ;; [tt_set_variable(fibonacciAdd,y,'377')]
 ;; [ templateFilename('/var/lib/myfrdcsa/codebases/minor/prompt-library/data-git/prompts/aaa/fibonacci/add')
 ;; ]
 ;; [tt_process_template('/var/lib/myfrdcsa/codebases/minor/prompt-library/data-git/prompts/aaa/fibonacci/add',fibonacciAdd,_27758)]
 ;; [myOutput,"Please return the sum (and nothing else whatsoever) of the following two natural numbers: 233, 377: \n"]
 ;; [ output,
 ;;   "Please return the sum (and nothing else whatsoever) of the following two natural numbers: 233, 377: \n"
 ;; ]
 ;; 'Please return the sum (and nothing else whatsoever) of the following two natural numbers: 233, 377: \n'
 ;; [da]
 ;; [sein]
 ;; [a]
 ;; [b]
 ;; [c]
 ;; [d,'rm -f /dev/shm/shell_command_to_string.txt']
 ;; [e,'/var/lib/myfrdcsa/codebases/minor/prolog-agent/scripts/prolog-agent-query-llm-wrapper-remote.pl 2> /dev/shm/prolog-agent-warnings.txt 1> /dev/shm/shell_command_to_string.txt']

 ;; 1
 ;; 2
 ;; 3

 ;; print_result
 ;; [retval,[1]]

 )
