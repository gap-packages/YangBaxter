NCBRACES := [];

NCBRACES[1] := rec( total := -1, implemented := 1, size := 1, brace := [] );
NCBRACES[1].brace[1] := rec ( size := 1, perms := [ [  (),  (),  ], ]
);


