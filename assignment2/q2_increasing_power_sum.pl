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
%%%%% NAME:
%%%%% STUDENT ID:
%
% Add the required statements in the q2_rules section below.
% Any helper predicates should also be added to that section.
% Do NOT delete, edit, or add SECTION headers.
% If you put statements in the wrong section, you will lose marks.
%
% You may add additional comments as you choose but DO NOT MODIFY 
% the already included comment lines below
%

%%%%% SECTION: q2_rules
%%%%% You should put your rules in this section, including helper predicates.
%%%%% Predicate definition: increasingPowerSum(List, Power, PowerInc, Sum)

increasingPowerSum(List, Power, PowerInc, Sum) :-
    helper(List, Power, PowerInc, Sum).

helper([], _, _, 0).

helper([H|T], P, Inc, Sum) :-
    HP is H ^ P,
    P1 is P + Inc,
    helper(T, P1, Inc, Rest),
    Sum is HP + Rest.



%%%%% END
% DO NOT PUT ANY ATOMIC PROPOSITIONS OR LINES BELOW