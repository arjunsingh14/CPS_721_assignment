% Enter the names of your group members below.
% If you only have 2 group members, leave the last space blank
%
%%%%%
%%%%% NAME: Arjun Bhandal
%%%%% NAME:
%%%%% NAME:
%
% Add the required rules in the corresponding sections. 
% If you put the rules in the wrong sections, you will lose marks.
%
% You may add additional comments as you choose but DO NOT MODIFY the comment lines below
%

%%%%% SECTION: pathfinding_setup
%%%%%
%%%%% These lines allow you to write statements for a predicate that are not consecutive in your program
%%%%% Doing so enables the specification of an initial state in another file
%%%%% DO NOT MODIFY THE CODE IN THIS SECTION
:- dynamic agentLoc/4.

%%%%% This line loads the generic planner code from the file "planner.pl"
%%%%% Just ensure that that the planner.pl file is in the same directory as this one
:- [planner].


%%%%% SECTION: init_pathfinding
%%%%% Loads the initial state from either pathfindingInit1.pl or pathfindingInit2.pl
%%%%% Just leave whichever one uncommented that you want to test on
%%%%% NOTE, you can only uncomment one at a time
%%%%% HINT: You can create other files with other initial states to more easily test individual actions
%%%%%       To do so, just replace the line below with one loading in the file with your initial state
%:- [pathfindingInit1].
:- [pathfindingInit2].


%%%%% SECTION: goal_states_pathfinding
%%%%% Below we define different goal states, each with a different ID
%%%%% HINT: It may be useful to define "easier" goals when starting your program or when debugging
%%%%%       You can do so by adding more goal states below
%%%%% Goal XY should be read as goal Y for problem X

%%%%% Goal states for pathfindingInit1
%% The first three should be under a second on regular mode
%% Goal 14 should take a few seconds on regular mode
%% Goal 15 may take 10-20 seconds on regular mode
%% Goal 16 may take a few minutes on regular mode
%% Goal 17 may take a few minutes even on heuristic mode

% Before running on these goal states, manually figure out what the optimal solution should be
goal_state(11, S) :- agentLoc(a1, 0, 1, S).
goal_state(12, S) :- agentLoc(a1, 0, 1, S), agentLoc(a2, 2, 2, S).
goal_state(13, S) :- agentLoc(a1, 0, 1, S), agentLoc(a2, 2, 2, S), agentLoc(a3, 2, 1, S).
goal_state(14, S) :- agentLoc(a1, 2, 2, S).
goal_state(15, S) :- agentLoc(a1, 3, 2, S).
goal_state(16, S) :- agentLoc(a1, 3, 2, S), agentLoc(a2, 2, 2, S).
goal_state(17, S) :- agentLoc(a1, 2, 2, S), agentLoc(a2, 0, 2, S).

%% Goal states for pathfindingInit2
%% Goal 21 takes 10-30 seconds on regular mode
%% Goal 22 take 5-10 minutes on regular mode
%% Goal 23 will take a minute or two on heuristic mode
goal_state(21, S) :- agentLoc(a1, 0, 1, S), agentLoc(a2, 0, 2, S), agentLoc(a3, 0, 3, S), 
                        agentLoc(a4, 0, 0, S), agentLoc(a5, 3, 4, S).
goal_state(22, S) :- agentLoc(a1, 1, 3, S), agentLoc(a2, 0, 0, S).
goal_state(23, S) :- agentLoc(a1, 2, 4, S).

%%%%% SECTION: precondition_axioms_pathfinding
%%%%% Write precondition axioms for all actions in your domain. Recall that to avoid
%%%%% potential problems with negation in Prolog, you should not start bodies of your
%%%%% rules with negated predicates. Make sure that all variables in a predicate 
%%%%% are instantiated by constants before you apply negation to the predicate that 
%%%%% mentions these variables. 

% Helper to check if any agent is at a specific location
agentAt(R, C, S) :- agentLoc(_, R, C, S).

poss(move(Agent, R1, C1, R2, C2), S) :-
    agent(Agent),
    agentLoc(Agent, R1, C1, S),
    % Generate valid neighbor coordinates (up, down, left, right)
    member([DR, DC], [[0, 1], [0, -1], [1, 0], [-1, 0]]),
    R2 is R1 + DR,
    C2 is C1 + DC,
    % Bounds checks
    numRows(NR), R2 >= 0, R2 < NR,
    numCols(NC), C2 >= 0, C2 < NC,
    % Obstacle checks
    not wallAt(R2, C2),
    not agentAt(R2, C2, S).


%%%%% SECTION: successor_state_axioms_pathfinding
%%%%% Write successor-state axioms that characterize how the truth value of all 
%%%%% fluents change from the current situation S to the next situation [A | S]. 
%%%%% You will need two types of rules for each fluent: 
%%%%% 	(a) rules that characterize when a fluent becomes true in the next situation 
%%%%%	as a result of the last action, and
%%%%%	(b) rules that characterize when a fluent remains true in the next situation,
%%%%%	unless the most recent action changes it to false.
%%%%% When you write successor state axioms, you can sometimes start bodies of rules 
%%%%% with negation of a predicate, e.g., with negation of equality. This can help 
%%%%% to make them a bit more efficient.
%%%%%
%%%%% Write your successor state rules here: you have to write brief comments %

% Case 1: Agent moves into (R, C)
agentLoc(A, R, C, [M|S]) :-
    M = move(A, _, _, R, C).

% Case 2: Agent was at (R, C) and did not move away
agentLoc(A, R, C, [M|S]) :-
    agentLoc(A, R, C, S),
    not M = move(A, R, C, _, _).


%%%%% SECTION: declarative_heuristics_pathfinding
%%%%% The predicate useless(A,ListOfPastActions) is true if an action A is useless
%%%%% given the list of previously performed actions. The predicate useless(A,ListOfPastActions)
%%%%% helps to solve the planning problem by providing declarative heuristics to 
%%%%% the planner. If this predicate is correctly defined using a few rules, then it 
%%%%% helps to speed-up the search that your program is doing to find a list of actions
%%%%% that solves a planning problem. Write as many rules that define this predicate
%%%%% as you can: think about useless repetitions you would like to avoid, and about 
%%%%% order of execution (i.e., use common sense properties of the application domain). 
%%%%% Your rules have to be general enough to be applicable to any problem in your domain,
%%%%% in other words, they have to help in solving a planning problem for any instance
%%%%% (i.e., any initial and goal states).
%%%%%	
%%%%% write your rules implementing the predicate  useless(Action,History) here. %

% Heuristic 1: Inverse Action. 
% Prune moving immediately back to the location the agent just came from.
useless(move(A, _, _, ROld, COld), [move(A, ROld, COld, _, _) | _]).

% Heuristic 2: 3-Cycle. 
% Prune visiting a location if the agent was there 2 steps ago (short loops).
useless(move(A, _, _, R, C), [move(A, _, _, _, _), move(A, R, C, _, _) | _]).

% Heuristic 3a: Coordinate-based Symmetry Breaking (Row Priority)
% If two independent actions occur sequentially, force an order (smaller coord first).
% This rule prunes if Row2 < Row1.
useless(move(A2, R2S, C2S, R2E, C2E), [move(A1, R1S, C1S, R1E, C1E) | _]) :-
    not A1 = A2,
    % Independence Check: Ensure neither action affects the other's start or end
    not (R1S = R2E, C1S = C2E), % A1 start != A2 end
    not (R1E = R2S, C1E = C2S), % A1 end != A2 start
    not (R1E = R2E, C1E = C2E), % Destinations distinct
    % Order Check: Prune if A2's start row is less than A1's start row
    R2S < R1S.

% Heuristic 3b: Coordinate-based Symmetry Breaking (Col Priority if Rows Equal)
% This rule prunes if Row2 = Row1 AND Col2 < Col1.
useless(move(A2, R2S, C2S, R2E, C2E), [move(A1, R1S, C1S, R1E, C1E) | _]) :-
    not A1 = A2,
    % Independence Check
    not (R1S = R2E, C1S = C2E), 
    not (R1E = R2S, C1E = C2S), 
    not (R1E = R2E, C1E = C2E), 
    % Order Check: Prune if Rows are equal AND A2's start col is less than A1's
    R2S = R1S,
    C2S < C1S.