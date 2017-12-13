DeclareCategory("IsSkewBrace", IsAttributeStoringRep);
DeclareCategory("IsSkewBraceElm", IsMultiplicativeElementWithInverse and IsAdditiveElementWithInverse);
DeclareCategoryCollections("IsSkewBraceElm");

DeclareRepresentation( "IsSkewBraceElmRep", IsPositionalObjectRep, [ 1 ]);

BindGlobal("SkewBraceElmFamily", NewFamily("SkewBraceElmFamily", IsSkewBraceElm));
BindGlobal("SkewBraceElmType", NewType(SkewBraceElmFamily, IsSkewBraceElm));
BindGlobal("SkewBraceType", NewType(CollectionsFamily( SkewBraceElmFamily ), IsSkewBrace and IsAttributeStoringRep));

### To create/recognize braces 
DeclareOperation("SkewBrace", [IsList]);
DeclareOperation("SmallSkewBrace", [IsInt, IsInt]);
DeclareOperation("SmallBrace", [IsInt, IsInt]);
DeclareAttribute("IdSkewBrace", IsSkewBrace);
DeclareAttribute("IdBrace", IsSkewBrace);
DeclareAttribute("ZeroImmutable", IsSkewBrace);
DeclareAttribute("OneImmutable", IsSkewBrace);
DeclareAttribute("Representative", IsSkewBrace);
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

DeclareGlobalFunction("NrSmallSkewBraces");
DeclareGlobalFunction("NrSmallBraces");

#DeclareAttribute("Brace2CycleSet", IsBrace);
#DeclareAttribute("Brace2LinearCycleSet", IsBrace);
#DeclareAttribute("Socle", IsBrace);
DeclareAttribute("SkewBraceAList", IsSkewBrace);
DeclareAttribute("SkewBraceMList", IsSkewBrace);
DeclareAttribute("AsList", IsSkewBrace);
DeclareAttribute("Is2Sided", IsSkewBrace);
DeclareAttribute("IsClassical", IsSkewBrace);
DeclareAttribute("SkewBrace2Solution", IsSkewBrace);
DeclareProperty("IsTwoSidedSkewBrace", IsSkewBrace);
DeclareProperty("IsClassicalSkewBrace", IsSkewBrace);

### Skew braces of size <15
ReadPackage("yangbaxter", "data/SBsize2.g");
ReadPackage("yangbaxter", "data/SBsize4.g");
ReadPackage("yangbaxter", "data/SBsize5.g");
ReadPackage("yangbaxter", "data/SBsize6.g");
ReadPackage("yangbaxter", "data/SBsize7.g");
ReadPackage("yangbaxter", "data/SBsize8.g");
ReadPackage("yangbaxter", "data/SBsize9.g");
ReadPackage("yangbaxter", "data/SBsize10.g");
ReadPackage("yangbaxter", "data/SBsize11.g");
ReadPackage("yangbaxter", "data/SBsize12.g");
ReadPackage("yangbaxter", "data/SBsize13.g");
ReadPackage("yangbaxter", "data/SBsize14.g");
ReadPackage("yangbaxter", "data/SBsize15.g");

### Braces of size <15
ReadPackage("yangbaxter", "data/Bsmall.g");
ReadPackage("yangbaxter", "data/Bsize2.g");
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

