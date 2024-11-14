Object subclass: #Wielokat
	instanceVariableNames: 'wierzcholki nazwa '
	classVariableNames: ''
	poolDictionaries: ''
	category: 'JezykiProgramowania'!

!Wielokat methodsFor: 'initialize-release'!

initialize: liczbaWierzcholkow name: nowaNazwa
	"konstruktor obiektu - wielokata"

	nazwa:=nowaNazwa.
	wierzcholki:=Array new: liczbaWierzcholkow.
	wierzcholki at: 1 put: 0@0.! !

!Wielokat methodsFor: 'accessing'!
drukuj
	"podaje wierzcholki i pole wielokata"
	"TODO wyswietlanie wysrodkuj"
	Transcript show: 'Polygon name: ', nazwa printString; cr.
	Transcript show: 'Area of the polygon: ', (self pole) printString; cr.
	1 to: wierzcholki size do: [:i |
        Transcript show: 'Wierzcholek nr ', i printString, ': ', (wierzcholki at: i) printString; cr.
    ].!

nazwa
	"podaje nazwe wielokata"

	^nazwa!

nazwa: nowa_nazwa
	"ustawia nowa nazwe wielokata"

	nazwa:=nowa_nazwa! !



Wielokat subclass: #Kwadrat
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'JezykiProgramowania'!


!Kwadrat methodsFor: 'arithmetic'!

+ figura
	"dodaj 2 figury w sensie pola"

	| p |

	p:=self pole + figura pole.
	^(Kwadrat new) initialize: p sqrt! !

!Kwadrat methodsFor: 'actions'!

pole
	"licz pole kwadratu"

	^(wierzcholki at: 2) x squared! !

!Kwadrat methodsFor: 'initialize-release'!

initialize: bok
	"tworz kwadrat o podanym boku"

	super initialize: 4 name: 'Kwadrat'.
	wierzcholki at: 2 put: bok@0.
	wierzcholki at: 3 put: bok@bok.
	wierzcholki at: 4 put: 0@bok.! !



Wielokat subclass: #Romb
    instanceVariableNames: 'bok kat'
    classVariableNames: ''
    poolDictionaries: ''
    category: 'JezykiProgramowania'!

!Romb methodsFor: 'arithmetic'!

+ figura
    "dodaj 2 figury w sensie pola"

    | p |
    p := self pole + figura pole.
    ^(Romb new) initialize: (p / (kat sin)) sqrt kat: kat! !

!Romb methodsFor: 'actions'!

pole
    "licz pole rombu"

    ^((wierzcholki at: 2) x squared) * (kat sin)! !

!Romb methodsFor: 'initialize-release'!

initialize: bok kat: nowyKat
    "tworz romb o podanym boku i kacie"

    super initialize: 4 name: 'Romb'.

	kat := nowyKat.

    wierzcholki at: 2 put: bok@0.
    wierzcholki at: 3 put: (bok + (bok * kat cos))@(bok * kat sin).
    wierzcholki at: 4 put: (bok * kat cos)@(bok * kat sin).! !

"Testing the program"

"Point 1"

| romb area sideLength angleInRadians romb2 |

"Set the side length and angle (in radians)"
sideLength := 2.
angleInRadians := (30 degreesToRadians).  "Convert 45 degrees to radians"

"Create a new Romb instance with the specified side length and angle"
romb := Romb new initialize: sideLength kat:angleInRadians.

romb2 := Romb new initialize: sideLength kat:angleInRadians.

"Calculate the area of the rhombus"
area := romb pole.
area2 := romb2 pole.
romb3 := romb + romb2.
area3 := romb3 pole.
area12 := area + area2.
"Print the area"
Transcript show: 'Area of the rhombus: ', area printString; cr.
Transcript show: 'Area of the rhombus: ', area2 printString; cr.
Transcript show: 'Area of the two(12) rhombus: ', area12 printString; cr.
Transcript show: 'Area of the third rhombus: ', area3 printString; cr.

"Point 2"

| square |
square := Kwadrat new initialize: 4.
square drukuj.

| romb3 |
romb3 := Romb new initialize: sideLength kat:angleInRadians.
romb3 drukuj.