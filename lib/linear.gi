### linear cycle sets
BindGlobal("LinearCycleSetFamily", NewFamily("LinearCycleSetFamily"));
BindGlobal("LinearCycleSetType", NewType(LinearCycleSetFamily, IsLinearCycleSet));

InstallMethod(LinearCycleSet, "for the list of elements of a group and a matrix", [IsList, IsMatrix], 
function(l, m)
  return Objectify(LinearCycleSetType, rec(
    size := Size(l),
    list := l,
    matrix := m
  ));
end);

InstallOtherMethod(Size, "for a linear cycle set", [ IsLinearCycleSet ],
function(obj)
  return obj!.size;
end);

InstallMethod(ViewObj, "for a linear cycle set", [ IsLinearCycleSet ],
function(obj)
  Print("A linear cycle set of size ", obj!.size);
end);

InstallMethod(PrintObj, "for a linear cycle set", [ IsLinearCycleSet ],
function(obj)
  Print("A linear cycle set of size ", obj!.size);
end);

InstallMethod(SmallLinearCycleSet, "for a list of integers", [IsInt, IsInt],
function(size, number)
  return Brace2LinearCycleSet(SmallBrace(size, number));
end);

### This function returns the number of linear cycle sets of size <n>
InstallGlobalFunction(NrSmallLinearCycleSets, 
function(size)
  return NrSmallBraces(size);
end);

InstallOtherMethod(UnderlyingGroup, "for a linear cycle set", [ IsLinearCycleSet ],
function(obj)
  return Group(obj!.list);
end);

InstallOtherMethod(UnderlyingCycleSet, "for a linear cycle set", [ IsLinearCycleSet ],
function(obj)
  return CycleSet(obj!.matrix);
end);

