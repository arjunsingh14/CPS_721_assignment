% Enter the names of ID of your group members below.
% For STUDENT ID, use your 9-digit ONECARD number.
% If you have 2 group members, leave the last entry blank.
%
%%%%%
%%%%% NAME: Arjun
%%%%% STUDENT ID: 501088530
%%%%%
%%%%% NAME:
%%%%% STUDENT ID:
%%%%%
%%%%% NAME:
%%%%% STUDENT ID:
%
% Add the required statements in the q3a_can_reach_through_2_movies section below.
% Any helper predicates should also be added to that section.
% Do NOT delete, edit, or add SECTION headers.
% If you put statements in the wrong section, you will lose marks.
%
% You may add additional comments as you choose but DO NOT MODIFY 
% the already included comment lines below
%


%%%%% SECTION: q3c_kb_import
% The following line will import your movie KB. You can feel free to
% edit this line if you want to import and test on different KBs.
% We will ignore this section when testing your code, and instead test
% on our own KBs.
:- [q1_movie_kb].



%%%%% SECTION: q3c_can_reach_through_2_movies
% You define canReachThrough2Movies and any helper predicates below.
% If you decide to reuse your canReach and canReachThroughMovie implementations from q3a 
% and q3b as part of this solution, include it below. To avoid collision if you first compile
% q3_bacon1 and then q3_bacon2, we suggest you rename canReach to something else.
% Do NOT use an import statement like the one in section q3c_kb_import to import and reuse
% your answer to parts (a) and (b) below. 

% Done going through needed movies, just find rest of path

appeared(A) :-
    actedIn(A, _, _).

step(A, B, Mov) :-
    actedIn(A, Mov, _),
    actedIn(B, Mov, _),
    not(A = B).

canReachThrough2Movies(A, B, Mov1, Mov2, M) :-
    M > 0,
    reach2(A, A, B, Mov1, Mov2, no, no, 0, M).

reach2(_, X, X, Mov1, Mov2, _, _, CntSame, M) :-
    M >= 0,
    Mov1 = Mov2,
    CntSame >= 2.

reach2(_, X, X, Mov1, Mov2, Used1, Used2, _, M) :-
    M >= 0,
    not(Mov1 = Mov2),
    Used1 = yes,
    Used2 = yes.

reach2(S, A, B, Mov1, Mov2, U1, U2, Cnt, M) :-
    M > 0,
    Mov1 = Mov2,
    step(A, C, Mov),
    Mov = Mov1,
    M1 is M - 1,
    C1 is Cnt + 1,
    reach2(S, C, B, Mov1, Mov2, U1, U2, C1, M1).

reach2(S, A, B, Mov1, Mov2, U1, U2, Cnt, M) :-
    M > 0,
    Mov1 = Mov2,
    step(A, C, Mov),
    not(Mov = Mov1),
    M1 is M - 1,
    reach2(S, C, B, Mov1, Mov2, U1, U2, Cnt, M1).

reach2(S, A, B, Mov1, Mov2, _U1, U2, Cnt, M) :-
    M > 0,
    not(Mov1 = Mov2),
    step(A, C, Mov),
    Mov = Mov1,
    M1 is M - 1,
    reach2(S, C, B, Mov1, Mov2, yes, U2, Cnt, M1).

reach2(S, A, B, Mov1, Mov2, U1, _U2, Cnt, M) :-
    M > 0,
    not(Mov1 = Mov2),
    step(A, C, Mov),
    Mov = Mov2,
    M1 is M - 1,
    reach2(S, C, B, Mov1, Mov2, U1, yes, Cnt, M1).

reach2(S, A, B, Mov1, Mov2, U1, U2, Cnt, M) :-
    M > 0,
    not(Mov1 = Mov2),
    step(A, C, Mov),
    not(Mov = Mov1),
    not(Mov = Mov2),
    M1 is M - 1,
    reach2(S, C, B, Mov1, Mov2, U1, U2, Cnt, M1).




%%%%% END
% DO NOT PUT ANY ATOMIC PROPOSITIONS OR LINES BELOW
