DeclareCategory("IsBrace", IsAttributeStoringRep);
DeclareGlobalVariable("BraceType");

### To create/recognize braces 
DeclareOperation("Brace", [IsList]);
DeclareOperation("SmallBrace", [IsInt, IsInt]);
DeclareOperation("BraceSum", [IsBrace, IsPerm, IsPerm]);
DeclareOperation("BraceProduct", [IsBrace, IsPerm, IsPerm]);
DeclareOperation("AdditiveInverse", [IsBrace, IsPerm]);
DeclareOperation("MultiplicativeInverse", [IsBrace, IsPerm]);
DeclareOperation("LambdaMap", [IsBrace, IsPerm]);
DeclareOperation("InverseLambdaMap", [IsBrace, IsPerm]);
DeclareOperation("IsomorphismBraces", [IsBrace, IsBrace]);

DeclareGlobalFunction("NrSmallBraces");

DeclareAttribute("Brace2CycleSet", IsBrace);
DeclareAttribute("Socle", IsBrace);
DeclareAttribute("BraceAdditiveGroup", IsBrace);
DeclareAttribute("BraceMultiplicativeGroup", IsBrace);

### Braces of size <15
ReadPackage("yb", "data/Bsmall.g");

