% Enter the names of ID of your group members below.
% For STUDENT ID, use your 9-digit ONECARD number.
% If you have 2 group members, leave the last entry blank.
%
%%%%%
%%%%% NAME: Arjun Bhandal
%%%%% STUDENT ID: 501088530
%%%%%
%%%%% NAME: Golsa Momeni
%%%%% STUDENT ID: 501202209
%%%%%
%%%%% NAME: Bardia Shirsalimian
%%%%% STUDENT ID: 501280070
%
% Add the required statements in the q4a_rules section below.
% Any helper predicates should also be added to that section.
% Do NOT delete, edit, or add SECTION headers.
% If you put statements in the wrong section, you will lose marks.
%
% You may add additional comments as you choose but DO NOT MODIFY
% the already included comment lines below
%

%%%%% SECTION: q1_8cust_gen_and_test_solution
%%%%% Put the different components of your delivery truck solution below

%%% Put the KB you need for this problem (not including variable domains here).

% row 0: warehouse
travel(w,c1,100). travel(w,c2,50). travel(w,c3,70). travel(w,c4,30). travel(w,c5,45). travel(w,c6,32).
travel(w,c7,56). travel(w,c8,40). travel(w,c9,45).

% row 1: c1
travel(c1,w,100). travel(c1,c2,25). travel(c1,c3,75). travel(c1,c4,35). travel(c1,c5,55). travel(c1,c6,45).
travel(c1,c7,105). travel(c1,c8,40). travel(c1,c9,30).

% row 2: c2
travel(c2,w,50). travel(c2,c1,25). travel(c2,c3,35). travel(c2,c4,27). travel(c2,c5,50). travel(c2,c6,25).
travel(c2,c7,45). travel(c2,c8,75). travel(c2,c9,20).

% row 3: c3
travel(c3,w,70). travel(c3,c1,75). travel(c3,c2,35). travel(c3,c4,15). travel(c3,c5,54). travel(c3,c6,40).
travel(c3,c7,10). travel(c3,c8,15). travel(c3,c9,90).

% row 4: c4
travel(c4,w,30). travel(c4,c1,35). travel(c4,c2,27). travel(c4,c3,15). travel(c4,c5,25). travel(c4,c6,30).
travel(c4,c7,35). travel(c4,c8,25). travel(c4,c9,23).

% row 5: c5
travel(c5,w,45). travel(c5,c1,55). travel(c5,c2,50). travel(c5,c3,54). travel(c5,c4,25). travel(c5,c6,100).
travel(c5,c7,25). travel(c5,c8,67). travel(c5,c9,20).

% row 6: c6
travel(c6,w,32). travel(c6,c1,45). travel(c6,c2,25). travel(c6,c3,40). travel(c6,c4,30). travel(c6,c5,100).
travel(c6,c7,25). travel(c6,c8,25). travel(c6,c9,50).

% row 7: c7
travel(c7,w,56). travel(c7,c1,105). travel(c7,c2,45). travel(c7,c3,10). travel(c7,c4,35). travel(c7,c5,25).
travel(c7,c6,25). travel(c7,c8,15). travel(c7,c9,45).

% row 8: c8
travel(c8,w,40). travel(c8,c1,40). travel(c8,c2,75). travel(c8,c3,15). travel(c8,c4,25). travel(c8,c5,67).
travel(c8,c6,25). travel(c8,c7,15). travel(c8,c9,20).

% row 9: c9
travel(c9,w,45). travel(c9,c1,30). travel(c9,c2,20). travel(c9,c3,90). travel(c9,c4,23). travel(c9,c5,20).
travel(c9,c6,50). travel(c9,c7,45). travel(c9,c8,20).

window(c1, 90, 150).
window(c2, 200, 400).
window(c3, 60, 180).
window(c4, 60, 120).
window(c5, 150, 200).
window(c6, 200, 320).
window(c7, 200, 320).
window(c8, 330, 460).
window(c9, 300, 360).


%%% Put the domains for your variables below

customers([c1, c2, c3, c4, c5, c6, c7, c8, c9]).

%%% Define any helper predicates here

% remove(Element, List, Remainder)
% Helper for permute/2.
remove(X, L, R) :-
    append(P1, [X | P2], L),
    append(P1, P2, R).

% permute(List, Permutation)
% Generates a permutation of List.
permute([], []).
permute(List, [H | T]) :-
    remove(H, List, Remainder),
    permute(Remainder, T).

% all_within_window(Route, CurrentTime)
% Recursively checks if all arrival times in the route are valid.
% Route is a list like [CurrentStop, NextStop, ...].
% CurrentTime is the arrival time at CurrentStop.
all_within_window([_], _).
all_within_window([Prev, Next | Rest], CurrentTime) :-
    travel(Prev, Next, T),
    Arrival is CurrentTime + T,
    window(Next, Start, End),
    Arrival >= Start,
    Arrival < End,
    all_within_window([Next | Rest], Arrival).

% Helper to print window info. Fails if no window fact exists.
print_window_info(Customer) :-
    window(Customer, Start, End),
    write(" --> Arrived within window ["), write(Start), write(", "), write(End), write(")"), nl.

% Wrapper predicate that always succeeds
safe_print_window(Customer) :-
    print_window_info(Customer). % Tries to print
safe_print_window(_Customer) :-
    true. % Catches the failure and succeeds

%%% Define solve below

% solve(L)
% Solves the 9-customer problem using Generate and Test.
% L: A list representing the (variable) order of customers.
solve(L) :-
    customers(CustList),
    % 1. GENERATE: Create a full permutation of the customers
    permute(CustList, Ordered),
    % 2. TEST: Check if this route is valid
    append([w], Ordered, Route),
    valid_route(Route),
    L = Route.

% valid_route(Route)
% Checks the full route starting from the warehouse at time 0.
valid_route([w | Rest]) :-
    all_within_window([w | Rest], 0).

%%% Define printSolution below

% printSolution(Route)
% Prints a log of the travel legs.
printSolution([_]). % Base case
printSolution([Prev, Next | Rest]) :-
    travel(Prev, Next, T),
    write("Travel from "), write(Prev), write(" to "), write(Next),
    write(" (time: "), write(T), write(" mins)"), nl,
    safe_print_window(Next), % Call the new safe helper
    nl,
    printSolution([Next | Rest]).

%%%%% SECTION: q1_8cust_gen_and_test_solve_and_print
solveAndPrint :-
    Start is cputime,
    solve(L),
    End is cputime,
    Time is End - Start,
    write("The problem was solved in "), write(Time), write(" seconds"), nl, nl,
    printSolution(L).

%%%%% END
% DO NOT PUT ANY ATOMIC PROPOSITIONS OR LINES BELOW
