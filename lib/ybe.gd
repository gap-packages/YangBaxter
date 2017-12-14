DeclareCategory("IsYB", IsAttributeStoringRep);
DeclareGlobalVariable("YBType");

DeclareOperation("SmallIYB", [IsInt, IsInt]);
DeclareOperation("YB", [IsList, IsList]);
DeclareOperation("Table2YB", [IsList]);
DeclareOperation("Permutations2YB", [IsList, IsList]);
DeclareOperation("TableYB", [IsYB, IsInt, IsInt]);
DeclareOperation("IsInvariant", [IsYB, IsList]);
DeclareOperation("RestrictedYB", [IsYB, IsList]);
DeclareOperation("TrivialYB", [IsInt]);
DeclareOperation("LyubashenkoYB", [IsInt, IsPerm, IsPerm]);
DeclareOperation("CartesianProduct", [IsYB, IsYB]);
DeclareOperation("DerivedRack", [IsYB]);
DeclareOperation("YB2Permutation", [IsYB]);

### YB
DeclareProperty("IsSquareFree", IsYB);
DeclareProperty("IsLeftNonDegenerate", IsYB);
DeclareProperty("IsRightNonDegenerate", IsYB);
DeclareProperty("IsNonDegenerate", IsYB);
DeclareProperty("IsRetractable", IsYB);
DeclareProperty("IsMultipermutation", IsYB);
DeclareProperty("IsInvolutive", IsYB);
#DeclareProperty("IsSymmetric", IsYB);
DeclareProperty("IsBiquandle", IsYB);

DeclareGlobalFunction("YB_xy");
#DeclareGlobalFunction("SmallIYB");
DeclareGlobalFunction("NrSmallIYB");

#DeclareGlobalFunction("YB_ij");
DeclareGlobalFunction("YB_IsBraidedSet");

DeclareAttribute("LPerms", IsYB);
DeclareAttribute("RPerms", IsYB);
DeclareAttribute("LMatrix", IsYB);
DeclareAttribute("RMatrix", IsYB);

DeclareAttribute("DisplayTable", IsYB);
DeclareAttribute("YBPermutationGroup", IsYB);
DeclareAttribute("IYBGroup", IsYB);
DeclareAttribute("LeftPermutations", IsYB);
DeclareAttribute("RightPermutations", IsYB);
DeclareAttribute("Retract", IsYB);
DeclareAttribute("MultipermutationLevel", IsYB);
DeclareAttribute("YB2CycleSet", IsYB);
DeclareAttribute("StructureGroup", IsYB);
#DeclareAttribute("YB2Permutation", IsYB);
DeclareAttribute("DerivedLeftRack", IsYB);
DeclareAttribute("DerivedRightRack", IsYB);

DeclareOperation("Wada", [IsGroup]);
