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
own(X,Y) :- person(X), address(Y).


houseColor(X,Y) :- address(X), color(Y).
