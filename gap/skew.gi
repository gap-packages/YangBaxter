### skew braces
BindGlobal("SkewBraceFamily", NewFamily("SkewBraceFamily"));
InstallValue(SkewBraceType, NewType(SkewBraceFamily, IsSkewBrace));

InstallMethod(SkewBrace, "for a list of pairs of elements in a group", [IsList], 
function(p)
  local additive, multiplicative;

  additive := Group(List(p, x->x[1]));
  multiplicative := Group(List(p, x->x[2]));

  ### <additive> is (a permutation representation of) the additive group of the brace
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
  local obj, known, implemented, dir, filename;
  known := IsBound(NCBRACES[size]);
  if not known then
    dir := DirectoriesPackageLibrary("YangBaxter", "data")[1];
    filename := Filename(dir, Concatenation("SBsize", String(size), ".g"));
    if IsReadableFile(filename) then
      Read(filename);
    else
      Error("Braces of size ", size, " are not implemented");
    fi;
  fi;
  if number <= NCBRACES[size].implemented then
    obj := SkewBrace(NCBRACES[size].brace[number].perms);
    Unbind(NCBRACES[size]);
    return obj;
  else
    Error("there are just ", NrSmallSkewBraces(size), " braces of size ", size);
  fi;
end);

InstallMethod(IsBraceImplemented, "for an integer", [IsInt],
function(size)
  local known, implemented, dir, filename;
  known := IsBound(NCBRACES[size]);
  if not known then
    dir := DirectoriesPackageLibrary("YangBaxter", "data")[1];
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
    dir := DirectoriesPackageLibrary("YangBaxter", "data")[1];
    filename := Filename(dir, Concatenation("SBsize", String(size), ".g"));
    if IsReadableFile(filename) then
      Read(filename);
      return NCBRACES[size].implemented;
    else
      Error("Skew braces of size ", size, " are not implemented");
    fi;
  fi;
end);

### Return the additive group of a skew brace represented by as a permutation group (by left? multiplication)
InstallMethod(SkewBraceAGroup, "for a skew brace", [IsSkewBrace],
function(obj)
  return obj!.additive;
end);

InstallMethod(SkewBraceMGroup, "for a skew brace", [IsSkewBrace],
function(obj)
  return obj!.multiplicative;
end);

InstallMethod(SkewBraceAdd, "for a skew brace and two permutations", [IsSkewBrace, IsPerm, IsPerm],
function(obj, a, b)
  if not a in obj!.additive or not b in obj!.additive then
    return fail;
  else
    return a*b;
  fi;
end);

InstallMethod(SkewBraceMul, "for a skew brace and two permutations", [IsSkewBrace, IsPerm, IsPerm],
function(obj, a, b)
  if not a in obj!.additive or not b in obj!.additive then
    return fail;
  else
    return PreImageElm(obj!.p, Image(obj!.p, a)*Image(obj!.p, b));
  fi;
end);

InstallMethod(SkewBraceMInverse, "for a skew brace and a permutation", [IsSkewBrace, IsPerm], 
function(obj, a)
  return PreImageElm(obj!.p, Inverse(Image(obj!.p, a)));
end);

InstallMethod(SkewBraceAInverse, "for a skew brace and a permutation", [IsSkewBrace, IsPerm], 
function(obj, a)
  return Inverse(a);
end);

InstallMethod(SkewBraceLambda, "for a skew brace and two permutations", [ IsSkewBrace, IsPerm, IsPerm],
function(obj, a, b)
  return SkewBraceAdd(obj, SkewBraceAInverse(obj, a), SkewBraceMul(obj, a, b));
end);

InstallMethod(SkewBraceLambdaAsPermutation, "for a skew brace and a permutation", [ IsSkewBrace, IsPerm ],
function(obj, a)
  local p, l, x;

  l := AsList(SkewBraceAGroup(obj));
  p := [1..Size(obj)];

  for x in [1..Size(obj)] do
    p[x] := Position(l, SkewBraceLambda(obj, a, l[x]));
  od;

  return PermList(p);
end);

InstallMethod(SkewBrace2Solution, "for a skew brace", [ IsSkewBrace ], 
function(obj)
  local a, b, x, y, u, v, add, set, tmp_r, tmp_l, lperms, rperms;

  add := Elements(SkewBraceAGroup(obj));
  set := [1..Size(obj)];

  lperms := [];
  rperms := [];

  for a in add do

    tmp_l := [];
    tmp_r := [];

    for b in add do
      x := SkewBraceAdd(obj, SkewBraceMul(obj, a, b), SkewBraceAInverse(obj, a));
      u := Position(add, x);
      v := Position(add, SkewBraceMul(obj, SkewBraceMul(obj, SkewBraceMInverse(obj, x), a), b));
      Add(tmp_l, u); 
      Add(tmp_r, v); 
    od;
    Add(lperms, tmp_l);
    Add(rperms, tmp_r);
  od;

  lperms := List(lperms, PermList);
  rperms := List(TransposedMat(rperms), PermList);

  return Permutations2YB(lperms, rperms); 
end);

InstallMethod(IsClassical, "for a skew brace", [ IsSkewBrace ], 
function(obj)
  return IsAbelian(SkewBraceAGroup(obj));
end);

InstallMethod(Is2Sided, "for a skew brace", [ IsSkewBrace ], 
function(obj)
  local a, b, c;
  for a in SkewBraceAGroup(obj) do
    for b in SkewBraceAGroup(obj) do
      for c in SkewBraceAGroup(obj) do
        if SkewBraceMul(obj, SkewBraceAdd(obj, a, b), c) <> SkewBraceAdd(obj, SkewBraceMul(obj, a, c), SkewBraceAdd(obj, SkewBraceAInverse(obj, c), SkewBraceMul(obj, b, c))) then
          #Display([a,b,c]);
          return false;
        fi;
      od;
    od;
  od;
  return true;
end);

### Returns the value of <a> under the image of the 
### bijective 1-cocycle from the multiplicative group into the 
### additive group of 
InstallMethod(Bijective1Cocycle, "for a skew brace and a permutation", [ IsSkewBrace, IsPerm ], 
function(obj, a)
  return PreImage(obj!.p, a);
end);

InstallMethod(InverseBijective1Cocycle, "for a skew brace and a permutation", [ IsSkewBrace, IsPerm ], 
function(obj, a)
  return Image(obj!.p, a);
end);

