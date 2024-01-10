### quasilinear cycle sets
BindGlobal("TauGroupFamily", NewFamily("TauGroupFamily"));
BindGlobal("TauGroupType", NewType(TauGroupFamily, IsTauGroup));

InstallMethod(TauGroup, "for the list of elements of a group and a permutation", [IsList, IsPerm], 
function(l, p)
  return Objectify(TauGroupType, rec(
    size := Size(l),
    list := l,
    tau := MappingByFunction(Group(l), Group(l), x->l[Position(l, x)^p])
  ));
end);

InstallOtherMethod(Size, "for a tau group", [ IsTauGroup ],
function(obj)
  return obj!.size;
end);

InstallMethod(ViewObj, "for a tau group", [ IsTauGroup ],
function(obj)
  Print("A tau group of size ", obj!.size);
end);

InstallMethod(PrintObj, "for a tau group", [ IsTauGroup ],
function(obj)
  Print( "Tau group of size ", obj!.size);
end);

InstallMethod(SmallTauGroup, "for a list of integers", [IsInt, IsInt],
function(size, number)
  local known, implemented, dir, filename;
  known := IsBound(TGS[size]);
  if not known then
    dir := DirectoriesPackageLibrary("YB", "data")[1];
    filename := Filename(dir, Concatenation("TGsize", String(size), ".g"));
    if IsReadableFile(filename) then
      Read(filename);
    else
      Error("Tau groups of size ", size, " are not implemented");
    fi;
  fi;
  if number <= TGS[size].implemented then
    return TauGroup(TGS[size].tg[number].list, TGS[size].tg[number].tau);
  else
    Error("there are just ", NrSmallTauGroups(size), " tau group(s) of size ", size);
  fi;
end);

### This function returns an isomorphism between two tau groups
### If <obj1> and <obj2> are not isomorphic the function returns fail
InstallMethod(IsomorphismTauGroups, "for tau groups", [ IsTauGroup, IsTauGroup ],
function(obj1, obj2)
  local f, gr1, gr2;

  gr1 := Group(obj1!.list);
  gr2 := Group(obj2!.list);

  for f in Filtered(AllHomomorphisms(gr1, gr2), x->IsInjective(x)) do
    if CompositionMapping2(f, obj1!.tau) = CompositionMapping2(obj2!.tau, f) then
      return f;
    fi;
  od;
  return fail;
end);

InstallMethod(IsTauGroupImplemented, "for an integer", [IsInt],
function(size)
  local known, implemented, dir, filename;
  known := IsBound(TGS[size]);
  if not known then
    dir := DirectoriesPackageLibrary("YB", "data")[1];
    filename := Filename(dir, Concatenation("Tsize", String(size), ".g"));
    if IsReadableFile(filename) then
      return true;
    else
      return false;
    fi;
  fi;
  return true;
end);

### This function returns the number of tau groups of size <n>
InstallGlobalFunction(NrSmallTauGroups, 
function(size)
  local dir, filename;
  if size <= 7 then
    return TGS[size].implemented;
  else
    dir := DirectoriesPackageLibrary("YB", "data")[1];
    filename := Filename(dir, Concatenation("Tsize", String(size), ".g"));
    if IsReadableFile(filename) then
      Read(filename);
      return TGS[size].implemented;
    else
      Error("Tau groups of size ", size, " are not implemented");
    fi;
  fi;
end);

InstallMethod(UnderlyingGroup, "for a tau group", [ IsTauGroup ],
function(obj)
  return Group(obj!.list);
end);

InstallMethod(UnderlyingCycleSet, "for a tau group", [IsTauGroup],
function(obj)
  local a, b, m, cs;
  
  m := NullMat(Size(obj), Size(obj));

  for a in obj!.list do
    for b in obj!.list do
      m[Position(obj!.list, a)][Position(obj!.list, b)] := Position(obj!.list, Image(obj!.tau, b*Inverse(a))*Inverse(Image(obj!.tau, Inverse(a))));
    od;
  od;

  return CycleSet(m);
end);

#
