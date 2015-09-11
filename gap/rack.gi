### racks
BindGlobal("RackFamily", NewFamily("RackFamily"));
InstallValue(RackType, NewType(RackFamily, IsRack));

InstallGlobalFunction(IsRackMatrix, 
function( matrix )
  local i, j, k;
  for i in [1..Size(matrix)] do
    for j in [1..Size(matrix)] do
      for k in [1..Size(matrix)] do
        if matrix[i][matrix[j][k]] <> matrix[matrix[i][j]][matrix[i][k]] then
          return false;
        fi;
      od;
    od;
  od;
  for i in [1..Size(matrix)] do
    if PermList(matrix[i]) = fail then
      return false;
    fi;
  od;
  return true;
end);

InstallMethod(Rack, "for a matrix", [ IsMatrix ], 
function(matrix)
  if IsRackMatrix(matrix) = true then
    return Objectify(RackType, rec(matrix := matrix, size := Size(matrix)));
  else
    Error("This is not a rack");
    return fail;
  fi;
end);

InstallMethod(ViewObj,
  "for a rack",
  [ IsRack ],
  function(obj)
  Print("A rack of size ", obj!.size);
end);

InstallMethod(PrintObj,
  "for a rack", 
  [ IsRack ],
  function(obj)
  Print( "Rack( ", obj!.size, ", ", obj!.matrix, " )");
end);

InstallOtherMethod(Size, "for a rack", [ IsRack ],
function(obj)
  return obj!.size;
end);

InstallMethod(Permutations, "for a rack", [ IsRack ],
function(obj)
  return List([1..Size(obj)], x->PermList(obj!.matrix[x]));
end);

InstallMethod(Rack2YB, "for a rack", [ IsRack ], 
function(obj)
  return YB(obj!.matrix, List([1..Size(obj)], x->[1..Size(obj)]));
end);

