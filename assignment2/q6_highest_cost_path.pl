% Enter the names of ID of your group members below.
% For STUDENT ID, use your 9-digit ONECARD number.
% If you have 2 group members, leave the last entry blank.
%
%%%%%
%%%%% NAME: Golsa Momeni
%%%%% STUDENT ID: 501202209
%%%%%
%%%%% NAME:
%%%%% STUDENT ID:
%%%%%
%%%%% NAME:
%%%%% STUDENT ID:
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


%%%%% END
% DO NOT PUT ANY ATOMIC PROPOSITIONS OR LINES BELOW
