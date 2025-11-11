% Enter the names of your group members below.
% If you only have 2 group members, leave the last space blank
%
%%%%%
%%%%% NAME: Arjun Bhandal
%%%%% NAME: Golsa Momeni
%%%%% NAME: Bardia Shirsalimian
% Add the required rules in the corresponding sections. 
% If you put the rules in the wrong sections, you will lose marks.
%
% You may add additional comments as you choose but DO NOT MODIFY the comment lines below
%

%%%%% SECTION: current_year
%%%%% This section defined the current year
%%%%% You can edit it if you want to test your code with different current years
%%%%% However, our autograder will ignore everything in this section

currentYear(2025).


%%%%% SECTION: kb_import
%%%%% This section simply imports the movie KB file.
%%%%% You may edit it to toggle between different KBs for testing.
%%%%% However, our autograder will ignore everything in this section

:- [movie_kb].



%%%%% SECTION: lexicon_and_helpers
%%%%% Put the rules/statements defining articles, adjectives, proper nouns, common nouns,
%%%%% and prepositions in this section.
%%%%% You should also put your the helpers described in q2 in this part.
%%%%% You may introduce other helpers for defining your lexicon as you see fit.
%%%%% DO NOT INCLUDE ANY KB atomic statements in this section. 
%%%%% Those should appear in movie_kb.pl


%% helper predicates for part a

%% will succeed if Name is the name of any movie
movie(Name) :-
    releaseInfo(Name, _, _).

%% will succeed if X is the name of any actor
   
actor(X) :-
    actedIn(X, _, _).

%% will succeed if X is the name of any director

director(X) :-
    directedBy(_, X).

%% will succeed if X is the name of any character

character(X) :-
    actedIn(_, _, X).
    
%% will succeed if X is any genre that appears in the knowledge base

genre(X) :-
    movieGenre(_, X).

%% will succeed if X is a release year for any movie

releaseYear(X) :-
    releaseInfo(_, X, _).

%% will succeed if X is a movie length that appears in the knowledge base

movieLength(X) :-
    releaseInfo(_, _, X).

%% helper predicates for part b

newDirector(Name) :-
    currentYear(Y),
    directedBy(Movie, Name),
    releaseInfo(Movie, Y, _),
    not((directedBy(OldMovie, Name),
         releaseInfo(OldMovie, OldYear, _),
         OldYear < Y)).

%% helper predicates for part c
    
newActor(Name) :-
    currentYear(Y),
    actedIn(Name, Movie, _),
    releaseInfo(Movie, Y, _),
    not((actedIn(Name, OldMovie, _),
         releaseInfo(OldMovie, OldYear, _),
         OldYear < Y)).

%% helper predicate for part d

genreDirector(Name, Genre) :-
    directedBy(Movie1, Name),
    directedBy(Movie2, Name),
    movieGenre(Movie1, Genre),
    movieGenre(Movie2, Genre),
    not(Movie1 = Movie2).

%% helper predicates for part e

genreActor(Name, Genre) :-
    actedIn(Name, Movie1, _),
    actedIn(Name, Movie2, _),
    movieGenre(Movie1, Genre),
    movieGenre(Movie2, Genre),
    not(Movie1 = Movie2).

%%%%% SECTION: parser_import
%%%%% This section imports the parser. By default, it imports the 
%%%%% original parser. To test your edited parser, comment out the first
%%%%% line and uncomment the second. Your code should work when only one
%%%%% of these is uncommented at any time, as our autograder will only
%%%%% import the original parser or q5_parser depended on which part of
%%%%% the assignment is being graded.

:- [original_parser].
%:- [q5_parser]



%%%%% SECTION: define_what
%%%%% This section defines the "what" predicate used for interacting with
%%%%% your program. It includes a convenient form of the "what" predicate
%%%%% that takes in a string instead of a list of words as atoms

% The usual "what" call, but ensures a list is provided
what(Words, Ref) :- is_list(Words), np(Words, Ref).


% Allows for queries like 'what("the steven_spielberg movie from 2022", X)'
% Simply tokenizes the strong, converts the strings to atoms, and calls what
% on the list of atoms.
what(WordsString, Ref) :- string(WordsString),
   atom_list_from_string(WordsString, Words), what(Words, Ref).

% Convers a list of strings to a list of atoms
strings_to_atoms([], []).
strings_to_atoms([String | RestStrings], [Atom | RestAtoms]) :-
   atom_string(Atom, String), strings_to_atoms(RestStrings, RestAtoms).

% Takes in a string where words are separated by spaces, and finds a list
% of atoms corresponding to that string.
% ie. " hello    world how are  you   " becomes [hello, world, how, are, you]
atom_list_from_string(WordsString, AtomList) :-
   split_string(WordsString, " ", " ", WordList), strings_to_atoms(WordList, AtomList).

article(a).
article(an).
article(the).
article(any).

common_noun(movie, What) :- movie(What).
common_noun(film, What) :- movie(What).
common_noun(actor, What) :- actor(What).
common_noun(director, What) :- director(What).
common_noun(character, What) :- character(What).
common_noun(length, What) :- movieLength(What).
common_noun(running_time, What) :- movieLength(What).
common_noun(genre, What) :- genre(What).
common_noun(release_year, What) :- releaseYear(What).

adjective(three_hour, What) :-
    movie(What),
    releaseInfo(What, _, Length),
    Length >= 180.

adjective(short, What) :-
    movie(What),
    releaseInfo(What, _, Length),
    Length < 60.

adjective(new, What) :-
    movie(What),
    currentYear(Y),
    releaseInfo(What, Y, _).

adjective(new, What) :-
    actor(What),
    newActor(What).

adjective(new, What) :-
    director(What),
    newDirector(What).

adjective(Adj, What) :-
    genre(Adj),
    movie(What),
    movieGenre(What, Adj).

adjective(Adj, What) :-
    genre(Adj),
    actor(What),
    genreActor(What, Adj).

adjective(Adj, What) :-
    genre(Adj),
    director(What),
    genreDirector(What, Adj).

adjective(Adj, What) :-
    director(Adj),
    movie(What),
    directedBy(What, Adj).

adjective(Adj, What) :-
    actor(Adj),
    movie(What),
    actedIn(Adj, What, _).

proper_noun(Name) :- movie(Name).
proper_noun(Name) :- actor(Name).
proper_noun(Name) :- director(Name).
proper_noun(Name) :- character(Name).
proper_noun(Num) :- number(Num).

preposition(by, What, Ref) :-
    movie(What),
    director(Ref),
    directedBy(What, Ref).

preposition(with, What, Ref) :-
    movie(What),
    actor(Ref),
    actedIn(Ref, What, _).

preposition(with, What, Ref) :-
    movie(What),
    character(Ref),
    actedIn(_, What, Ref).

preposition(in, What, Ref) :-
    actor(What),
    movie(Ref),
    actedIn(What, Ref, _).

preposition(in, What, Ref) :-
    character(What),
    movie(Ref),
    actedIn(_, Ref, What).

preposition(from, What, Ref) :-
    movie(What),
    releaseYear(Ref),
    releaseInfo(What, Ref, _).

preposition(released_in, What, Ref) :-
    movie(What),
    releaseYear(Ref),
    releaseInfo(What, Ref, _).

preposition(played_by, What, Ref) :-
    character(What),
    actor(Ref),
    actedIn(Ref, _, What).

preposition(of, What, Ref) :-
    movieLength(What),
    movie(Ref),
    releaseInfo(Ref, _, What).

preposition(of, What, Ref) :-
    releaseYear(What),
    movie(Ref),
    releaseInfo(Ref, What, _).
   



