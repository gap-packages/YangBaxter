DeclareCategory("IsBrace", IsAttributeStoringRep);

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


DeclareGlobalFunction("NrSmallBraces");

DeclareAttribute("Brace2CycleSet", IsBrace);
DeclareAttribute("Brace2LinearCycleSet", IsBrace);
DeclareAttribute("Socle", IsBrace);
DeclareAttribute("BraceAdditiveGroup", IsBrace);
DeclareAttribute("BraceMultiplicativeGroup", IsBrace);
DeclareAttribute("IsTwoSidedBrace", IsBrace);

### Braces of size <15
ReadPackage("yangbaxter", "data/Bsmall.g");
ReadPackage("yangbaxter", "data/Bsize2.g");
ReadPackage("yangbaxter", "data/Bsize3.g");
ReadPackage("yangbaxter", "data/Bsize4.g");
ReadPackage("yangbaxter", "data/Bsize5.g");
ReadPackage("yangbaxter", "data/Bsize6.g");
ReadPackage("yangbaxter", "data/Bsize7.g");
ReadPackage("yangbaxter", "data/Bsize8.g");
ReadPackage("yangbaxter", "data/Bsize9.g");
ReadPackage("yangbaxter", "data/Bsize10.g");
ReadPackage("yangbaxter", "data/Bsize11.g");
ReadPackage("yangbaxter", "data/Bsize12.g");
ReadPackage("yangbaxter", "data/Bsize13.g");
ReadPackage("yangbaxter", "data/Bsize14.g");
ReadPackage("yangbaxter", "data/Bsize15.g");
