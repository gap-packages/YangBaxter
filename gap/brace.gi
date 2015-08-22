### braces
BindGlobal("BraceFamily", NewFamily("BraceFamily"));
InstallValue(BraceType, NewType(BraceFamily, IsBrace));

InstallMethod(Brace, "for a list of pairs of elements in a group", [IsList], 
function(p)
  local ab, gr;

  ab := Group(List(p, x->x[1]));
  gr := Group(List(p, x->x[2]));

  ### <ab> is (a permutation representation of) the abelian group of the brace
  ### <gr> is the multiplicative group of the brace
  ### <p> is the bijection from <ab> to <gr> 

  return Objectify(BraceType, rec(
    size := Size(ab),
    ab := ab,
    gr := gr, 
    p := MappingByFunction(ab, gr, x->First(p, y->IsOne(y[1]*Inverse(x)))[2]),
  ));
end);

InstallOtherMethod(Size, "for braces", [ IsBrace ],
function(obj)
  return obj!.size;
end);

InstallMethod(ViewObj, "for braces", [ IsBrace ],
function(obj)
  Print("A brace of size ", obj!.size);
end);

InstallMethod(PrintObj, "for braces", [ IsBrace ],
function(obj)
  Print( "Brace of size ", obj!.size);
end);

### This function returns true is the <brace> is a two-sided brace
### This means: (a+b)c+c=ac+bc
### Equivalent condition: l(a+b)(c)+c=l(a)(c)+l(b)(c), where l(a)(b)=ab-a
InstallMethod(IsTwoSidedBrace, "for a brace", [IsBrace], 
function(obj)
  local a, b, c;
  for a in obj!.ab do
    for b in obj!.ab do
      for c in obj!.ab do
        if BraceSum(obj, c^LambdaMap(obj, BraceSum(obj, a, b)), c) <> BraceSum(obj, c^LambdaMap(obj, a), c^LambdaMap(obj, b)) then
          return false;
        fi;
      od;
    od;
  od;
  return true;
end);

InstallMethod(SmallBrace, "for a list of integers", [IsInt, IsInt],
function(size, number)
  local known, implemented, dir, filename;
  known := IsBound(BRACES[size]);
  if not known then
    dir := DirectoriesPackageLibrary("YB", "data")[1];
    filename := Filename(dir, Concatenation("Bsize", String(size), ".g"));
    if IsReadableFile(filename) then
      Read(filename);
    else
      Error("Braces of size ", size, " are not implemented");
    fi;
  fi;
  if number <= BRACES[size].implemented then
    return Brace(BRACES[size].brace[number].perms);
  else
    Error("there are just ", NrSmallBraces(size), " braces of size ", size);
  fi;
end);

InstallMethod(IsBraceImplemented, "for an integer", [IsInt],
function(size)
  local known, implemented, dir, filename;
  known := IsBound(BRACES[size]);
  if not known then
    dir := DirectoriesPackageLibrary("YB", "data")[1];
    filename := Filename(dir, Concatenation("Bsize", String(size), ".g"));
    if IsReadableFile(filename) then
      return true;
    else
      return false;
    fi;
  fi;
end);

### This function returns the number of braces of size <n>
InstallGlobalFunction(NrSmallBraces, 
function(size)
  local dir, filename;
  if size <= 15 then
    return BRACES[size].implemented;
  else
    dir := DirectoriesPackageLibrary("YB", "data")[1];
    filename := Filename(dir, Concatenation("Bsize", String(size), ".g"));
    if IsReadableFile(filename) then
      Read(filename);
      return BRACES[size].implemented;
    else
      Error("Braces of size ", size, " are not implemented");
    fi;
  fi;
end);

InstallMethod(BraceSum, "for a brace and two permutations", [IsBrace, IsPerm, IsPerm],
function(obj, a, b)
  if not a in obj!.ab or not b in obj!.ab then
    return fail;
  else
    return a*b;
  fi;
end);

InstallMethod(BraceProduct, "for a brace and two permutations", [IsBrace, IsPerm, IsPerm],
function(obj, a, b)
  if not a in obj!.ab or not b in obj!.ab then
    return fail;
  else
    return PreImageElm(obj!.p, Image(obj!.p, a)*Image(obj!.p, b));
  fi;
end);

InstallMethod(Socle, "for braces", [ IsBrace ],
function(obj)
  local l, g;
  l := [];
  for g in obj!.gr do
    if ForAll(obj!.ab, x->PreImageElm(obj!.p, g)*x = BraceProduct(obj, PreImageElm(obj!.p, g), x)) then
      Add(l, g);
    fi;
  od;
  return Subgroup(obj!.gr, l);
end);

InstallMethod(BraceAdditiveGroup, "for a brace", [ IsBrace ], 
function(obj)
  return obj!.ab;
end);

InstallMethod(BraceMultiplicativeGroup, "for a brace", [ IsBrace ], 
function(obj)
  return obj!.gr;
end);

InstallMethod(AdditiveInverse, "for a brace and a permutation", [IsBrace, IsPerm], 
function(obj, a)
  return Inverse(a);
end);

InstallMethod(MultiplicativeInverse, "for a brace and a permutation", [IsBrace, IsPerm], 
function(obj, a)
  return PreImageElm(obj!.p, Inverse(Image(obj!.p, a)));
end);

InstallMethod(LambdaMap, "for a brace and a permutation", [IsBrace, IsPerm], 
function(obj, a)
  return MappingByFunction(obj!.ab, obj!.ab, b->BraceProduct(obj, a, b)*Inverse(a));
end);

InstallMethod(InverseLambdaMap, "for a brace and a permutation", [IsBrace, IsPerm], 
function(obj, a)
  return InverseGeneralMapping(LambdaMap, obj, a);
end);

### This function returns the cycle set associated with the brace <obj>
InstallMethod(Brace2CycleSet, "for braces", [ IsBrace ],
function(obj)
  local p, x, y, e, xy;
  e := Enumerator(obj!.ab);
  p := NullMat(Size(obj), Size(obj));
  for x in obj!.ab do
    for y in obj!.ab do
      xy := BraceProduct(obj, x, y);
      p[Position(e, y)][Position(e, x)] := Position(e, BraceProduct(obj, MultiplicativeInverse(obj, BraceSum(obj, xy, Inverse(x))), xy));
    od;
  od;
  return Permutations2CycleSet(List(p, x->Inverse(PermList(x))));
end);

### This function returns an isomorphism between the braces
### <brace1> and <brace2> 
### If <brace1> and <brace2> are not isomorphic the function returns fail
InstallMethod(IsomorphismBraces, "for braces", [ IsBrace, IsBrace ],
function(brace1, brace2)
  local f, ab1, ab2;

  ab1 :=  BraceAdditiveGroup(brace1);
  ab2 :=  BraceAdditiveGroup(brace2);

  for f in Filtered(AllHomomorphisms(ab1, ab2), x->IsInjective(x)) do
    if ForAll(Cartesian(AsList(ab1), AsList(ab1)), x->BraceProduct(brace1, x[1], x[2])^f = BraceProduct(brace2, x[1]^f, x[2]^f)) then
      return f;
    fi;
  od;
  return fail;
end);

InstallMethod(Wada, "for a group", [ IsGroup ],
function(group)
  local x, y, e, lperms, rperms;

  e := Elements(group);
  lperms := NullMat(Size(group), Size(group));
  rperms := NullMat(Size(group), Size(group));
  for x in group do
    for y in group do
      lperms[Position(e, x)][Position(e, y)] := Position(e, x*Inverse(y)*Inverse(x));
      rperms[Position(e, y)][Position(e, x)] := Position(e, x*y^2);
    od;
  od;
  return YB(lperms, rperms);
end);

