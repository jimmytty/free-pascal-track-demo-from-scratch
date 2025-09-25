Program DifferenceOfSquaresTests;

Uses TAP, TAPCore, DifferenceOfSquares;

Type
    TTest =   Record
        description :   string;
        myproperty  :   string;
        number      :   longint;
        expected    :   longint;
    End;

Const
    TTests:   array Of TTest =   (
(description:'square of sum 1'; myproperty: 'squareOfSum'; number:1; expected:1),
(description:'square of sum 5'; myproperty: 'squareOfSum'; number:5; expected:225),
(description:'square of sum 100'; myproperty: 'squareOfSum'; number:100; expected:25502500),
(description:'sum of squares 1'; myproperty: 'sumOfSquares'; number:1; expected:1),
(description:'sum of squares 5'; myproperty: 'sumOfSquares'; number:5; expected:55),
(description:'sum of squares 100'; myproperty: 'sumOfSquares'; number:100; expected:338350),
(description:'difference of squares 1'; myproperty:'differenceOfSquares'; number:1; expected:0),
(description:'difference of squares 5'; myproperty:'differenceOfSquares'; number:5; expected:170),
(description:'difference of squares 100'; myproperty:'differenceOfSquares'; number:100; expected:25164150)
                                 );

Var
    i :   integer;

Begin
    Plan(length(TTests));
    For i := low(TTests) To high(TTests) Do
        Begin
            TestIs(RunExercise(TTests[i].myproperty, TTests[i].number),TTests[i]
            .expected,TTests[i].description)
        End;
    DoneTesting;
End.
