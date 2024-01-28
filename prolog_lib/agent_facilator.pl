fixme('Gather more roles for SPAMI agents here: /var/lib/myfrdcsa/codebases/minor/agentspeak-frdcsa/frdcsa/sys/cso/autoload/system-kb.pl').
fixme('Refactor most of the contents of these agents into a well structured multi-file standard library').

hasUseCases(prologAgentAgentFn(academician),['research topics completely on its own']).
hasUseCases(prologAgentAgentFn(agent_smith),['install FRDCSA on a remote system']).
hasUseCases(prologAgentAgentFn(api_learner),['maps APIs by reading API documentation and examples']).
hasUseCases(prologAgentAgentFn(architect),['curate software collections and matchmake capabilities with feature requests']).
hasUseCases(prologAgentAgentFn(argument),['develop arguments for an against a position, using LLMs, and reason them out']).
hasUseCases(prologAgentAgentFn(audience),['proxy all communications and make sure they are appropriate and act accordingly if not']).
hasUseCases(prologAgentAgentFn(executive_function),['take our large to-do list systems and help us to achieve them, and set new goals']).
hasUseCases(prologAgentAgentFn(iaec2),['analyze files and other digital objects and figure out what they are and act accordingly with them']).
hasUseCases(prologAgentAgentFn(iaec),['analyze files and other digital objects and figure out what they are and act accordingly with them']).
hasUseCases(prologAgentAgentFn(manager),['track me down if I am not available, and ensure I received given messages']).
hasUseCases(prologAgentAgentFn(metaplanner),['metaplan with the financial planner, moving things around like expected dates of certain payments']).
hasUseCases(prologAgentAgentFn(mush),['analyze error messages and research how to resolve them']).
hasUseCases(prologAgentAgentFn(neo),['control all subagents properly']).
hasUseCases(prologAgentAgentFn(packager),['figure out what software we have and need, and go about packaging it for Debian']).
hasUseCases(prologAgentAgentFn(praise_bot),['generate compliments and otherwise reward the user for productivity, encouraging them to stay motivated and productive']).
hasUseCases(prologAgentAgentFn(sentinel),['monitor and housekeep the computer, making sure that all files get moved to their intended locations, and extract information useful to FRDCSA/FLP/Prolog-Agent']).
hasUseCases(prologAgentAgentFn(setanta_agent),['administer machines, map networks, read manpages and write code, etc']).
hasUseCases(prologAgentAgentFn(setup_debian),['bring a vanilla Debian machine up to speed, ready to have FRDCSA installed on it']).
hasUseCases(prologAgentAgentFn(sieve),['work with what it knows about software systems, and use previously mentioned agents to help it create large repositories of packaged software']).
hasUseCases(prologAgentAgentFn(softbot1),['act as a software robot, moving around on a system and doing intelligent things with it']).
hasUseCases(prologAgentAgentFn(suasion),['persuade people of the truth of some conclusion']).
hasUseCases(prologAgentAgentFn(svrs),['monitor all sensors and behave accordingly']).
hasUseCases(prologAgentAgentFn(system_implementor),['take reseasrch papers and attempt to reimplement when necessary']).
hasUseCases(prologAgentAgentFn(vger2),['tool to create a massive software collection, using various techniques to build an ontology of systems, and determine their avaibility']).
hasUseCases(prologAgentAgentFn(web_agent),['read, understand and navigate websites, helping with research']).
hasUseCases(prologAgentAgentFn(wopr),['develop continency plans for a given situation']).
hasUseCases(prologAgentAgentFn(workflow_manager),['help the user to make use of FLP by walking them throw what they need to do']).

%% FIXME: ensure all startupAgent are feasibleAgent

%% FIXME: process source files to get all initDependencies
initDependencies(executive_function,[spse2Formalog]).
initDependencies(softbot,[iaec,runningVM(prologAgentVM)]).

are([agent_smith,setup_debian],frdcsaInstallerRelatedAgent).
are([neo,workflow_manager],specialCaseAgent).
are([academician,mush,sentinel,sieve],inotifyAgent).
genlsDirectlyList([frdcsaInstallerRelatedAgent,inotifyAgent],specialCaseAgent).

are([academician,argument,audience,executive_function,iaec,manager,metaplanner,packager,praise_bot,softbot1,suasion,web_agent,wopr],feasibleAgent).
are([academician,iaec,manager,packager,praise_bot,softbot1,suasion,web_agent,wopr],startupAgent).

%% need something that will take all our questions and search if safe first, etc.

