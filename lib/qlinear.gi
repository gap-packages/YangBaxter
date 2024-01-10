### quasilinear cycle sets
BindGlobal("QLCycleSetFamily", NewFamily("QLCycleSetFamily"));
BindGlobal("QLCycleSetType", NewType(QLCycleSetFamily, IsQLCycleSet));

InstallMethod(QLCycleSet, "for the list of elements of a group and a matrix", [IsList, IsMatrix], 
function(l, m)
  return Objectify(QLCycleSetType, rec(
    size := Size(l),
    list := l,
    matrix := m
  ));
end);

InstallOtherMethod(Size, "for a quasilinear cycle set", [ IsQLCycleSet ],
function(obj)
  return obj!.size;
end);

InstallMethod(ViewObj, "for a quasilinear cycle set", [ IsQLCycleSet ],
function(obj)
  Print("A quasilinear cycle set of size ", obj!.size);
end);

InstallMethod(PrintObj, "for a quasilinear cycle set", [ IsQLCycleSet ],
function(obj)
  Print("A quasilinear cycle set of size ", obj!.size);
end);

InstallMethod(SmallQLCycleSet, "for a list of integers", [IsInt, IsInt],
function(size, number)
  local known, implemented, dir, filename;
  known := IsBound(QLCS[size]);
  if not known then
    dir := DirectoriesPackageLibrary("YB", "data")[1];
    filename := Filename(dir, Concatenation("QLsize", String(size), ".g"));
    if IsReadableFile(filename) then
      Read(filename);
    else
      Error("QL cyclesets of size ", size, " are not implemented");
    fi;
  fi;
  if number <= QLCS[size].implemented then
    return QLCycleSet(QLCS[size].qlcs[number].list, QLCS[size].qlcs[number].matrix);
  else
    Error("there are just ", NrSmallQLCycleSets(size), " quasilinear cycle sets of size ", size);
  fi;
end);

### This function returns the number of quasilinear cycle sets of size <n>
InstallGlobalFunction(NrSmallQLCycleSets, 
function(size)
  local dir, filename;
  if size <= 11 then
    return QLCS[size].implemented;
  else
    dir := DirectoriesPackageLibrary("YB", "data")[1];
    filename := Filename(dir, Concatenation("QLsize", String(size), ".g"));
    if IsReadableFile(filename) then
      Read(filename);
      return QLCS[size].implemented;
    else
      Error("Quasilinear cycle sets of size ", size, " are not implemented");
    fi;
  fi;
end);

InstallOtherMethod(Socle, "for a quasilinear cycle set", [ IsQLCycleSet ],
function(obj)
  local a, b, l, group, one;
  l := [];
  group := Group(obj!.list);
  one := One(group);
  for a in obj!.list do
    if ForAll(group, b->obj!.matrix[Position(obj!.list, a)][Position(obj!.list, b)] = obj!.matrix[Position(obj!.list, one)][Position(obj!.list, b)]) then
      Add(l, a);
    fi;
  od;
  return l;
end);

InstallOtherMethod(UnderlyingGroup, "for a quasilinear cycle set", [ IsQLCycleSet ],
function(obj)
  return Group(obj!.list);
end);

InstallOtherMethod(UnderlyingCycleSet, "for a quasilinear cycle set", [ IsQLCycleSet ],
function(obj)
  return CycleSet(obj!.matrix);
end);

InstallMethod(QLCycleSetSum, "for a quasilinear cycle set and two elements", [ IsQLCycleSet, IsInt, IsInt ],
function(obj, i, j)
  return Position(obj!.list, obj!.list[i]*obj!.list[j]);
end);

InstallMethod(QLCycleSetInverse, "for a quasilinear cycle set and an element", [ IsQLCycleSet, IsInt ],
function(obj, i)
  return Position(obj!.list, Inverse(obj!.list[i]));
end);



