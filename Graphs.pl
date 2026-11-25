edge('Makkah', 'Madinah').
edge('Madinah', 'Makkah').

edge('Madinah', 'Taif').
edge('Madinah', 'Tabuk').

edge('Taif', 'Tabuk').
edge('Tabuk', 'Taif').

edge('Makkah', 'Riyadh').

edge('Taif', 'Dammam').

edge('Al-Qatif', 'Madinah').

edge('Al-Qatif', 'Dammam').
edge('Dammam', 'Al-Qatif').

edge('Dammam', 'Riyadh').
edge('Riyadh', 'Dammam').


connected(X, Y) :-
    edge(X, Y).


travel(From, To, Path) :-
    path(From, To, [From], ReversePath),
    reverse(ReversePath, Path).


path(From, To, Visited, [To|Visited]) :-
    connected(From, To).


path(From, To, Visited, Path) :-
    connected(From, Next),
    \+ member(Next, Visited),
    path(Next, To, [Next|Visited], Path).