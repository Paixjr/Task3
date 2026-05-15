
% FAMILY TREE KNOWLEDGE BASE -- SWI-Prolog (RECTIFIED)
% The Mercer Family
:- discontiguous male/1.
:- discontiguous female/1.
:- discontiguous parent/2.

% GENDER FACTS

% Generation 1 - Grandparents
male(arthur).
female(dorothy).
male(robert).
female(patricia).

% Generation 2 - Parents / Uncles / Aunts
male(henry).
female(diana).
male(thomas).
male(edward).
female(susan).

% Generation 3 - Children / Grandchildren
male(james).
female(olivia).
female(sophie).
male(lucas).
female(emma).
male(noah).
female(mia).

% PARENT FACTS
% parent(Parent, Child)

% arthur & dorothy -> henry, diana
parent(arthur, henry).
parent(dorothy, henry).
parent(arthur, diana).
parent(dorothy, diana).

% robert & patricia -> edward, susan
parent(robert, edward).
parent(patricia, edward).
parent(robert, susan).
parent(patricia, susan).

% henry -> james, olivia
parent(henry, james).
parent(henry, olivia).

% diana + thomas -> sophie
parent(diana, sophie).
parent(thomas, sophie).

% edward & susan -> children
parent(edward, lucas).
parent(susan, lucas).
parent(edward, emma).
parent(susan, emma).
parent(edward, noah).
parent(susan, noah).
parent(edward, mia).
parent(susan, mia).

% BASIC RELATIONS

father(F, C) :-
    parent(F, C),
    male(F).

mother(M, C) :-
    parent(M, C),
    female(M).
% SIBLING (fixed to avoid duplicates)

sibling(X, Y) :-
    parent(P, X),
    parent(P, Y),
    X \= Y.

brother(X, Y) :-
    sibling(X, Y),
    male(X).

sister(X, Y) :-
    sibling(X, Y),
    female(X).
% GRAND RELATIONS
grandparent(GP, GC) :-
    parent(GP, P),
    parent(P, GC).

grandfather(GF, GC) :-
    grandparent(GF, GC),
    male(GF).

grandmother(GM, GC) :-
    grandparent(GM, GC),
    female(GM).

grandchild(GC, GP) :-
    grandparent(GP, GC).

% UNCLE / AUNT (FIXED PROPERLY)
uncle(U, N) :-
    parent(P, N),
    sibling(U, P),
    male(U).

aunt(A, N) :-
    parent(P, N),
    sibling(A, P),
    female(A).

% COUSINS
cousin(X, Y) :-
    parent(PX, X),
    parent(PY, Y),
    sibling(PX, PY),
    X \= Y.

% ANCESTOR (RECURSIVE)
ancestor(A, D) :-
    parent(A, D).

ancestor(A, D) :-
    parent(A, X),
    ancestor(X, D).
% DESCENDANT
descendant(D, A) :-
    ancestor(A, D).