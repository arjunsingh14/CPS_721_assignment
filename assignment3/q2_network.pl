% Enter the names of ID of your group members below.
% For STUDENT ID, use your 9-digit ONECARD number.
% If you have 2 group members, leave the last entry blank.
%
%%%%%
%%%%% NAME: Golsa Momeni
%%%%% STUDENT ID: 501202209
%%%%%
%%%%% NAME: Bardia Shirsalimian
%%%%% STUDENT ID: 501280070
%%%%%
%%%%% NAME:
%%%%% STUDENT ID:
%
% Add the required statements in the q4a_rules section below.
% Any helper predicates should also be added to that section.
% Do NOT delete, edit, or add SECTION headers.
% If you put statements in the wrong section, you will lose marks.
%
% You may add additional comments as you choose but DO NOT MODIFY 
% the already included comment lines below
%

%%%%% SECTION: q2_link_kb
%%%%% DO NOT EDIT.
link(6,5). link(5,6).
link(5,3). link(3,5).
link(3,4). link(4,3).
link(2,3). link(3,2).
link(2,1). link(1,2).
link(1,out). link(out,1).

%%%%% SECTION: q2_connected
%%%%% Put your definition of connected(Origin, Destination, Path) below

connected(Origin, Destination, Path) :-
    path(Origin, Destination, [Origin], RevPath),
    reverse(RevPath, Path).

% Base case: current node is the destination
path(Destination, Destination, Visited, Visited).

% Recursive case: traverse links
path(Current, Destination, Visited, Path) :-
    link(Current, Next),
    not(member(Next, Visited)),
    path(Next, Destination, [Next|Visited], Path).

%%%%% SECTION: q2_network_solution
%%%%% Put the different components of your network puzzle solution below

%%% Domains for variables
addresses([bananas, firstbank, netvue, pricenet, sysworld, univmoose]).
admins([catarina, lizzie, mona, anthony, daniel, jaime]).
lastnames([elby, kim, osborne, tsuji, wolverton, zickerman]).

%%% Helper predicates

% Use pick/3 instead of select/3 to avoid redefining built-in
pick(X, [X|T], T).
pick(X, [H|T], [H|R]) :- pick(X, T, R).

% Permutation helper using pick
permutation([], []).
permutation(L, [H|T]) :-
    pick(H, L, Rest),
    permutation(Rest, T).

% Fail if Node has a link to an "illegal" node
has_bad_link(Node, KeepList) :-
    link(Node, Other),
    not(member(Other, KeepList)).

% Helper for constraint 2
constraint2_helper(Solution, NM, NW) :- 
    member(system(NM, netvue, mona, _), Solution).
constraint2_helper(Solution, NM, NW) :- 
    member(system(NW, netvue, _, wolverton), Solution).

%%% Main solver
% Meaning of variables:
% system(Number, Address, Admin, LastName)
% Solution is a list of 6 system facts

solve(Solution) :-
    Solution = [
        system(1,A1,U1,L1), system(2,A2,U2,L2),
        system(3,A3,U3,L3), system(4,A4,U4,L4),
        system(5,A5,U5,L5), system(6,A6,U6,L6)
    ],

    % Generate addresses
    addresses(AddrList),
    permutation(AddrList, [A1,A2,A3,A4,A5,A6]),

    % Pre-find nodes by address
    member(system(NP,pricenet,_,_),Solution),
    member(system(NU,univmoose,_,_),Solution),
    member(system(NF,firstbank,_,_),Solution),
    member(system(NS,sysworld,_,_),Solution),
    member(system(NV,netvue,_,_),Solution),

    % Generate admins
    admins(AdminList),
    permutation(AdminList, [U1,U2,U3,U4,U5,U6]),

    % (6) bananas.com has a woman admin
    member(system(_, bananas, WAdmin, _), Solution),
    member(WAdmin, [catarina,lizzie,mona]),

    % Pre-find nodes by admin
    member(system(NL,_,lizzie,_),Solution),
    member(system(NA,_,anthony,_),Solution),
    member(system(NJ,_,jaime,_),Solution),
    member(system(ND,_,daniel,_),Solution),
    member(system(NC,_,catarina,_),Solution),
    member(system(NM,_,mona,_),Solution),

    % (4) Daniel only connects directly with sysworld
    link(ND,NS),
    not(has_bad_link(ND, [NS])),

    % Generate last names
    lastnames(LastList),
    permutation(LastList, [L1,L2,L3,L4,L5,L6]),

    % Find nodes by last name
    member(system(NO,_,_,osborne),Solution),
    member(system(NE,_,_,elby),Solution),
    member(system(NT,_,_,tsuji),Solution),
    member(system(NK,_,_,kim),Solution),
    member(system(NZ,_,_,zickerman),Solution),
    member(system(NW,_,_,wolverton),Solution),

    % (1) Lizzie & Osborne pass through pricenet
    connected(NL, NO, PathLO),
    member(NP, PathLO),

    % (2) Mona & Wolverton directly connected, one has netvue
    link(NM,NW),
    constraint2_helper(Solution, NM, NW),

    % (3) Anthony & Jaime pass through Elby
    connected(NA,NJ,PathAJ),
    member(NE, PathAJ),

    % (5) Jaime & Ms. Tsuji pass through univmoose
    connected(NJ,NT,PathJT),
    member(NU, PathJT),

    % (7) Kim & world via firstbank
    connected(NK,out,PathKW),
    member(NF, PathKW),

    % (8) Zickerman connects only to Catarina & netvue
    link(NZ,NC),
    link(NZ,NV),
    not(has_bad_link(NZ,[NC,NV])).

%%% Print solution
printSolution(Solution) :-
    nl, write('--- Mooseville Network Solution ---'), nl, nl,
    print_systems(Solution).

print_systems([]).
print_systems([system(N,A,U,L)|T]) :-
    write('System '), write(N), write(': '),
    write(A),
    write(', Admin: '), write(U), write(' '), write(L), nl,
    print_systems(T).

%%%%% SECTION: q2_solve_and_print
%%%%% DO NOT EDIT.
solveAndPrint :-
    Start is cputime,
    solve(L),
    End is cputime,
    Time is End-Start,
    write("The problem was solved in "), write(Time), write(" seconds"), nl, nl,
    printSolution(L).
%%%%% END
% DO NOT PUT ANY ATOMIC PROPOSITIONS OR LINES BELOW
