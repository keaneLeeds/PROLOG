%house(Nationality,Color,Drink,Smoke,Keep)

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

houses([
    house(nationality(X),color(X,_ColorX),drink(X,_DrinkX),smoke(X,_SmokeX),keep(X,_PetX)),
    house(nationality(Y),color(X,_ColorY),drink(Y,_DrinkY),smoke(Y,_SmokeY),keep(Y,_PetY)),
    house(nationality(Z),color(Z,_ColorZ),drink(Z,_DrinkZ),smoke(Z,_SmokeZ),keep(Z,_PetZ)),
    house(nationality(A),color(A,_ColorA),drink(A,_DrinkA),smoke(A,_SmokeA),keep(A,_PetA)),
    house(nationality(B),color(B,_ColorB),drink(B,_DrinkB),smoke(B,_SmokeB),keep(B,_PetB))]).
houses([
    house(norwegian,color(norwegian,_Color),drink(norwegian,_Drink),smoke(norwegian,_Smoke),keep(norwegian,_Pet)),
    house(nationality(Y),color(Y,_ColorY),drink(Y,_DrinkY),smoke(Y,_SmokeY),keep(Y,_PetY)),
    house(nationality(Z),color(Z,_ColorZ),drink(Z,_DrinkZ),smoke(Z,_SmokeZ),keep(Z,_PetZ)),
    house(nationality(A),color(A,_ColorA),drink(A,_DrinkA),smoke(A,_SmokeA),keep(A,_PetA)),
    house(nationality(B),color(B,_ColorB),drink(B,_DrinkB),smoke(B,_SmokeB),keep(B,_PetB))]).
houses([
    house(nationality(X),color(X,_ColorX),drink(X,_DrinkX),smoke(X,_SmokeX),keep(X,_PetX)),
    house(nationality(Y),color(X,_ColorY),drink(Y,_DrinkY),smoke(Y,_SmokeY),keep(Y,_PetY)),
    house(nationality(Z),color(Z,_ColorZ),milk,smoke(Z,_SmokeZ),keep(Z,_PetZ)),
    house(nationality(A),color(A,_ColorA),drink(A,_DrinkA),smoke(A,_SmokeA),keep(A,_PetA)),
    house(nationality(B),color(B,_ColorB),drink(B,_DrinkB),smoke(B,_SmokeB),keep(B,_PetB))]).
houses([
    _Head|[
    house(nationality(X),green,drink(X,_DrinkX),smoke(X,_SmokeX),keep(X,_PetX)),
    house(nationality(Y),white,drink(Y,_DrinkY),smoke(Y,_SmokeY),keep(Y,_PetY))|
    _Tail]]).
houses([
    _Head|[
    house(nationality(X),green,drink(X,_DrinkX),smoke(X,_SmokeX),keep(X,_PetX)),
    house(nationality(Y),white,drink(Y,_DrinkY),smoke(Y,_SmokeY),keep(Y,_PetY))]]).

house(englishman,red,drink(englishman,_Drink),smoke(englishman,_Smoke),keep(englishman,_Pet)).
house(swede,color(swede,_Color),drink(swede,_Drink),smoke(swede,_Smoke),dogs).
house(dane,color(dane,_Color),tea,smoke(dane,_Smoke),keep(dane,_Pet)).
house(nationality(X),green,coffee,smoke(X,_Smoke),keep(X,_Pet)).
house(nationality(X),yellow,drink(X,_Drink),dunhills,keep(X,_Pet)).
house(nationality(X),color(X,_Color),drink(X,_Drink),pallmall,birds).
house(german,color(german,_Color),drink(german,_Drink),prince,keep(german,_Pet)).
house(nationality(X),color(X,_Color),bier,bluemasters,keep(X,_Pet)).

neighbor(
    house(nationality(X),color(X,_ColorX),drink(X,_DrinkX),blend,keep(X,_PetX)),
    house(nationality(Y),color(Y,_ColorY),drink(Y,_DrinkY),smoke(Y,_SmokeY),cats)).
neighbor(
    house(nationality(X),color(X,_ColorX),drink(X,_DrinkX),smoke(X,_SmokeX),horses),
    house(nationality(Y),color(Y,_ColorY),drink(Y,_DrinkY),dunhill,keep(Y,_PetY))).
neighbor(
    house(norwegian,color(norwegian,_Color),drink(norwegian,_Drink),smoke(norwegian,_Smoke),keep(norwegian,_Pet)),
    house(nationality(Y),blue,drink(Y,_DrinkY),smoke(Y,_SmokeY),keep(Y,_PetY))).
neighbor(
    house(nationality(X),color(X,_ColorX),drink(X,_DrinkX),blend,keep(X,_PetX)),
    house(nationality(Y),color(Y,_ColorY),water,smoke(Y,_ColorY),keep(Y,_PetY))).
neighbor(X,Y) :- houses([X,Y|_Tail]).
neighbor(X,Y) :- houses([Y,X|_Tail]). 
neighbor(X,Y) :- houses([_Head|[X,Y|_Tail]]). 
neighbor(X,Y) :- houses([_Head|[Y,X|_Tail]]).
neighbor(X,Y) :- houses([_Head|[X,Y]]).
neighbor(X,Y) :- houses([_Head|[Y,X]]).

color(X,Y) :- nationality(X), paint(Y), houses([house(X,Y,drink(X,_Drink),smoke(X,_Smoke),keep(X,_Pet))|_Tail]).
color(X,Y) :- nationality(X), paint(Y), houses([_Head |[house(X,Y,drink(X,_Drink),smoke(X,_Smoke),keep(X,_Pet))|_Tail]]).
color(X,Y) :- nationality(X), paint(Y), houses([_Head|house(X,Y,drink(X,_Drink),smoke(X,_Smoke),keep(X,_Pet))]).

drink(X,Y) :- nationality(X), beverage(Y), houses([house(X,color(X,_Color),Y,smoke(X,_Smoke),keep(X,_Pet))|_Tail]).
drink(X,Y) :- nationality(X), beverage(Y), houses([_Head|[house(X,color(X,_Color),Y,smoke(X,_Smoke),keep(X,_Pet))|_Tail]]).
drink(X,Y) :- nationality(X), beverage(Y), houses([_Head|house(X,color(X,_Color),Y,smoke(X,_Smoke),keep(X,_Pet))]).

smoke(X,Y) :- nationality(X), tobacco(Y), houses([house(X,color(X,_Color),drink(X,_Drink),Y,keep(X,_Pet))|_Tail]).
smoke(X,Y) :- nationality(X), tobacco(Y), houses([_Head|[house(X,color(X,_Color),drink(X,_Drink),Y,keep(X,_Pet))|_Tail]]).
smoke(X,Y) :- nationality(X), tobacco(Y), houses([_Head|house(X,color(X,_Color),drink(X,_Drink),Y,keep(X,_Pet))]).

keep(X,Y) :- nationality(X), pet(Y), houses([house(X,color(X,_Color),drink(X,_Drink),smoke(X,_Smoke),Y)|_Tail]).
keep(X,Y) :- nationality(X), pet(Y), houses([_Head|[house(X,color(X,_Color),drink(X,_Drink),smoke(X,_Smoke),Y)|_Tail]]).
keep(X,Y) :- nationality(X), pet(Y), houses([_Head|house(X,color(X,_Color),drink(X,_Drink),smoke(X,_Smoke),Y)]).



