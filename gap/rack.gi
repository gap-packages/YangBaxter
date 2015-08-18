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
    return rec(matrix := matrix, size := Size(matrix));
  else
    Error("This is not a rack");
    return fail;
  fi;
end);

