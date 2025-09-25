Program TwoFerTests;

Uses TAP, TAPCore, TwoFer;

Type
    TTest =   Record
        description :   string;
        name        :   string;
        expected    :   string;
    End;

Const
    TTests:   array Of TTest =   (
(description:'no name given'; name:''; expected:'One for you, one for me.'),
(description:'a name given'; name:'Alice'; expected:'One for Alice, one for me.'),
(description:'another name given'; name:'Bob'; expected:'One for Bob, one for me.')
                                 );

Var
    i :   integer;

Begin
    Plan(length(TTests));
    For i := low(TTests) To high(TTests) Do
        Begin
            TestIs(RunExercise(TTests[i].name),TTests[i].expected,
            TTests[i].description
            )
        End;
    DoneTesting;
End.
