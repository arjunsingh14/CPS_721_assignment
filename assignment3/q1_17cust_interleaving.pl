
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

%%%%% SECTION: q1_17cust_interleaving_solution
%%%%% Put the different components of your delivery truck solution below

%%% Put the KB you need for this problem (not including variable domains here).

% --- Time Windows (c1-c17) ---
time_window(c1, 90, 150).
time_window(c2, 200, 400).
time_window(c3, 60, 180).
time_window(c4, 60, 120).
time_window(c5, 150, 200).
time_window(c6, 200, 320).
time_window(c7, 200, 320).
time_window(c8, 330, 460).
time_window(c9, 300, 360).
time_window(c10, 510, 600).
time_window(c11, 420, 500).
time_window(c12, 420, 480).
time_window(c13, 510, 600).
time_window(c14, 360, 420).
time_window(c15, 360, 400).
time_window(c16, 480, 600).
time_window(c17, 410, 480).
time_window(c18, 510, 600).

% --- Travel Times (w, c1-c17) ---
travel(w, c1, 100). travel(c1, w, 100).
travel(w, c2, 50). travel(c2, w, 50).
travel(w, c3, 70). travel(c3, w, 70).
travel(w, c4, 30). travel(c4, w, 30).
travel(w, c5, 45). travel(c5, w, 45).
travel(w, c6, 32). travel(c6, w, 32).
travel(w, c7, 56). travel(c7, w, 56).
travel(w, c8, 40). travel(c8, w, 40).
travel(w, c9, 45). travel(c9, w, 45).
travel(w, c10, 40). travel(c10, w, 40).
travel(w, c11, 18). travel(c11, w, 18).
travel(w, c12, 20). travel(c12, w, 20).
travel(w, c13, 30). travel(c13, w, 30).
travel(w, c14, 26). travel(c14, w, 26).
travel(w, c15, 35). travel(c15, w, 35).
travel(w, c16, 20). travel(c16, w, 20).
travel(w, c17, 5). travel(c17, w, 5).

travel(c1, c2, 25). travel(c2, c1, 25).
travel(c1, c3, 75). travel(c3, c1, 75).
travel(c1, c4, 35). travel(c4, c1, 35).
travel(c1, c5, 55). travel(c5, c1, 55).
travel(c1, c6, 45). travel(c6, c1, 45).
travel(c1, c7, 105). travel(c7, c1, 105).
travel(c1, c8, 40). travel(c8, c1, 40).
travel(c1, c9, 30). travel(c9, c1, 30).
travel(c1, c10, 25). travel(c10, c1, 25).
travel(c1, c11, 5). travel(c11, c1, 5).
travel(c1, c12, 15). travel(c12, c1, 15).
travel(c1, c13, 20). travel(c13, c1, 20).
travel(c1, c14, 15). travel(c14, c1, 15).
travel(c1, c15, 10). travel(c15, c1, 10).
travel(c1, c16, 25). travel(c16, c1, 25).
travel(c1, c17, 18). travel(c17, c1, 18).

travel(c2, c3, 35). travel(c3, c2, 35).
travel(c2, c4, 27). travel(c4, c2, 27).
travel(c2, c5, 50). travel(c5, c2, 50).
travel(c2, c6, 25). travel(c6, c2, 25).
travel(c2, c7, 45). travel(c7, c2, 45).
travel(c2, c8, 75). travel(c8, c2, 75).
travel(c2, c9, 20). travel(c9, c2, 20).
travel(c2, c10, 10). travel(c10, c2, 10).
travel(c2, c11, 45). travel(c11, c2, 45).
travel(c2, c12, 20). travel(c12, c2, 20).
travel(c2, c13, 56). travel(c13, c2, 56).
travel(c2, c14, 19). travel(c14, c2, 19).
travel(c2, c15, 35). travel(c15, c2, 35).
travel(c2, c16, 70). travel(c16, c2, 70).
travel(c2, c17, 25). travel(c17, c2, 25).

travel(c3, c4, 15). travel(c4, c3, 15).
travel(c3, c5, 54). travel(c5, c3, 54).
travel(c3, c6, 40). travel(c6, c3, 40).
travel(c3, c7, 10). travel(c7, c3, 10).
travel(c3, c8, 15). travel(c8, c3, 15).
travel(c3, c9, 90). travel(c9, c3, 90).
travel(c3, c10, 10). travel(c10, c3, 10).
travel(c3, c11, 10). travel(c11, c3, 10).
travel(c3, c12, 10). travel(c12, c3, 10).
travel(c3, c13, 34). travel(c13, c3, 34).
travel(c3, c14, 35). travel(c14, c3, 35).
travel(c3, c15, 20). travel(c15, c3, 20).
travel(c3, c16, 15). travel(c16, c3, 15).
travel(c3, c17, 10). travel(c17, c3, 10).

travel(c4, c5, 25). travel(c5, c4, 25).
travel(c4, c6, 30). travel(c6, c4, 30).
travel(c4, c7, 35). travel(c7, c4, 35).
travel(c4, c8, 25). travel(c8, c4, 25).
travel(c4, c9, 23). travel(c9, c4, 23).
travel(c4, c10, 25). travel(c10, c4, 25).
travel(c4, c11, 20). travel(c11, c4, 20).
travel(c4, c12, 50). travel(c12, c4, 50).
travel(c4, c13, 19). travel(c13, c4, 19).
travel(c4, c14, 45). travel(c14, c4, 45).
travel(c4, c15, 45). travel(c15, c4, 45).
travel(c4, c16, 25). travel(c16, c4, 25).
travel(c4, c17, 30). travel(c17, c4, 30).

travel(c5, c6, 100). travel(c6, c5, 100).
travel(c5, c7, 25). travel(c7, c5, 25).
travel(c5, c8, 67). travel(c8, c5, 67).
travel(c5, c9, 20). travel(c9, c5, 20).
travel(c5, c10, 30). travel(c10, c5, 30).
travel(c5, c11, 5). travel(c11, c5, 5).
travel(c5, c12, 25). travel(c12, c5, 25).
travel(c5, c13, 20). travel(c13, c5, 20).
travel(c5, c14, 70). travel(c14, c5, 70).
travel(c5, c15, 26). travel(c15, c5, 26).
travel(c5, c16, 40). travel(c16, c5, 40).
travel(c5, c17, 10). travel(c17, c5, 10).

travel(c6, c7, 25). travel(c7, c6, 25).
travel(c6, c8, 25). travel(c8, c6, 25).
travel(c6, c9, 50). travel(c9, c6, 50).
travel(c6, c10, 45). travel(c10, c6, 45).
travel(c6, c11, 100). travel(c11, c6, 100).
travel(c6, c12, 10). travel(c12, c6, 10).
travel(c6, c13, 34). travel(c13, c6, 34).
travel(c6, c14, 10). travel(c14, c6, 10).
travel(c6, c15, 30). travel(c15, c6, 30).
travel(c6, c16, 5). travel(c16, c6, 5).
travel(c6, c17, 56). travel(c17, c6, 56).

travel(c7, c8, 15). travel(c8, c7, 15).
travel(c7, c9, 45). travel(c9, c7, 45).
travel(c7, c10, 60). travel(c10, c7, 60).
travel(c7, c11, 10). travel(c11, c7, 10).
travel(c7, c12, 35). travel(c12, c7, 35).
travel(c7, c13, 45). travel(c13, c7, 45).
travel(c7, c14, 15). travel(c14, c7, 15).
travel(c7, c15, 15). travel(c15, c7, 15).
travel(c7, c16, 20). travel(c16, c7, 20).
travel(c7, c17, 32). travel(c17, c7, 32).

travel(c8, c9, 20). travel(c9, c8, 20).
travel(c8, c10, 90). travel(c10, c8, 90).
travel(c8, c11, 40). travel(c11, c8, 40).
travel(c8, c12, 17). travel(c12, c8, 17).
travel(c8, c13, 34). travel(c13, c8, 34).
travel(c8, c14, 15). travel(c14, c8, 15).
travel(c8, c15, 25). travel(c15, c8, 25).
travel(c8, c16, 20). travel(c16, c8, 20).
travel(c8, c17, 15). travel(c17, c8, 15).

travel(c9, c10, 35). travel(c10, c9, 35).
travel(c9, c11, 60). travel(c11, c9, 60).
travel(c9, c12, 15). travel(c12, c9, 15).
travel(c9, c13, 10). travel(c13, c9, 10).
travel(c9, c14, 9). travel(c14, c9, 9).
travel(c9, c15, 15). travel(c15, c9, 15).
travel(c9, c16, 15). travel(c16, c9, 15).
travel(c9, c17, 100). travel(c17, c9, 100).

travel(c10, c11, 15). travel(c11, c10, 15).
travel(c10, c12, 18). travel(c12, c10, 18).
travel(c10, c13, 20). travel(c13, c10, 20).
travel(c10, c14, 40). travel(c14, c10, 40).
travel(c10, c15, 70). travel(c15, c10, 70).
travel(c10, c16, 25). travel(c16, c10, 25).
travel(c10, c17, 45). travel(c17, c10, 45).

travel(c11, c12, 15). travel(c12, c11, 15).
travel(c11, c13, 20). travel(c13, c11, 20).
travel(c11, c14, 30). travel(c14, c11, 30).
travel(c11, c15, 30). travel(c15, c11, 30).
travel(c11, c16, 15). travel(c16, c11, 15).
travel(c11, c17, 20). travel(c17, c11, 20).

travel(c12, c13, 45). travel(c13, c12, 45).
travel(c12, c14, 40). travel(c14, c12, 40).
travel(c12, c15, 20). travel(c15, c12, 20).
travel(c12, c16, 20). travel(c16, c12, 20).
travel(c12, c17, 10). travel(c17, c12, 10).

travel(c13, c14, 20). travel(c14, c13, 20).
travel(c13, c15, 10). travel(c15, c13, 10).
travel(c13, c16, 19). travel(c16, c13, 19).
travel(c13, c17, 16). travel(c17, c13, 16).

travel(c14, c15, 5). travel(c15, c14, 5).
travel(c14, c16, 15). travel(c16, c14, 15).
travel(c14, c17, 10). travel(c17, c14, 10).

travel(c15, c16, 20). travel(c16, c15, 20).
travel(c15, c17, 40). travel(c17, c15, 40).

travel(c16, c17, 30). travel(c17, c16, 30).

travel(w, c18, 40). travel(c18, w, 40).
travel(c1, c18, 10). travel(c18, c1, 10).
travel(c2, c18, 35). travel(c18, c2, 35).
travel(c3, c18, 40). travel(c18, c3, 40).
travel(c4, c18, 10). travel(c18, c4, 10).
travel(c5, c18, 15). travel(c18, c5, 15).
travel(c6, c18, 25). travel(c18, c6, 25).
travel(c7, c18, 20). travel(c18, c7, 20).
travel(c8, c18, 70). travel(c18, c8, 70).
travel(c9, c18, 35). travel(c18, c9, 35).
travel(c10, c18, 30). travel(c18, c10, 30).
travel(c11, c18, 20). travel(c18, c11, 20).
travel(c12, c18, 25). travel(c18, c12, 25).
travel(c13, c18, 15). travel(c18, c13, 15).
travel(c14, c18, 15). travel(c18, c14, 15).
travel(c15, c18, 30). travel(c18, c15, 30).
travel(c16, c18, 15). travel(c18, c16, 15).
travel(c17, c18, 40). travel(c18, c17, 40).


%%% Put the domains for your variables below

customers([c1, c2, c3, c4, c5, c6, c7, c8, c9, c10,
           c11, c12, c13, c14, c15, c16, c17, c18]).

%%% Define any helper predicates (except connected which should appear above) here

% --- Interleaving Solver ---

% solve_interleaved(CurrentLoc, CurrentTime, Unvisited, PathSoFar, FinalPath)
% Base Case: If the list of unvisited customers is empty, we are done.
solve_interleaved(_CurrentLoc, _CurrentTime, [], PathSoFar, PathSoFar).

% Recursive Step:
solve_interleaved(CurrentLocation, CurrentTime, UnvisitedCustomers, PathSoFar, FinalPath) :-
    
    % 1. GENERATE (one step):
    % Pick a NextCustomer from the unvisited list.
    remove(NextCustomer, UnvisitedCustomers, RemainingCustomers),
    
    % 2. TEST (one step):
    % Check if moving from CurrentLocation to NextCustomer is valid.
    travel(CurrentLocation, NextCustomer, TravelTime),
    NewTime is CurrentTime + TravelTime,
    check_window(NextCustomer, NewTime),
    
    % 3. RECURSE:
    % If the test passed, continue from this new state.
    solve_interleaved(NextCustomer, NewTime, RemainingCustomers, [NextCustomer | PathSoFar], FinalPath).


% --- Other Helpers ---

% remove(Element, List, Remainder)
% Removes one instance of Element from List, leaving Remainder.
remove(X, L, R) :-
    append(P1, [X | P2], L),
    append(P1, P2, R).

% check_window(Customer, ArrivalTime)
% Succeeds if ArrivalTime is within the customer's [Start, End) window.
check_window(Customer, ArrivalTime) :-
    time_window(Customer, Start, End),
    ArrivalTime >= Start,
    ArrivalTime < End.

% Helper for printSolution
print_route([]).
print_route([H | T]) :-
    write(' -> '),
    write(H),
    print_route(T).


%%% Define solve below. Remember that solve should take in the list of
%%% variables to assign. MAKE SURE TO BRIEFLY EXPLAIN THE MEANING OF
%%% YOUR VARIABLES IN A COMMENT

% solve(L)
% Solves the 17-customer problem using interleaving.
% L: A list representing the order of customers to visit.
solve(L) :-
    customers(Customers),
    
    % Call the interleaved helper, starting at 'w' (warehouse) at time 0.
    % The path is built in reverse, so we'll need to reverse it at the end.
    solve_interleaved(w, 0, Customers, [], ReversePath),
    
    % Reverse the path to get the correct order.
    reverse(ReversePath, L).


%%% Define printSolution below. This should take in the list of variables
%%% after they have been assigned values, and outputs the solution in a
%%% human readable form.
%%% REMEMBER TO LOG YOUR FINAL OUTPUT AND RUNTIME IN assignment3_report.pdf

% printSolution(L)
% Prints the solution L in a human-readable format.
printSolution(L) :-
    write('Valid delivery route: w'),
    print_route(L).


%%%%% SECTION: q1_17cust_interleaving_solve_and_print
%%%%% The following calls the solve predicate, passes the variables to
%%%%% printSolution and outputs the time needed to solve the problem.
%%%%% This is the main way we will interact with your program.
%%%%% You can test it however youVj want though.
%%%%% DO NOT EDIT.

solveAndPrint :- Start is cputime, solve(L), End is cputime, Time is End-Start,
    write("The problem was solved in "), write(Time), write(" seconds"), nl, nl,
    printSolution(L).

%%%%% END
% DO NOT PUT ANY ATOMIC PROPOSITIONS OR LINES BELOW
