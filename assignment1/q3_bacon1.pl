% Enter the names of ID of your group members below.
% For STUDENT ID, use your 9-digit ONECARD number.
% If you have 2 group members, leave the last entry blank.
%
%%%%%
%%%%% NAME: Arjun Bhandal
%%%%% STUDENT ID: 501088530
%%%%%
%%%%% NAME:
%%%%% STUDENT ID:
%%%%%
%%%%% NAME: Golsa Momeni
%%%%% STUDENT ID: 501202209
%
% Add the required statements in the q3a_can_reach section below.
% Any helper predicates should also be added to that section.
% Do NOT delete, edit, or add SECTION headers.
% If you put statements in the wrong section, you will lose marks.
%
% You may add additional comments as you choose but DO NOT MODIFY 
% the already included comment lines below
%


%%%%% SECTION: q3a_movie_kb_import
% The following line will import your movie KB. You can feel free to
% edit this line if you want to import and test on different KBs.
% We will ignore this section when testing your code, and instead test
% on our own KBs.
:- [q1_movie_kb].



%%%%% SECTION: q3a_can_reach
% You define canReach and any helper predicates below.

appeared(A) :-
    actedIn(A, _, _).

together(A, B) :-
    actedIn(A, M, _),
    actedIn(B, M, _),
    not(A = B).

canReach(A, A, M) :-
    M >= 0,
    appeared(A).

canReach(A, B, M) :-
    M > 0,
    together(A, B).

canReach(A, B, M) :-
    M > 0,
    together(A, C),
    M1 is M - 1,
    canReach(C, B, M1).



%%%%% END
% DO NOT PUT ANY ATOMIC PROPOSITIONS OR LINES BELOW
