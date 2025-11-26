% Enter the names of your group members below.
% If you only have 2 group members, leave the last space blank
%
%%%%%
%%%%% NAME: Golsa Momeni
%%%%% NAME: Bardia Shirsalimian
%%%%% NAME: Arjun Bhandal
%
% Add the required rules in the corresponding sections. 
% If you put the rules in the wrong sections, you will lose marks.
%
% You may add additional comments as you choose but DO NOT MODIFY the comment lines below
%

%%%%% SECTION: dishwashing_setup
%%%%%
%%%%% These lines allow you to write statements for a predicate that are not consecutive in your program
%%%%% Doing so enables the specification of an initial state in another file
%%%%% DO NOT MODIFY THE CODE IN THIS SECTION
:- dynamic holding/2.
:- dynamic numHolding/2.
:- dynamic faucetOn/1.
:- dynamic loc/3.
:- dynamic wet/2.
:- dynamic dirty/2.
:- dynamic soapy/2.
:- dynamic plate/1.
:- dynamic glassware/1.

%%%%% This line loads the generic planner code from the file "planner.pl"
%%%%% Just ensure that that the planner.pl file is in the same directory as this one
:- [planner].

%%%%% SECTION: init_dishwashing
%%%%% Loads the initial state from either dishwashingInit1.pl or dishwashingInit2.pl
%%%%% Just leave whichever one uncommented that you want to test on
%%%%% NOTE, you can only uncomment one at a time
%%%%% HINT: You can create other files with other initial states to more easily test individual actions
%%%%%       To do so, just replace the line below with one loading in the file with your initial state
:- [dishwashingInit1].
%:- [dishwashingInit2].
%:- [dishwashingInit3].

%%%%% SECTION: goal_states_dishwashing
%%%%% Below we define different goal states, each with a different ID
%%%%% HINT: It may be useful to define "easier" goals when starting your program or when debugging
%%%%%       You can do so by adding more goal states below

%% Goal states for dishwashingInit1
goal_state(11, S) :- holding(brush, S), soapy(brush, S).
goal_state(12, S) :- loc(brush, dish_rack, S), loc(sponge, counter, S).
goal_state(13, S) :- not dirty(g1, S), not soapy(g1, S).
goal_state(14, S) :- not dirty(g1, S), not soapy(g1, S), loc(g1, dish_rack, S), not faucetOn(S). 
goal_state(15, S) :- not dirty(g1, S), not soapy(g1, S), loc(g1, dish_rack, S), not soapy(brush, S),
                        loc(brush, dish_rack, S), not faucetOn(S). 

%% Goal states for dishwashingInit2
goal_state(21, S) :- not dirty(p1, S), not soapy(p1, S). 
goal_state(22, S) :- not dirty(p1, S), not soapy(p1, S), loc(p1, dish_rack, S), 
                        not dirty(p2, S), not soapy(p2, S), loc(p2, dish_rack, S).  

%% Goal states for dishwashingInit3
goal_state(31, S) :- not dirty(p1, S), not soapy(p1, S), not dirty(g1, S), not soapy(g1, S),
                        loc(p1, dish_rack, S), loc(g1, dish_rack, S).

%%%%% SECTION: aux_dishwashing
%%%%% Add any additional helpers here, including any additional rules needed for the auxiliary predicates
%%%%% DO NOT MODIFY THE CODE IN THIS SECTION
place(counter).
place(dish_rack).

scrubber(sponge).
scrubber(brush).

dish(X) :- glassware(X).
dish(X) :- plate(X).

item(X) :- glassware(X).
item(X) :- plate(X).
item(X) :- scrubber(X).

%%%%% SECTION: precondition_axioms_dishwashing
%%%%% Write precondition axioms for all actions in your domain. Recall that to avoid
%%%%% potential problems with negation in Prolog, you should not start bodies of your
%%%%% rules with negated predicates. Make sure that all variables in a predicate 
%%%%% are instantiated by constants before you apply negation to the predicate that 
%%%%% mentions these variables. 

%%%%% pickUp(X,P)
    
poss(pickUp(X, P), S) :-
    item(X),               % X is a valid item
    place(P),              % P is a valid place
    loc(X, P, S),          % X is at place P
    numHolding(C, S),      % robot holding less than 2 items
    C < 2,
    not(holding(X, S)).    % robot is not already holding X
    
%%%%% putDown(X,P)

poss(putDown(X, P), S) :-
    item(X),         % X is a valid item
    place(P),        % P is a valid place
    holding(X, S).   % robot is holding X

%%%%% turnOnFaucet
    
poss(turnOnFaucet, S) :-
    numHolding(C, S),
    C < 2,                % robot is holding less than 2 items
    not(faucetOn(S)).     % faucet is off

%%%%% turnOffFaucet
    
poss(turnOffFaucet, S) :- faucetOn(S), numHolding(C,S), C < 2.

%%%%% addSoap(X)
    
poss(addSoap(X), S) :-
    scrubber(X),           % X must be a scrubber
    holding(X, S),         % robot is holding the scrubber
    numHolding(C, S),      
    C < 2.                 % robot has a free hand
    
%%%%% two preconditions needed for scrub(X,Y)
    
poss(scrub(X, Y), S) :-
    glassware(X),
    Y = brush,
    holding(X, S),
    holding(Y, S).

poss(scrub(X, Y), S) :-
    plate(X),
    Y = sponge,
    holding(X, S),
    holding(Y, S).
    
%%%%% rinse(X)
 
poss(rinse(X), S) :-
    item(X),          % X can be any item (scrubber or dish)
    faucetOn(S),      % faucet must be ON
    holding(X, S).    % robot must be holding X


%%%%% SECTION: successor_state_axioms_dishwashing
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

% positive effect rule: X becomes held after pickUp
holding(X, [pickUp(X,P) | S]).

% persistence rule: X stays held unless it was put down
holding(X, [A | S]) :-
    not A = putDown(X,P),
    not A = pickUp(X,P),
    holding(X, S).

% positive effect rule: picking up will increase the count

numHolding(C2, [pickUp(X,P) | S]) :-
    numHolding(C1, S),
    C2 is C1 + 1.

% negative effect rule: putting down will decrease the count
    
numHolding(C2, [putDown(X,P) | S]) :-
    numHolding(C1, S),
    C2 is C1 - 1.

% persistence rule: count stays the same

numHolding(C, [A | S]) :-
    not A = pickUp(X,P),
    not A = putDown(X,P),
    numHolding(C, S).

% positive effect rule: faucet becomes on after turnOnFaucet
    
faucetOn([turnOnFaucet | S]).

% persistence rule
    
faucetOn([A | S]) :-
    not A = turnOffFaucet,
    not A = turnOnFaucet,
    faucetOn(S).

% positive effect rule
    
loc(X,P, [putDown(X,P) | S]).

% persistence rule
    
loc(X,P, [A | S]) :-
    not A = putDown(X,P),
    not A = pickUp(X,P),
    loc(X,P, S).

% positive effect rule 

wet(X, [rinse(X) | S]).

% persistence rule
    
wet(X, [A | S]) :-
    not A = rinse(X),
    wet(X, S).

% persistence rule: dirty persists unless it is removed by rinsing
dirty(X, [A | S]) :-
    not A = rinse(X),
    dirty(X, S).

% positive effect rule
soapy(X, [addSoap(X) | S]).

% persistence rule: soapy persists unless X is rinsed or soap is added
soapy(X, [A | S]) :-
    not A = rinse(X),
    not A = addSoap(X),
    soapy(X, S).


%%%%% SECTION: declarative_heuristics_dishwashing
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
%%%%% write your rules implementing the predicate  useless(Action, History) here. %

% 1: Putting something down and immediately picking it up again is useless
useless(pickUp(X,P), [putDown(X,P) | S]).

% 2: Picking something up and immediately putting it down is useless
useless(putDown(X,P), [pickUp(X,P) | S]).
    
% 3: If the last action was turning off the faucet, then turning it immediately on is useless.
useless(turnOnFaucet, [turnOffFaucet | S]).

% 4: If the last action was turning on the faucet, then turning it immediately off is useless.
useless(turnOffFaucet, [turnOnFaucet | S]).


% 5: Adding soap immediately after rinsing X is useless
useless(addSoap(X), [rinse(X) | S]).

% 6: Rinsing X immediately after adding soap does nothing
useless(rinse(X), [addSoap(X) | S]).

% 7: Adding soap twice in a row is useless
useless(addSoap(X), [addSoap(X) | S]).

% 8: Scrubbing the same dish twice in a row is useless
useless(scrub(X, Y), [scrub(X, Y) | S]).

% 9: Rinsing the same item twice in a row is useless
useless(rinse(X), [rinse(X) | S]).

% 10: Scrubbing immediately after rinsing the scrubber is useless (scrubber has no soap)
useless(scrub(X, Y), [rinse(Y) | S]).
