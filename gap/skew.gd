DeclareCategory("IsSkewBrace", IsAttributeStoringRep);
DeclareGlobalVariable("SkewBraceType");

#DeclareAttribute( "SkewBraceFamily", IsFamily );
#DeclareAttribute( "SkewBraceObject", IsPerm );

### To create/recognize braces 
DeclareOperation("SkewBrace", [IsList]);
DeclareOperation("SmallSkewBrace", [IsInt, IsInt]);
DeclareOperation("IsSkewBraceImplemented", [IsInt]);
DeclareOperation("SkewBraceAdd", [IsSkewBrace, IsPerm, IsPerm]);
DeclareOperation("SkewBraceMul", [IsSkewBrace, IsPerm, IsPerm]);
DeclareOperation("SkewBraceAInverse", [IsSkewBrace, IsPerm]);
DeclareOperation("SkewBraceMInverse", [IsSkewBrace, IsPerm]);
DeclareOperation("SkewBraceLambda", [IsSkewBrace, IsPerm, IsPerm]);
DeclareOperation("SkewBraceLambdaAsPermutation", [IsSkewBrace, IsPerm]);
DeclareOperation("Bijective1Cocycle", [IsSkewBrace, IsPerm]);
DeclareOperation("InverseBijective1Cocycle", [IsSkewBrace, IsPerm]);
#DeclareOperation("LambdaMap", [IsBrace, IsPerm]);
#DeclareOperation("InverseLambdaMap", [IsBrace, IsPerm]);
#DeclareOperation("IsomorphismBraces", [IsBrace, IsBrace]);
#
#
DeclareGlobalFunction("NrSmallSkewBraces");
#
#DeclareAttribute("Brace2CycleSet", IsBrace);
#DeclareAttribute("Brace2LinearCycleSet", IsBrace);
#DeclareAttribute("Socle", IsBrace);
DeclareAttribute("SkewBraceAGroup", IsSkewBrace);
DeclareAttribute("SkewBraceMGroup", IsSkewBrace);
DeclareAttribute("Is2Sided", IsSkewBrace);
DeclareAttribute("IsClassical", IsSkewBrace);
DeclareAttribute("SkewBrace2Solution", IsSkewBrace);
#DeclareAttribute("IsTwoSidedBrace", IsBrace);

### Braces of size <15
ReadPackage("yb", "data/SBsize2.g");
ReadPackage("yb", "data/SBsize4.g");
ReadPackage("yb", "data/SBsize5.g");
ReadPackage("yb", "data/SBsize6.g");
ReadPackage("yb", "data/SBsize7.g");
ReadPackage("yb", "data/SBsize8.g");
ReadPackage("yb", "data/SBsize9.g");
ReadPackage("yb", "data/SBsize10.g");
ReadPackage("yb", "data/SBsize11.g");
ReadPackage("yb", "data/SBsize12.g");
ReadPackage("yb", "data/SBsize13.g");
ReadPackage("yb", "data/SBsize14.g");
ReadPackage("yb", "data/SBsize15.g");
ReadPackage("yb", "data/SBsize18.g");
ReadPackage("yb", "data/SBsize22.g");
ReadPackage("yb", "data/SBsize24.g");
