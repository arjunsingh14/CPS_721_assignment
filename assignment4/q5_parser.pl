% Enter the names of your group members below.
% If you only have 2 group members, leave the last space blank
%
%%%%% NAME: Bardia Shirsalimian 501280070
%%%%% NAME:
%%%%% NAME:
%
% This file contains the parser that you should edit for Q5.
% The code below is the same as in original_parser.pl.
%
% Ensure your lexicon works with just the parser in original_parser.pl.
% Further, ensure all your edits are in the augmented_parser section.
% If you put the rules anywhere else, you will lose marks.
%
% You may add additional comments as you choose but DO NOT MODIFY the comment lines below
%
%%%%% SECTION: augmented_parser
% Edit the following files for the functionality needed in q5
% Any helpers needed for editing the parser should also be included below.
%
% --------------------------------------------------------------------
% Base noun phrase structure (augmented for Q5)
% --------------------------------------------------------------------

/* Noun phrase can be a proper name or can start with an article */

np([Name], Name) :-
    proper_noun(Name).

np([Art | Rest], What) :-
    article(Art),
    np2(Rest, What).

/* If a noun phrase starts with an article, then it must be followed
   by another noun phrase that starts either with an adjective
   or with a common noun. */

/* Q5(b): handle "oldest" as a special adjective.
   We assume "oldest" is only meaningful for movies, and it must be
   the first adjective in the sequence (as per the assignment). */

np2([oldest | Rest], What) :-
    % First, parse the rest of the phrase without treating "oldest"
    % specially, to get candidate What.
    np2_no_oldest(Rest, What),
    % Then ensure What is one of the oldest satisfying that pattern.
    is_oldest_for(Rest, What).

% Standard adjective handling (non-oldest)
np2([Adj | Rest], What) :-
    adjective(Adj, What),
    np2(Rest, What).

% Standard noun handling
np2([Noun | Rest], What) :-
    common_noun(Noun, What),
    mods(Rest, What).

/* Helper: version of np2 that does NOT handle "oldest".
   This is used to describe the pattern that "oldest" ranges over. */

np2_no_oldest([Adj | Rest], What) :-
    adjective(Adj, What),
    np2_no_oldest(Rest, What).

np2_no_oldest([Noun | Rest], What) :-
    common_noun(Noun, What),
    mods(Rest, What).

/* Modifier(s) provide an additional specific info about nouns.
   A modifier can be:
     - a sequence of (existing) prepositional phrases, or
     - for Q5(a), a "between X and Y" constraint on a numeric value.
*/

mods([], _).

% Q5(a): handle "between X and Y" as a modifier on a numeric value.
% This clause consumes a leading "between ... and ..." segment and
% enforces: Lower < Value < Upper (non-inclusive).
mods([between | Words], Value) :-
    between_mod([between | Words], Value, Rest),
    mods(Rest, Value).

% Default behaviour: a (possibly empty) sequence of prepositional phrases.
mods(Words, What) :-
    append(Start, End, Words),
    prepPhrase(Start, What),
    mods(End, What).

/* Q5(a): "between" helper.
   between_mod(+TokensStartingWithBetween, +Val, -RestTokens)
   succeeds when Val is strictly between the two values described
   by the noun phrases after "between" and "and".
   The bounds themselves may be numbers or any NPs that the system
   can interpret as numbers (e.g., "the length of fury_road").
*/

between_mod([between | Words], Val, Rest) :-
    % Split at "and" into NP1Tokens and AfterAnd.
    append(NP1Tokens, [and | AfterAnd], Words),
    % First bound:
    np(NP1Tokens, Lower),
    % Second bound NP and remaining modifiers:
    append(NP2Tokens, Rest, AfterAnd),
    np(NP2Tokens, Upper),
    % Ensure both are numbers (handles integers not in KB as well).
    number(Lower),
    number(Upper),
    % between is non-inclusive:
    Lower < Upper,
    Val > Lower,
    Val < Upper.

% Prepositional phrase remains as in the original parser.
prepPhrase([Prep | Rest], What) :-
    preposition(Prep, What, Ref),
    np(Rest, Ref).

% --------------------------------------------------------------------
% Helpers for "oldest"
% --------------------------------------------------------------------

% movie_release_year(Movie, Year) : helper to read release year.
movie_release_year(Movie, Year) :-
    releaseInfo(Movie, Year, _).

/* is_oldest_for(+RestTokens, +Movie)
   Given the tokens after "oldest", and a candidate Movie that already
   satisfies np2_no_oldest(RestTokens, Movie), this predicate enforces
   that there is no OTHER movie matching the same description with an
   earlier release year.
*/
is_oldest_for(Rest, Movie) :-
    movie_release_year(Movie, Year),
    % Movie must satisfy the non-oldest pattern:
    np2_no_oldest(Rest, Movie),
    % There is no movie that also matches and is strictly older.
    not( exists_older(Rest, Year) ).

/* exists_older(+RestTokens, +Year)
   True if there exists some movie matching RestTokens released
   strictly before Year.
*/
exists_older(Rest, Year) :-
    np2_no_oldest(Rest, Other),
    movie_release_year(Other, OtherYear),
    OtherYear < Year.
