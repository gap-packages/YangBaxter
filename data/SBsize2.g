
NCBRACES := [];

NCBRACES[2] := rec( total := -1, implemented := 1, size := 2, brace := [] 
);NCBRACES[2].brace[1] := rec ( size := 2, perms := [ [  (),  (),  ], [  (1, 2),
(1, 2),  ], ]
);


NCBRACES[3] := rec( total := -1, implemented := 1, size := 3, brace := [] 
);NCBRACES[3].brace[1] := rec ( size := 3, perms := [ [  (),  (),  ], [  (1, 3, 
2),  (1, 2, 3),  ], [  (1, 2, 3),  (1, 3, 2),  ], ]
);


NCBRACES[4] := rec( total := -1, implemented := 4, size := 4, brace := [] 
);NCBRACES[4].brace[1] := rec ( size := 4, perms := [ [  (),  (),  ], [  (1, 3, 
2, 4),  (1, 3)(2, 4),  ], [  (1, 2)(3, 4),  (1, 2)(3, 4),  ], [  (1, 4, 2, 3),  
(1, 4)(2, 3),  ], ]
);

NCBRACES[4].brace[2] := rec ( size := 4, perms := [ [  (),  (),  ], [  (1, 4, 2,
3),  (1, 3, 2, 4),  ], [  (1, 2)(3, 4),  (1, 2)(3, 4),  ], [  (1, 3, 2, 4),  (1,
4, 2, 3),  ], ]
);

NCBRACES[4].brace[3] := rec ( size := 4, perms := [ [  (),  (),  ], [  (1, 3)(2,
4),  (1, 3)(2, 4),  ], [  (1, 2)(3, 4),  (1, 2)(3, 4),  ], [  (1, 4)(2, 3),  (1,
4)(2, 3),  ], ]
);

NCBRACES[4].brace[4] := rec ( size := 4, perms := [ [  (),  (),  ], [  (1, 4)(2,
3),  (1, 3, 2, 4),  ], [  (1, 2)(3, 4),  (1, 2)(3, 4),  ], [  (1, 3)(2, 4),  (1,
4, 2, 3),  ], ]
);


NCBRACES[5] := rec( total := -1, implemented := 1, size := 5, brace := [] 
);NCBRACES[5].brace[1] := rec ( size := 5, perms := [ [  (),  (),  ], [  (1, 5, 
4, 3, 2),  (1, 2, 3, 4, 5),  ], [  (1, 2, 3, 4, 5),  (1, 5, 4, 3, 2),  ], [  (1,
4, 2, 5, 3),  (1, 3, 5, 2, 4),  ], [  (1, 3, 5, 2, 4),  (1, 4, 2, 5, 3),  ], ]
);

