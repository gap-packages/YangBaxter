DeclareAttribute("Ideals", IsSkewBrace );
DeclareAttribute("Socle", IsSkewBrace );

DeclareProperty("IsSimpleSkewBrace", IsSkewBrace );

DeclareOperation("IsIdeal", [ IsSkewBrace, IsCollection ]);
DeclareOperation("AsIdeal", [ IsSkewBrace, IsCollection ]);

DeclareGlobalFunction("SubSkewBrace");
