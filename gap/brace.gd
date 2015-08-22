DeclareCategory("IsBrace", IsAttributeStoringRep);
DeclareGlobalVariable("BraceType");

### To create/recognize braces 
DeclareOperation("Brace", [IsList]);
DeclareOperation("SmallBrace", [IsInt, IsInt]);
DeclareOperation("IsBraceImplemented", [IsInt]);
DeclareOperation("BraceSum", [IsBrace, IsPerm, IsPerm]);
DeclareOperation("BraceProduct", [IsBrace, IsPerm, IsPerm]);
DeclareOperation("AdditiveInverse", [IsBrace, IsPerm]);
DeclareOperation("MultiplicativeInverse", [IsBrace, IsPerm]);
DeclareOperation("LambdaMap", [IsBrace, IsPerm]);
DeclareOperation("InverseLambdaMap", [IsBrace, IsPerm]);
DeclareOperation("IsomorphismBraces", [IsBrace, IsBrace]);

DeclareOperation("Wada", [IsGroup]);

DeclareGlobalFunction("NrSmallBraces");

DeclareAttribute("Brace2CycleSet", IsBrace);
DeclareAttribute("Socle", IsBrace);
DeclareAttribute("BraceAdditiveGroup", IsBrace);
DeclareAttribute("BraceMultiplicativeGroup", IsBrace);
DeclareAttribute("IsTwoSidedBrace", IsBrace);

### Braces of size <15
ReadPackage("yb", "data/Bsmall.g");
ReadPackage("yb", "data/Bsize2.g");
ReadPackage("yb", "data/Bsize3.g");
ReadPackage("yb", "data/Bsize4.g");
ReadPackage("yb", "data/Bsize5.g");
ReadPackage("yb", "data/Bsize6.g");
ReadPackage("yb", "data/Bsize7.g");
ReadPackage("yb", "data/Bsize8.g");
ReadPackage("yb", "data/Bsize9.g");
ReadPackage("yb", "data/Bsize10.g");
ReadPackage("yb", "data/Bsize11.g");
ReadPackage("yb", "data/Bsize12.g");
ReadPackage("yb", "data/Bsize13.g");
ReadPackage("yb", "data/Bsize14.g");
ReadPackage("yb", "data/Bsize15.g");
