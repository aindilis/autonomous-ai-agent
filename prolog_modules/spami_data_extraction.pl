:- module(spami_data_extraction, [
				  extract_software_metadata/2
				 ]).

:- spami_load_library([name('util1'),file('/var/lib/myfrdcsa/codebases/minor/prolog-agent/attempts/3/autonomous_ai_agent/lib/util1.pasl')]).

:- prolog_ensure_loaded('/var/lib/myfrdcsa/codebases/minor/prolog-agent/attempts/3/modules/llms.pl').

% Extract software metadata from text
extract_software_metadata(Text, Metadata) :-
	solve(!llms:askLLM(['Hi, could you please extract the names (and any other relevant metadata, such as version, desription, features and otehr metadata) of any software from this text: < < < ',Text,' > > >: '],Results)),
	view([results,Results]),
	Metadata = [].

%% 	extract_name(Text, Name),
%% 	extract_version(Text, Version),
%% 	extract_description(Text, Description),
%% 	extract_features(Text, Features),
%% 	Metadata = metadata(Name, Version, Description, Features).

%% % Helper predicates for extraction (these would need to be implemented with more sophisticated NLP techniques)
%% extract_name(Text, Name) :- /* Implementation */
%% 	true.

%% extract_version(Text, Version) :- /* Implementation */
%% 	true.

%% extract_description(Text, Description) :- /* Implementation */
%% 	true.

%% extract_features(Text, Features) :- /* Implementation */
%% 	true.





%% Claude, could you please extract the names (and any other relevant metadata) of any planning software from this paper: [pasted paper]

%% Based on my review of the paper, the following planning software or systems are mentioned:

%% ROSPlan - A system for linking planning state and execution context, targeting robotics applications.
%% TPOPEXEC - A system addressing theoretical properties of deterministic temporal partial order plans.
%% Kirk and Drake - Systems focusing on partial order temporal plans with choice points in execution.
%% Razor - A system for compiling contingent plans in information gathering settings.
%% IXTET-EXEC - A system focusing on challenges in deploying plans, built on OpenPRS.
%% OpenPRS - A procedural executor that IXTET-EXEC is built on.
%% PLEXIL - A language proposed for executors.
%% RMPL - Another language proposed for executors.
%% CLIPS - A rule-based production system mentioned in relation to integrating with PDDL plan execution.
%% The paper does not go into great detail about most of these systems, but mentions them as related work or for comparison to the approach proposed by the authors.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Hi Claude, I am trying to see if LLMs can help me extract the names, descriptions, and potential download locations for software systems. I will paste a paper that talks abouit important software systems. Please extract all useful information, and if possible, put in a Prolog (Cyc-like) notation. THANKS! [pasted paper]

%% Certainly! I'll extract the relevant information about software systems mentioned in the paper and present it in a Prolog-like notation. Here's what I found:

%% software_system(conGolog).
%% description(conGolog, "A concurrent programming language based on the Situation Calculus").
%% used_for(conGolog, "Process specification and agent programming").
%% feature(conGolog, "Expressive formal language").
%% feature(conGolog, "Supports specification of complex multiagent systems").

%% software_system(casl).
%% full_name(casl, "Cognitive Agents Specification Language").
%% description(casl, "An extension of ConGolog that incorporates models of mental states").
%% used_for(casl, "Formal specification and analysis of multiagent systems").
%% feature(casl, "Supports modeling of agent mental states").
%% feature(casl, "Allows reasoning about agent knowledge and goals").

%% software_system(caslve).
%% full_name(caslve, "CASL Verification Environment").
%% description(caslve, "A theorem-prover-based verification environment for CASL").
%% used_for(caslve, "Formal verification of CASL specifications").

%% software_system(i_star).
%% alternative_name(i_star, "i*").
%% description(i_star, "An informal diagram-based language for early-phase requirements engineering").
%% used_for(i_star, "Modeling social and intentional dependencies between agents").
%% used_for(i_star, "Analyzing how process design choices affect agents' goals").

%% software_system(formal_tropos).
%% alternative_name(formal_tropos, "FT").
%% description(formal_tropos, "A formal approach that combines i* with temporal logic").
%% used_for(formal_tropos, "Formal analysis of i* models through model checking").

%% software_system(mrbs).
%% full_name(mrbs, "Meeting Room Booking System").
%% description(mrbs, "A legacy software system for handling the booking of meeting rooms").

%% software_system(congolog_simulation_tool).
%% description(congolog_simulation_tool, "A tool for simulating and validating ConGolog models").
%% feature(congolog_simulation_tool, "Provides a graphical user interface").
%% limitation(congolog_simulation_tool, "Requires complete specification of initial state").
%% limitation(congolog_simulation_tool, "Uses Prolog and closed world assumption").

%% % Note: Download locations are not explicitly mentioned in the paper for any of these systems.

%% This Prolog-like representation captures the main software systems mentioned in the paper, along with their descriptions, uses, features, and some limitations where applicable. Unfortunately, the paper does not provide specific download locations for any of these systems. If you need more information about obtaining these software systems, you might need to search for them separately or consult the references provided in the original paper.

%% AD
%% Are there any leads in the paper about where I might find the source code to CASL?

%% The paper doesn't provide direct information about where to find the source code for CASL. However, there are a few leads that might help in locating more information about CASL and potentially its source code:

%% The main researcher associated with CASL appears to be Steven Shapiro. The paper mentions his PhD thesis:

%% author(casl, "Steven Shapiro").
%% reference(casl, "Shapiro, S.: Specifying and Verifying Multiagent Systems Using CASL. Ph.D. Thesis. Dept. of Computer Science, University of Toronto (2004)").


%% There's also a reference to a paper about CASL by Shapiro and others:


%% reference(casl, "Shapiro, S., Lespérance, Y., Levesque, H.: The Cognitive Agents Specification Language and verification environment for multiagent systems. In: Proc. AAMAS 2002, Bologna, Italy, pp. 19–26 (2002)").


%% The paper mentions that CASL is an extension of ConGolog, which was developed at the University of Toronto:

%% affiliation(casl, "University of Toronto").
%% derived_from(casl, conGolog).

%% While the paper doesn't provide direct links to source code, these leads suggest that you might find more information by:

%% Looking up Steven Shapiro's work, particularly his PhD thesis.
%% Checking the proceedings of AAMAS 2002 for the paper on CASL.
%% Investigating the Cognitive Robotics Group or AI lab at the University of Toronto, as they might host the CASL project.
%% Remember, the paper we're looking at is from 2009, so more recent information might be available online about CASL and its implementation.