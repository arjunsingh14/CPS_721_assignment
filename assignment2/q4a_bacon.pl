% Enter the names of ID of your group members below.
% For STUDENT ID, use your 9-digit ONECARD number.
% If you have 2 group members, leave the last entry blank.
%
%%%%%
%%%%% NAME: Bardia Shirsalimian
%%%%% STUDENT ID: 501280070
%%%%%
%%%%% NAME: Arjun Bhandal
%%%%% STUDENT ID: 501088530
%%%%%
%%%%% NAME: Golsa Momeni
%%%%% STUDENT ID: 501202209
%
% Add the required statements in the q4a_rules section below.
% Any helper predicates should also be added to that section.
% Do NOT delete, edit, or add SECTION headers.
% If you put statements in the wrong section, you will lose marks.
%
% You may add additional comments as you choose but DO NOT MODIFY 
% the already included comment lines below
%

%%%%% SECTION: q4a_movie_kb_import
% The following line will import a file called "movie_kb.pl". 
% Thus, you can create such a file to test your program.
% You can feel free tovedit this line if you want to import and test 
% on different KBs. We will ignore this section when testing your code, 
% and instead test on our own KBs.
:- [movie_kb].


%%%%% SECTION: q4a_rules
%%%%% You should put your rules in this section, including helper predicates.
%%%%% Predicate definition: canReach(A1, A2, M, ActorPath, MoviePath)

% Helper: actor must appear in at least one movie in the KB
has_movie(A) :- acted_in(A, _).

step_next(Actor, NextActor, Movie, VisitedActors, VisitedMovies) :-
    acted_in(Actor, Movie),
    acted_in(NextActor, Movie),
    not(Actor = NextActor),
    not(member(NextActor, VisitedActors)),
    not(member(Movie, VisitedMovies)).

canReach(A1, A2, M, ActPath, MoviePath) :-
    M >= 0,
    canReach_aux(A1, A2, M, [A1], [], ActPath, MoviePath).

% Base: an actor can reach themselves in 0 steps iff they appear in the KB
canReach_aux(A, A, _M, _VA, _VM, [A], []) :-
    has_movie(A).

canReach_aux(A, B, M, VA, VM, [A|AT], [Movie|MT]) :-
    M > 0,
    step_next(A, NextA, Movie, VA, VM),
    M1 is M - 1,
    canReach_aux(NextA, B, M1, [NextA|VA], [Movie|VM], AT, MT).

%%%%% END

