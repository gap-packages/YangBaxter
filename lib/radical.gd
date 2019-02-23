#! @Chapter Algebraic Properties of Braces
#! @Section Braces and Radical Rings
#! @Arguments ring
#! @Returns a group 
#! @Description
#! This function returns a permutation representation 
#! of the additive group of the given ring. 
#! @ExampleSession
#! gap> rg := SmallRing(8,10);;
#! gap> StructureDescription(AdditiveGroupOfRing(rg));
#! "C4 x C2"
#! @EndExampleSession
DeclareAttribute("AdditiveGroupOfRing", IsRing);

#! @Arguments ring
#! @Returns true if the ring is radical and false otherwise.
#! @Description
#! This function checks whether a ring is Jacobson radical. 
#! @ExampleSession
#! gap> rg := SmallRing(8,11);;
#! gap> IsJacobsonRadical(rg);
#! true
#! gap> rg := SmallRing(8,20);;
#! gap> IsJacobsonRadical(rg);
#! false
#! @EndExampleSession
DeclareAttribute("IsJacobsonRadical", IsRing);

# @Arguments ring
# @Returns a group 
# @Description
# This function returns the adjoint group of the radical ring.
# @ExampleSession
# gap> rg := SmallRing(8,10);;
# gap> IsJacobsonRadical(rg);
# true
# gap> StructureDescription(AdjointGroup(rg));
# "D8"
# @EndExampleSession
# DeclareAttribute("AdjointGroup", IsRing);

# @Arguments ring
# @Returns a brace 
# @Description
# This function returns the brace of the given radical ring.
# @ExampleSession
# gap> rg := SmallRing(8,10);;
# gap> IsJacobsonRadical(rg);
# true
# gap> IdBrace(RadicalRing2Brace(rg));
# [ 8, 13 ]
# @EndExampleSession
# DeclareAttribute("RadicalRing2Brace", IsRing);

#DeclareAttribute("Brace2RadicalRing", IsBrace);

