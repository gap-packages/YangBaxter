### cycle sets
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

InstallMethod(SmallBrace, "for a list of integers", [IsInt, IsInt],
function(size, number)
  local known, implemented, dir, filename;
  known := IsBound(BRACES[size]);
  if not known then
    dir := DirectoriesPackageLibrary("YB", "data")[1];
    filename := Filename(dir, Concatenation("bsize", String(size), ".g"));
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
    return PreImageElm(obj!.p, Image(obj!.p, b)*Image(obj!.p, a));
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


InstallMethod(Brace2CycleSet, "for braces", [ IsBrace ],
function(obj)
  local x, y, m, e, l;

  m := NullMat(Size(obj), Size(obj));
  l := Enumerator(obj!.ab);

  for x in obj!.ab do
    for y in obj!.ab do
### WRONG
      m[Position(l, Image(LambdaMap(obj, x), y))][Position(l, x)] := Position(l, Image(InverseLambdaMap(obj, Image(LambdaMap(obj, x), y), x)));
    od;
  od;
  return CycleSet(m);
end);


