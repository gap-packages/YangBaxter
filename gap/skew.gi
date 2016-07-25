### braces
BindGlobal("SkewBraceFamily", NewFamily("SkewBraceFamily"));
InstallValue(SkewBraceType, NewType(SkewBraceFamily, IsSkewBrace));

InstallMethod(SkewBrace, "for a list of pairs of elements in a group", [IsList], 
function(p)
  local additive, multiplicative;

  additive := Group(List(p, x->x[1]));
  multiplicative := Group(List(p, x->x[2]));

  ### <additive> is (a permutation representation of) the abelian group of the brace
  ### <multiplicative> is the multiplicative group of the brace
  ### <p> is the bijection from <additive> to <multiplicative> 

  return Objectify(SkewBraceType, rec(
    size := Size(additive),
    additive := additive,
    multiplicative := multiplicative, 
    p := MappingByFunction(additive, multiplicative, x->First(p, y->IsOne(y[1]*Inverse(x)))[2]),
  ));
end);

InstallOtherMethod(Size, "for skew braces", [ IsSkewBrace ],
function(obj)
  return obj!.size;
end);

InstallMethod(ViewObj, "for skew braces", [ IsSkewBrace ],
function(obj)
  Print("A skew brace of size ", obj!.size);
end);

InstallMethod(PrintObj, "for skew braces", [ IsSkewBrace ],
function(obj)
  Print( "Skew brace of size ", obj!.size);
end);

### This function returns true is the <brace> is a two-sided brace
### This means: (a+b)c+c=ac+bc
### Equivalent condition: l(a+b)(c)+c=l(a)(c)+l(b)(c), where l(a)(b)=ab-a
#InstallMethod(IsTwoSidedBrace, "for a brace", [IsBrace], 
#function(obj)
#  local a, b, c;
#  for a in obj!.additive do
#    for b in obj!.additive do
#      for c in obj!.additive do
#        if BraceSum(obj, c^LambdaMap(obj, BraceSum(obj, a, b)), c) <> BraceSum(obj, c^LambdaMap(obj, a), c^LambdaMap(obj, b)) then
#          return false;
#        fi;
#      od;
#    od;
#  od;
#  return true;
#end);
#
InstallMethod(SmallSkewBrace, "for a list of integers", [IsInt, IsInt],
function(size, number)
  local known, implemented, dir, filename;
  known := IsBound(NCBRACES[size]);
  if not known then
    dir := DirectoriesPackageLibrary("YB", "data")[1];
    filename := Filename(dir, Concatenation("SBsize", String(size), ".g"));
    if IsReadableFile(filename) then
      Read(filename);
    else
      Error("Braces of size ", size, " are not implemented");
    fi;
  fi;
  if number <= NCBRACES[size].implemented then
    return SkewBrace(NCBRACES[size].brace[number].perms);
  else
    Error("there are just ", NrSmallSkewBraces(size), " braces of size ", size);
  fi;
end);

InstallMethod(IsBraceImplemented, "for an integer", [IsInt],
function(size)
  local known, implemented, dir, filename;
  known := IsBound(NCBRACES[size]);
  if not known then
    dir := DirectoriesPackageLibrary("YB", "data")[1];
    filename := Filename(dir, Concatenation("Bsize", String(size), ".g"));
    if IsReadableFile(filename) then
      return true;
    else
      return false;
    fi;
  fi;
  return true;
end);
#
#### This function returns the number of braces of size <n>
InstallGlobalFunction(NrSmallSkewBraces, 
function(size)
  local dir, filename;
  if size <= 15 then
    return NCBRACES[size].implemented;
  else
    dir := DirectoriesPackageLibrary("YB", "data")[1];
    filename := Filename(dir, Concatenation("SBsize", String(size), ".g"));
    if IsReadableFile(filename) then
      Read(filename);
      return NCBRACES[size].implemented;
    else
      Error("Skew braces of size ", size, " are not implemented");
    fi;
  fi;
end);
#
#InstallMethod(BraceSum, "for a brace and two permutations", [IsBrace, IsPerm, IsPerm],
#function(obj, a, b)
#  if not a in obj!.additive or not b in obj!.additive then
#    return fail;
#  else
#    return a*b;
#  fi;
#end);
#
#InstallMethod(BraceProduct, "for a brace and two permutations", [IsBrace, IsPerm, IsPerm],
#function(obj, a, b)
#  if not a in obj!.additive or not b in obj!.additive then
#    return fail;
#  else
#    return PreImageElm(obj!.p, Image(obj!.p, a)*Image(obj!.p, b));
#  fi;
#end);
#
#InstallMethod(Socle, "for braces", [ IsBrace ],
#function(obj)
#  local l, g;
#  l := [];
#  for g in obj!.multiplicative do
#    if ForAll(obj!.additive, x->PreImageElm(obj!.p, g)*x = BraceProduct(obj, PreImageElm(obj!.p, g), x)) then
#      Add(l, g);
#    fi;
#  od;
#  return Subgroup(obj!.multiplicative, SmallGeneratingSet(Subgroup(obj!.multiplicative, l)));
#end);
#
#InstallMethod(BraceAdditiveGroup, "for a brace", [ IsBrace ], 
#function(obj)
#  return Group(SmallGeneratingSet(obj!.additive));
#end);
#
#InstallMethod(BraceMultiplicativeGroup, "for a brace", [ IsBrace ], 
#function(obj)
#  return Group(SmallGeneratingSet(obj!.multiplicative));
#end);
#
#InstallMethod(AdditiveInverse, "for a brace and a permutation", [IsBrace, IsPerm], 
#function(obj, a)
#  return Inverse(a);
#end);
#
#InstallMethod(MultiplicativeInverse, "for a brace and a permutation", [IsBrace, IsPerm], 
#function(obj, a)
#  return PreImageElm(obj!.p, Inverse(Image(obj!.p, a)));
#end);
#
#InstallMethod(LambdaMap, "for a brace and a permutation", [IsBrace, IsPerm], 
#function(obj, a)
#  return MappingByFunction(obj!.additive, obj!.additive, b->BraceProduct(obj, a, b)*Inverse(a));
#end);
#
#InstallMethod(InverseLambdaMap, "for a brace and a permutation", [IsBrace, IsPerm], 
#function(obj, a)
#  return InverseGeneralMapping(LambdaMap( obj, a));
#end);
#
#### This function returns the cycle set associated with the brace <obj>
#InstallMethod(Brace2CycleSet, "for braces", [ IsBrace ],
#function(obj)
#  local p, x, y, e, xy;
#  e := Enumerator(obj!.additive);
#  p := NullMat(Size(obj), Size(obj));
#  for x in obj!.additive do
#    for y in obj!.additive do
#      xy := BraceProduct(obj, x, y);
#      p[Position(e, y)][Position(e, x)] := Position(e, BraceProduct(obj, MultiplicativeInverse(obj, BraceSum(obj, xy, Inverse(x))), xy));
#    od;
#  od;
#  return Permutations2CycleSet(List(p, x->Inverse(PermList(x))));
#end);
#
#### This function returns an isomorphism between the braces
#### <brace1> and <brace2> 
#### If <brace1> and <brace2> are not isomorphic the function returns fail
#InstallMethod(IsomorphismBraces, "for braces", [ IsBrace, IsBrace ],
#function(brace1, brace2)
#  local f, additive, additive;
#
#  additive :=  BraceAdditiveGroup(brace1);
#  additive :=  BraceAdditiveGroup(brace2);
#
#  for f in Filtered(AllHomomorphisms(additive, additive), x->IsInjective(x)) do
#    if ForAll(Cartesian(AsList(additive), AsList(additive)), x->BraceProduct(brace1, x[1], x[2])^f = BraceProduct(brace2, x[1]^f, x[2]^f)) then
#      return f;
#    fi;
#  od;
#  return fail;
#end);
#
#### This function returns the linear cycle set associated with the brace <obj>
#InstallMethod(Brace2LinearCycleSet, "for braces", [ IsBrace ],
#function(obj)
#  local p, x, y, e, xy;
#  e := Enumerator(obj!.additive);
#  p := NullMat(Size(obj), Size(obj));
#  for x in obj!.additive do
#    for y in obj!.additive do
#      xy := BraceProduct(obj, x, y);
#      p[Position(e, y)][Position(e, x)] := Position(e, BraceProduct(obj, MultiplicativeInverse(obj, BraceSum(obj, xy, Inverse(x))), xy));
#    od;
#  od;
#  return LinearCycleSet(Elements(e), p);
#end);
#

