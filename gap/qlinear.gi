### quasilinear cycle sets
BindGlobal("QLCycleSetFamily", NewFamily("QLCycleSetFamily"));
InstallValue(QLCycleSetType, NewType(QLCycleSetFamily, IsQLCycleSet));

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
