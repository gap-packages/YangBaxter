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
DeclareAttribute("AsList", IsSkewBrace);
DeclareAttribute("Is2Sided", IsSkewBrace);
DeclareAttribute("IsClassical", IsSkewBrace);
DeclareAttribute("SkewBrace2Solution", IsSkewBrace);
#DeclareAttribute("IsTwoSidedBrace", IsBrace);

### Braces of size <15
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
ReadPackage("yangbaxter", "data/SBsize18.g");
ReadPackage("yangbaxter", "data/SBsize22.g");
ReadPackage("yangbaxter", "data/SBsize24.g");
