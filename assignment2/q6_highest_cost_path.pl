% Enter the names of ID of your group members below.
% For STUDENT ID, use your 9-digit ONECARD number.
% If you have 2 group members, leave the last entry blank.
%
%%%%%
%%%%% NAME: Golsa Momeni
%%%%% STUDENT ID: 501202209
%%%%%
%%%%% NAME: Arjun Bhandal
%%%%% STUDENT ID: 501088530
%%%%%
%%%%% NAME: Bardia Shirsalimian
%%%%% STUDENT ID: 501280070
%
% Add the required statements in the q6_rules section below.
% Any helper predicates should also be added to that section.
% Do NOT delete, edit, or add SECTION headers.
% If you put statements in the wrong section, you will lose marks.
%
% You may add additional comments as you choose but DO NOT MODIFY 
% the already included comment lines below
%

%%%%% SECTION: q6_trees
%%%%% This section contains the tree given as an example in the assignment PDF.
%%%%% You can use it in a query as follows:
%%%%%
%%%%% ?- testTree(1, X), highestCostPath(X, Cost, Path).
%%%%% Feel free to add other test trees as you so choose in this section for your
%%%%% own testing. We will ignore this section as part of your submission so
%%%%% DO NOT put any helper predicates below.
testTree(1, 
    tree3(a,  % The root node has name a
            2, tree3(b, % Left child of a is b and can be reached with cost 2 
                    3, tree3(e, 0, none, 0, none, 0, none),   % Left child of b is e. It is a leaf node
                    5, tree3(f, 0, none, 0, none, 0, none),   % Middle child of b is f. It is a leaf node
                    0, none  % There is no right childe of b
                    ),
            3, tree3(c, 0, none, 0, none, 0, none),  % Middle child of a is c. It is a leaf node
            1, tree3(d,   % Right child of a is d
                    2, tree3(g, 0, none, 0, none,   % Left child of d is g. It has no left or middle child
                            1, tree3(h, 0, none, 0, none, 0, none)),   % The right child of g is h. It is a leaf node
                    0, none, 0, none  % d has no middle or right children
                    )
        )
).

%%%%% SECTION: q6_rules
%%%%% You should put your rules in this section, including helper predicates.
%%%%% Predicate definition: highestCostPath(Tree, PathCost, PathList)

% Base case: a leaf node
highestCostPath(tree3(Name, _, none, _, none, _, none), 0, [Name]).

% Case 1: only left child exists
highestCostPath(tree3(Name, LC, L, _, none, _, none), TotalCost, [Name | Path]) :-
    highestCostPath(L, SubCost, Path),
    TotalCost is LC + SubCost.

% Case 2: only middle child exists
highestCostPath(tree3(Name, _, none, MC, M, _, none), TotalCost, [Name | Path]) :-
    highestCostPath(M, SubCost, Path),
    TotalCost is MC + SubCost.

% Case 3: only right child exists
highestCostPath(tree3(Name, _, none, _, none, RC, R), TotalCost, [Name | Path]) :-
    highestCostPath(R, SubCost, Path),
    TotalCost is RC + SubCost.

% Case 4: left and middle children exist
highestCostPath(tree3(Name, LC, L, MC, M, _, none), MaxCost, [Name | MaxPath]) :-
    highestCostPath(L, CL, PL),
    highestCostPath(M, CM, PM),
    CostL is LC + CL,
    CostM is MC + CM,
    maxChildPath(CostL, PL, CostM, PM, MaxCost, MaxPath).

% Case 5: left and right children exist
highestCostPath(tree3(Name, LC, L, _, none, RC, R), MaxCost, [Name | MaxPath]) :-
    highestCostPath(L, CL, PL),
    highestCostPath(R, CR, PR),
    CostL is LC + CL,
    CostR is RC + CR,
    maxChildPath(CostL, PL, CostR, PR, MaxCost, MaxPath).

% Case 6: middle and right children exist
highestCostPath(tree3(Name, _, none, MC, M, RC, R), MaxCost, [Name | MaxPath]) :-
    highestCostPath(M, CM, PM),
    highestCostPath(R, CR, PR),
    CostM is MC + CM,
    CostR is RC + CR,
    maxChildPath(CostM, PM, CostR, PR, MaxCost, MaxPath).

% Case 7: all three children exist
highestCostPath(tree3(Name, LC, L, MC, M, RC, R), MaxCost, [Name | MaxPath]) :-
    highestCostPath(L, CL, PL),
    highestCostPath(M, CM, PM),
    highestCostPath(R, CR, PR),
    CostL is LC + CL,
    CostM is MC + CM,
    CostR is RC + CR,
    maxOfThree(CostL, PL, CostM, PM, CostR, PR, MaxCost, MaxPath).

% Helper predicate to choose max of two
maxChildPath(C1, P1, C2, P2, C1, P1) :- C1 >= C2.
maxChildPath(C1, _, C2, P2, C2, P2) :- C2 > C1.

% Helper predicate to choose max of three
maxOfThree(C1, P1, C2, P2, C3, P3, C1, P1) :- C1 >= C2, C1 >= C3.
maxOfThree(C1, P1, C2, P2, C3, P3, C2, P2) :- C2 >= C1, C2 >= C3.
maxOfThree(C1, P1, C2, P2, C3, P3, C3, P3) :- C3 >= C1, C3 >= C2.


%%%%% END
% DO NOT PUT ANY ATOMIC PROPOSITIONS OR LINES BELOW
