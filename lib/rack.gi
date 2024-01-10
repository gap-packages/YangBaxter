### racks

InstallMethod(Rack, "for a matrix", [ IsMatrix ], 
function(matrix)
  local fam, obj;
  if not IS_RACK(matrix) then
    Error("this is not a rack");
  fi;

  fam := NewFamily("RackElmFamily", IsRackElm, IsMultiplicativeElement);
  fam!.DefaultType := NewType(fam, IsRackElmRep);

  obj := Objectify(NewType(CollectionsFamily(fam), IsRack and IsAttributeStoringRep), rec());
  fam!.Rack := obj;

  SetSize(obj, Size(matrix)); 
  SetMatrixOfRack(obj, matrix);
  SetPermutations(obj, List([1..Size(obj)], x->PermList(matrix[x])));

  return obj;
end);

InstallOtherMethod(Matrix, [ IsRack and HasMatrixOfRack ], MatrixOfRack);

InstallMethod(ViewObj,
  "for a rack",
  [ IsRack ],
  function(obj)
  Print("<A rack of size ", Size(obj), ">");
end);

InstallMethod(PrintObj,
  "for a rack", 
  [ IsRack ],
  function(obj)
  Print( "Rack( ", MatrixOfRack(obj), " )");
end);

InstallMethod(Enumerator,
    "for a rack", 
    [ IsRack ],
    AsList);

InstallMethod(AsList, 
    "for a rack",
    [ IsRack ],
    function( obj )
  return List([1..Size(obj)], x->RackElmConstructor(obj, x));
end);

InstallMethod( \=,
    "for two elements of a rack",
    IsIdenticalObj, [ IsRackElm, IsRackElm ],
    function( x, y )
      return x![1] = y![1];
end);

InstallMethod(ViewObj, "for a rack element", [ IsRackElm ],
function(x)
  Print("<", x![1], ">");
end);

InstallMethod(RackElmConstructor, "for a rack and an integer", [ IsRack, IsInt ], 
function( obj, x )
  return Objectify(ElementsFamily(FamilyObj(obj))!.DefaultType, [ x ]);
end);

InstallMethod( \*,
    "for two elements of a rack",
    IsIdenticalObj, [ IsRackElm, IsRackElm ],
    function( x, y )
    local fam;
    fam := FamilyObj(x);
    return RackElmConstructor(fam!.Rack, MatrixOfRack(fam!.Rack)[x![1],y![1]]);
end);

InstallMethod(Rack2YB, "for a rack", [ IsRack ], 
function(obj)
  return YB(MatrixOfRack(obj), List([1..Size(obj)], x->[1..Size(obj)]));
end);

