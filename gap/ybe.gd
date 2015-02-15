DeclareCategory("IsYB", IsAttributeStoringRep);
DeclareGlobalVariable("YBType");

DeclareOperation("YB", [IsList, IsList]);
DeclareOperation("Table2YB", [IsList]);
DeclareOperation("Permutations2YB", [IsList, IsList]);
DeclareOperation("TableYB", [IsYB, IsInt, IsInt]);
DeclareOperation("IsInvariant", [IsYB, IsList]);
DeclareOperation("RestrictedSolution", [IsYB, IsList]);

### YB
DeclareProperty("IsSquareFree", IsYB);
DeclareProperty("IsLeftNonDegenerate", IsYB);
DeclareProperty("IsRightNonDegenerate", IsYB);
DeclareProperty("IsNonDegenerate", IsYB);
DeclareProperty("IsRetractable", IsYB);
DeclareProperty("IsMultipermutation", IsYB);
DeclareProperty("IsInvolutive", IsYB);
#DeclareProperty("IsSymmetric", IsYB);

DeclareGlobalFunction("YB_xy");
DeclareGlobalFunction("SmallSolution");
DeclareGlobalFunction("NrSmallSolutions");

DeclareGlobalFunction("YB_ij");
DeclareGlobalFunction("YB_IsBraidedSet");

DeclareAttribute("Table", IsYB);
DeclareAttribute("YBPermutationGroup", IsYB);
DeclareAttribute("IYBGroup", IsYB);
DeclareAttribute("LeftPermutations", IsYB);
DeclareAttribute("RightPermutations", IsYB);
DeclareAttribute("Retract", IsYB);
DeclareAttribute("MultipermutationLevel", IsYB);
DeclareAttribute("YB2CycleSet", IsYB);


