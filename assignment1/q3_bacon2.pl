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
%%%%% NAME:
%%%%% STUDENT ID:
%
% Add the required statements in the q3a_can_reach_through_movie section below.
% Any helper predicates should also be added to that section.
% Do NOT delete, edit, or add SECTION headers.
% If you put statements in the wrong section, you will lose marks.
%
% You may add additional comments as you choose but DO NOT MODIFY 
% the already included comment lines below
%


%%%%% SECTION: q3b_kb_import
% The following line will import your movie KB. You can feel free to
% edit this line if you want to import and test on different KBs.
% We will ignore this section when testing your code, and instead test
% on our own KBs.
:- [q1_movie_kb].



%%%%% SECTION: q3b_can_reach_through_movie
% You define canReachThroughMovie and any helper predicates below.
% If you decide to reuse your canReach implementation from q3a as part of this solution, 
% include it below. To avoid collision if you first compile q3_bacon1 and then q3_bacon2,
% we suggest you rename canReach to something else.
% Do NOT use an import statement like the one in section q3b_kb_import to import and reuse
% your answer to part (a) below.

appeared(A) :-
    actedIn(A, _, _).

step(A, B, Mov) :-
    actedIn(A, Mov, _),
    actedIn(B, Mov, _),
    not(A = B).

canReachThroughMovie(A, B, Movie, M) :-
    M > 0,
    step(A, C, Movie),
    M1 is M - 1,
    reach_used(A, C, B, Movie, M1).

canReachThroughMovie(A, B, Movie, M) :-
    M > 0,
    step(A, C, Mov),
    not(Movie = Mov),
    M1 is M - 1,
    canReachThroughMovie(C, B, Movie, M1).

reach_used(_, A, A, _, M) :-
    M >= 0,
    appeared(A).

reach_used(Start, A, B, Movie, M) :-
    M > 0,
    step(A, C, Mov),
    M1 is M - 1,
    reach_used(Start, C, B, Movie, M1),
    not(Start = B).


%%%%% END
% DO NOT PUT ANY ATOMIC PROPOSITIONS OR LINES BELOW
