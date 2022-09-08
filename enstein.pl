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

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

houseColor(X,Y) :- person(X), color(Y).
houseColor(englishman,red).


