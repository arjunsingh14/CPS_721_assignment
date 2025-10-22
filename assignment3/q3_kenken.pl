% Enter the names of ID of your group members below.
% For STUDENT ID, use your 9-digit ONECARD number.
% If you have 2 group members, leave the last entry blank.
%
%%%%%
%%%%% NAME: Bardia Shirsalimian
%%%%% STUDENT ID:501280070
%%%%%
%%%%% NAME:Golsa Momeni
%%%%% STUDENT ID: 501202209
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

%%%%% SECTION: q3_kenken_solution
%%%%% Put the different components of your KenKen solution below

%%% Put the domains for your variables below

digit(1).
digit(2).
digit(3).
digit(4).

%%% Define any helper predicates here

allDiff([]).
allDiff([H|T]) :- not(member(H,T)) , allDiff(T).

checkDiv(X,Y,Res) :-
    X >= Y,
    Res is X // Y.

checkDiv(X,Y,Res) :-
    X < Y,
    Res is Y // X.

checkSub(X,Y,Res) :-
    X >= Y,
    Res is X - Y.

checkSub(X,Y,Res) :-
    X < Y,
    Res is Y - X.

%%% Define solve below. Remember that solve should take in the list of
%%% variables to assign. MAKE SURE TO BRIEFLY EXPLAIN THE MEANING OF
%%% YOUR VARIABLES IN A COMMENT

% each grid is a variable 
% G11 , G12, G13, G14 
% G21 , G22, G23, G24 
% G31 , G32, G33, G34 
% G41 , G42, G43, G44 

solve([G11, G12, G13, G14, G21, G22, G23, G24, G31, G32, G33, G34, G41 , G42, G43, G44]) :-

    digit(G11),digit(G12),digit(G13),
    % checking that 12 and 13 div give 2
    checkDiv(G12,G13,2),
    digit(G14),
    % line 1 must be allDiff
    allDiff([G11,G12, G13, G14]),

    digit(G21),
    % top right sub must be 3
    checkSub(G11,G21,3),
    digit(G22), digit(G23),digit(G24),
    % line 2 must be allDiff
    allDiff([G21, G22, G23, G24]),

    % check top right box sum is 6
    6 is (G14 + G23 + G24),

    digit(G31),digit(G32),
    % mid box sum is 7
    7 is (G22 + G32),
    digit(G33),digit(G34),
    % line 3 must be allDiff
    allDiff([G31, G32, G33, G34]),

    digit(G41),
    % check col 1 to be allDiff
    allDiff([G11, G21, G31, G41]),
    % check bottem left div to be 1
    checkSub(G31,G41,1),
    digit(G42),digit(G43),
    % check col 2 and 3
    allDiff([G12, G22, G32, G42]),
    allDiff([G13, G23, G33, G43]),
    % check that 3 cells mult to 3
    3 is (G33*G42*G43),
    digit(G44),
    % right bottem div must be 2
    checkDiv(G34,G44,2),
    % line 4 must be allDiff
    allDiff([G41 , G42, G43, G44]),
    % col 4 allDiff
    allDiff([G14, G24, G34, G44]).


%%% Define printSolution below. This should take in the list of variables 
%%% after they have been assigned values, and outputs the solution in a
%%% human readable form.
%%% REMEMBER TO LOG YOUR FINAL OUTPUT AND RUNTIME IN assignment3_report.pdf

printSolution([G11, G12, G13, G14, G21, G22, G23, G24, G31, G32, G33, G34, G41 , G42, G43, G44]) :-
    write(' ---------------'),nl,
    write('| '),write(G11),write(' | '),write(G12),write(' | '),write(G13),write(' | '),write(G14),write(' |'),nl,
    write('| '),write(G21),write(' | '),write(G22),write(' | '),write(G23),write(' | '),write(G24),write(' |'),nl,
    write('| '),write(G31),write(' | '),write(G32),write(' | '),write(G33),write(' | '),write(G34),write(' |'),nl,
    write('| '),write(G41),write(' | '),write(G42),write(' | '),write(G43),write(' | '),write(G44),write(' |'),nl,
    write(' ---------------'),nl.

%%%%% SECTION: q3_solve_and_print
%%%%% The following calls the solve predicate, passes the variables to
%%%%% printSolution and outputs the time needed to solve the problem.
%%%%% This is the main way we will interact with your program.
%%%%% You can test it however you want though.
%%%%% DO NOT EDIT.

solveAndPrint :- Start is cputime, solve(L), End is cputime, Time is End-Start,
    write("The problem was solved in "), write(Time), write(" seconds"), nl, nl,
    printSolution(L).

%%%%% END
% DO NOT PUT ANY ATOMIC PROPOSITIONS OR LINES BELOW
