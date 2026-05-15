%  ============================================================
%  Task 3(b) – Basic Prolog: Simple Family Tree
%  Load with: swipl basic_family.pl
%  ============================================================

%  ── Facts: parent(Parent, Child) ─────────────────────────
parent(tom,   bob).
parent(tom,   liz).
parent(bob,   ann).
parent(bob,   pat).

%  ── Facts: male / female ──────────────────────────────────
male(tom).   male(bob).   male(pat).
female(liz). female(ann).

%  ── Rules ─────────────────────────────────────────────────
grandparent(X, Z) :- parent(X, Y), parent(Y, Z).

father(X, Y)  :- parent(X, Y), male(X).
mother(X, Y)  :- parent(X, Y), female(X).

sibling(X, Y) :- parent(P, X), parent(P, Y), X \= Y.

%  ── Sample Queries (run in SWI-Prolog REPL) ───────────────
%  ?- grandparent(tom, ann).       % true
%  ?- grandparent(tom, Z).         % Z = ann ; Z = pat
%  ?- sibling(ann, pat).           % true
%  ?- father(X, bob).              % X = tom
