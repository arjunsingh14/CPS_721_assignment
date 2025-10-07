% Enter the names of ID of your group members below.
% For STUDENT ID, use your 9-digit ONECARD number.
% If you have 2 group members, leave the last entry blank.
%
%%%%%
%%%%% NAME: Bardia Shirsalimian
%%%%% STUDENT ID: 501280070
%%%%%
%%%%% NAME:
%%%%% STUDENT ID:
%%%%%
%%%%% NAME:
%%%%% STUDENT ID:
%
% Add the required statements in the q3_rules section below.
% Any helper predicates should also be added to that section.
% Do NOT delete, edit, or add SECTION headers.
% If you put statements in the wrong section, you will lose marks.
%
% You may add additional comments as you choose but DO NOT MODIFY 
% the already included comment lines below
%
% Base case
splitOnInt([], _Value, [], []).

splitOnInt([H | T], Value, [H | NL], L) :-
    H =< Value,
    splitOnInt(T, Value, NL, L).

splitOnInt([H | T], Value, NL, [H | L]) :-
    H > Value,
    splitOnInt(T, Value, NL, L).

%%%%% SECTION: q3_rules
%%%%% You should put your rules in this section, including helper predicates.
%%%%% Predicate definition: splitOnInt(List, Value, NoLargerList, LargerList)


%%%%% END
% DO NOT PUT ANY ATOMIC PROPOSITIONS OR LINES BELOW
