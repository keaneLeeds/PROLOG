person(englishman).
person(swede).
person(german).
person(norwegian).
person(dane).

color(red).
color(blue).
color(yellow).
color(white).
color(green).

beverage(tea).
beverage(coffee).
beverage(bier).
beverage(water).
beverage(milk).

tobacco(prince).
tobacco(pallmall).
tobacco(blend).
tobacco(dunhills).
tobacco(bluemasters).

pet(dogs).
pet(cats).
pet(horses).
pet(birds).
pet(fish).

address(first).
address(second).
address(third).
address(fourth).
address(fifth).

neighbor(first,second).
neighbor(second,first).
neighbor(second,third).
neighbor(third,second).
neighbor(third,fourth).
neighbor(fourth,third).
neighbor(fourth,fifth).
neighbor(fifth,fourth).

houseRight(first,second).
houseRight(second,third).
houseRight(third,fourth).
houseRight(fourth,fifth).

own(norwegian,first).
own(englishman,X) :- houseColor(X,red).
own(X,third) :- drinks(X,milk).
%own(X,Y) :- person(X), address(Y).

smoke(german,prince).
smoke(X,pallmall) :- keep(X,birds).
%smoke(X,Y) :- person(X), tobacco(Y).

drink(dane,tea).
drink(X,bier) :- smoke(X,bluemasters).
drink(X,coffee) :- own(X,Y), houseColor(Y,green).
drink(X,water) :- neighbor(X,Y), own(Z,Y), smoke(Z,blend).
%drink(X,Y) :- person(X), beverage(Y).

% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %

neighbors(norwegian,Y) :- houseColor(Y,blue).
neighbors(X,Y) :- smoke(X,blend), keep(Y,cats).
neighbors(X,Y) :- smoke(X,dunhills), keep(Y,horses).

houseColor(X,green) :- houseRight(X,Y), houseColor(Y,white). 
houseColor(X,yellow) :- own(Y,X), smoke(Y,dunhills).
houseColor(X,Y) :- address(X), color(Y), own(Z,X), person(Z).

keep(swede, dog).
%keep(X,Y) :- person(X), pet(Y).







%drink,smoke,keep,color,neighbor,address


