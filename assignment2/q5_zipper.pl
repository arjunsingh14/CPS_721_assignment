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
% Add the required statements in the q5_rules section below.
% Any helper predicates should also be added to that section.
% Do NOT delete, edit, or add SECTION headers.
% If you put statements in the wrong section, you will lose marks.
%
% You may add additional comments as you choose but DO NOT MODIFY 
% the already included comment lines below
%

%%%%% SECTION: q5_rules
%%%%% You should put your rules in this section, including helper predicates.
%%%%% Predicate definition: zipper(List1, List2, Zipper)

% Case 1: If the first list is empty, result will be the second list
zipper(nil, L2, L2).
% Case 2: If the second list is empty, result will be the first list
zipper(L1, nil, L1).    
% Case 3: Both lists have elements and are non-empty
zipper(next(H1, T1), L2, next(H1, ZRest)) :-
    zipper_alt(T1, L2, ZRest).
% Helper predicate to alternate starting with List2
zipper_alt(L1, next(H2, T2), next(H2, ZRest)) :-
    zipper(L1, T2, ZRest).
% If List2 runs out during alternation
zipper_alt(L1, nil, L1).

%%%%% END
% DO NOT PUT ANY ATOMIC PROPOSITIONS OR LINES BELOW
