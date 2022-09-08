nationality(englishman).
nationality(dane).
nationality(norwegian).
nationality(german).
nationality(swede).

paint(white).
paint(green).
paint(blue).
paint(yellow).
paint(red).

beverage(water).
beverage(milk).
beverage(tea).
beverage(coffee).
beverage(bier).

tobacco(prince).
tobacco(bluemasters).
tobacco(dunhills).
tobacco(pallmall).
tobacco(blend).

pet(cats).
pet(dogs).
pet(horses).
pet(birds).
pet(fish).

house([X,Y,Z,A,B]) :- nationality(X), paint(Y), beverage(Z), tobacco(A), pet(B).

different_people(X,Y) :- nationality(X), nationality(Y), X \== Y.

different_color(X,Y) :- paint(X), paint(Y), X \== Y.

different_beverage(X,Y) :- beverage(X), beverage(Y), X \== Y.

different_tobacco(X,Y) :- tobacco(X), tobacco(Y), X \== Y.

different_pet(X,Y) :- pet(X), pet(Y), X \== Y.

different_houses([A,B,C,D,E],[V,W,X,Y,Z]) :- different_people(A,V), different_color(B,W), different_beverage(C,X), different_tobacco(D,Y), different_pet(E,Z).

 






