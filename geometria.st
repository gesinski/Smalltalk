    Object subclass: #Wielokat
        instanceVariableNames: 'wierzcholki nazwa'
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
        Transcript show: 'Nazwa wielokata: ', nazwa printString; cr.
        Transcript show: 'Pole wielokata: ', (self pole) printString; cr.
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
        instanceVariableNames: 'okragOpisany'
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

        | x y z |
        x := ((wierzcholki at: 2) x) asFloat.
        y := ((wierzcholki at: 1) x) asFloat.
        z := (x - y) abs.
        ^ z squared.
    !
    
    bok 
        "licz bok"
        | x y z |
        x := ((wierzcholki at: 2) x) asFloat.
        y := ((wierzcholki at: 1) x) asFloat.
        z := (x - y) abs.
        ^z
        
    !
    wysrodkuj
        "przenosi figure do srodka ukladu wspolrzednych"
        | polBoku x |
        x := ((wierzcholki at: 2) x) asFloat.
        polBoku := (x / 2.0) asFloat.

        wierzcholki at: 1 put: (polBoku @ (polBoku)*(-1)).
        wierzcholki at: 2 put: ((polBoku)*(-1) @ (polBoku)*(-1)).
        wierzcholki at: 3 put: (polBoku @ polBoku).
        wierzcholki at: 4 put: ((polBoku)*(-1) @ polBoku).

        self opiszOkrag.
    !

    opiszOkrag
        "Opisuje Okrag"
        | srodekOkrag okrag |
        
        srodekOkrag := ((wierzcholki at: 1) + (wierzcholki at: 3)) / 2.
        okragOpisany := Okrag new initialize: ((self bok / 2.0) asFloat) srodek: srodekOkrag.
    !
    okragOpisany
    "zwraca obiekt okregu opisanego"

    ^okragOpisany
    ! !


    !Kwadrat methodsFor: 'initialize-release'!

    initialize: bok
        "tworz kwadrat o podanym boku"

        super initialize: 4 name: 'Kwadrat'.
        wierzcholki at: 2 put: bok@0.
        wierzcholki at: 3 put: bok@bok.
        wierzcholki at: 4 put: 0@bok.
        okragOpisany := nil.
    ! !



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
        | x y z |
        x := (wierzcholki at: 2) x.
        y := (wierzcholki at: 1) x.
        z := ((x - y) abs) asFloat.
        ^(z squared) * (kat sin).! 

    wysrodkuj
        | srodekX srodekY przesuniecieX przesuniecieY |
        
        srodekX := (((wierzcholki at: 1) x) asFloat + ((wierzcholki at: 2) x) asFloat + ((wierzcholki at: 3) x) asFloat + ((wierzcholki at: 4) x) asFloat) / 4.
        srodekY := (((wierzcholki at: 1) y) asFloat + ((wierzcholki at: 2) y) asFloat + ((wierzcholki at: 3) y) asFloat + ((wierzcholki at: 4) y) asFloat) / 4.

        wierzcholki at: 1 put: (((wierzcholki at: 1) x - srodekX) @ ((wierzcholki at: 1) y - srodekY)).
        wierzcholki at: 2 put: (((wierzcholki at: 2) x - srodekX) @ ((wierzcholki at: 2) y - srodekY)).
        wierzcholki at: 3 put: (((wierzcholki at: 3) x - srodekX) @ ((wierzcholki at: 3) y - srodekY)).
        wierzcholki at: 4 put: (((wierzcholki at: 4) x - srodekX) @ ((wierzcholki at: 4) y - srodekY)).
    ! !

    !Romb methodsFor: 'initialize-release'!

    initialize: bok kat: nowyKat
        "tworz romb o podanym boku i kacie"

        super initialize: 4 name: 'Romb'.

        kat := nowyKat.

        wierzcholki at: 2 put: bok@0.
        wierzcholki at: 3 put: (bok + (bok * kat cos))@(bok * kat sin).
        wierzcholki at: 4 put: (bok * kat cos)@(bok * kat sin).! !



    Object subclass: #Okrag
        instanceVariableNames: 'promien srodek '
        classVariableNames: ''
        poolDictionaries: ''
        category: 'JezykiProgramowania'!

    !Okrag methodsFor: 'initialize-release'!

    initialize: nowyPromien srodek: nowySrodek
        "konstruktor obiektu - Okrag"
        promien := nowyPromien.
        srodek := nowySrodek.! !

    !Okrag methodsFor: 'accessing'!

    drukuj
        "podaje promien i srodek kola"
        "TODO wyswietlanie wysrodkuj"
        Transcript show: 'Promien okregu: ', promien printString; cr.
        Transcript show: 'Srodek okregu: ', srodek printString; cr.!

    promien
        "podaje promien Okregu"
        ^promien!

    srodek
        "podaje srodek Okregu"
        ^srodek! !



    "Testowanie programu"

    "Punkt 1"
    Transcript show: 'Punkt 1'; cr.

    | romb area sideLength angleInRadians romb2 angle2|

    sideLength := 2.
    angleInRadians := (60 degreesToRadians).  "Convert 45 degrees to radians"
    angle2 := (90 degreesToRadians).
    romb := Romb new initialize: sideLength kat:angleInRadians.

    romb2 := Romb new initialize: sideLength kat:angleInRadians.

    area := romb pole.
    area2 := romb2 pole.
    romb3 := romb + romb2.
    area3 := romb3 pole.
    area12 := area + area2.

    Transcript show: 'Pole rombu1: ', area printString; cr.
    Transcript show: 'Pole rombu2: ', area2 printString; cr.
    Transcript show: 'Pole sumy rombow 1 i 2: ', area12 printString; cr.
    Transcript show: 'Pole rombu3: ', area3 printString; cr.

    "Punkt 2"
    Transcript show: 'Punkt 2'; cr.

    | kwadrat1 |
    kwadrat1 := Kwadrat new initialize: 4.
    kwadrat1 drukuj.
    kwadrat1 wysrodkuj.
    kwadrat1 drukuj.

    | romb4 |
    romb4 := Romb new initialize: 1 kat: angleInRadians. 
    romb4 wysrodkuj.
    romb4 drukuj.

    "Punkt 3"
    Transcript show: 'Punkt 3'; cr.

    | square |
    square := Kwadrat new initialize: 4.
    square drukuj.

    | romb3 |
    romb3 := Romb new initialize: sideLength kat:angleInRadians.
    romb3 drukuj.

    "Punkt 4"
    Transcript show: 'Punkt 4'; cr.

    | circle radius center |
    radius := 2.
    center := 3@3.

    circle := Okrag new initialize: radius srodek: center.
    circle drukuj.

    "Punkt 5"
    Transcript show: 'Punkt 5'; cr.
    kwadrat1 := Kwadrat new initialize: 4.

    Transcript show: 'Okrag Opisany na kwadracie: '; cr.
    kwadrat1 drukuj.
    kwadrat1 opiszOkrag.
    (kwadrat1 okragOpisany) drukuj.
    
    Transcript show: 'Okrag Opisany na kwadracie po wyśrodkowaniu: '; cr.
    kwadrat1 drukuj.
    kwadrat1 wysrodkuj.
    (kwadrat1 okragOpisany) drukuj.
