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
% Add the required statements in the q2_rules section below.
% Any helper predicates should also be added to that section.
% Do NOT delete, edit, or add SECTION headers.
% If you put statements in the wrong section, you will lose marks.
%
% You may add additional comments as you choose but DO NOT MODIFY 
% the already included comment lines below
%

%%%%% SECTION: q2_kb_import
% The following line will import your grocery KB. You can feel free to
% edit this line if you want to import and test on different KBs.
% We will ignore this section when testing your code, and instead test
% on our own KBs.
:- [q2_grocery_kb].


%%%%% SECTION: q2_rules
%%%%% You should put your rules in this section, including helper predicates.

% Rule 1: Get cost after tax for one item
costPerUnitAfterTax(Product, AfterTax) :-
    cost(Product, BaseCost),
    taxable(Product),
    taxRate(Rate),
    AfterTax is BaseCost * (1 + Rate).

costPerUnitAfterTax(Product, AfterTax) :-
    cost(Product, AfterTax),
    not(taxable(Product)).

% Rule 2: Get total cost for all units of an item (with sales and tax)
costPerUnitAfterTaxAndSale(Item, TotalCost) :-
    numPurchased(Item, Count),
    costPerUnitAfterTax(Item, UnitCost),
    twoForOneSale(Item),
    UnitsToPay is (Count + 1) // 2,
    TotalCost is UnitCost * UnitsToPay.

costPerUnitAfterTaxAndSale(Item, TotalCost) :-
    numPurchased(Item, Count),
    costPerUnitAfterTax(Item, UnitCost),
    not(twoForOneSale(Item)),
    TotalCost is UnitCost * Count.

% Rule 3: Get total cost for everything
totalCost(Cost) :-
    costPerUnitAfterTaxAndSale(milk, MilkCost),
    costPerUnitAfterTaxAndSale(tomato, TomatoCost),
    costPerUnitAfterTaxAndSale(orange, OrangeCost),
    costPerUnitAfterTaxAndSale(marshmallow, MarshmallowCost),
    costPerUnitAfterTaxAndSale(ice_cream, IceCreamCost),
    Cost is MilkCost + TomatoCost + OrangeCost + MarshmallowCost + IceCreamCost.


%%%%% END
% DO NOT PUT ANY ATOMIC PROPOSITIONS OR LINES BELOW
