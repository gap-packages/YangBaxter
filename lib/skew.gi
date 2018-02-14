### skew braces
BindGlobal("SkewBraceFamily", NewFamily("SkewBraceFamily"));
#InstallValue(SkewBraceType, NewType(SkewBraceFamily, IsSkewBrace));

InstallMethod(SkewBrace, "for a list of pairs of elements in a group", [IsList], 
function(p)
  local add, mul, per, fam, obj, gens;

  ### <add> is (a permutation representation of) the additive group of the brace
  ### <mul> is the multiplicative group of the brace, 

  add := List(p, x->x[1]); 
  per := Sortex(add);
  mul := Permuted(List(p, x->x[2]), per);
 
  fam := NewFamily("SkewBraceElmFamily", IsSkewBraceElm, IsMultiplicativeElementWithInverse and IsAdditiveElementWithInverse);
  fam!.DefaultType := NewType(fam, IsSkewBraceElmRep);

  obj := Objectify(NewType(CollectionsFamily(fam), IsSkewBrace and IsAttributeStoringRep), rec());
  fam!.SkewBrace := obj;

  SetSize(obj, Size(add)); 
  SetSkewBraceAList(obj, add);
  SetSkewBraceMList(obj, mul);

  gens := SmallGeneratingSet(Group(add));
  if gens = [] then
    SetUnderlyingAdditiveGroup(obj, Group(()));
  else
    SetUnderlyingAdditiveGroup(obj, Group(gens));
  fi;

  gens := SmallGeneratingSet(Group(mul));
  if gens = [] then
    SetUnderlyingMultiplicativeGroup(obj, Group(()));
  else
    SetUnderlyingMultiplicativeGroup(obj, Group(gens));
  fi;

  return obj;

end);

# If <obj> is a classical brace, this function returns the id of the skew brace <obj>
InstallMethod(IdBrace, "for a skew brace", [IsSkewBrace], function(obj)
  if not IsClassicalSkewBrace(obj) then
    Error("the skew brace is not classical\n");
  fi;
  return [Size(obj), First([1..NrSmallBraces(Size(obj))], k->IsomorphismSkewBraces(obj, SmallBrace(Size(obj),k)) <> fail)];
end);

# This function returns the id of the skew brace <obj>
InstallMethod(IdSkewBrace, "for a skew brace", [IsSkewBrace], function(obj)
  return [Size(obj), First([1..NrSmallSkewBraces(Size(obj))], k->IsomorphismSkewBraces(obj, SmallSkewBrace(Size(obj),k)) <> fail)];
end);

InstallGlobalFunction(SkewBraceElm, function(obj, x)
  if x in SkewBraceAList(obj) then
    return SkewBraceElmConstructor(obj, x);
  else
    Error("the permutation does not belong to the additive group of the skew brace\n");
  fi;
end);

InstallGlobalFunction(IsSkewBraceHomomorphism, function(f, obj1, obj2)
  local a, b, c, x, y, z;
  for x in obj1 do
    a := x![1];
    for y in obj1 do
      b := y![1]; 
      z := x*y;
      c := z![1];
      if SkewBraceElm(obj2, Image(f, c)) <> SkewBraceElm(obj2, Image(f, a))*SkewBraceElm(obj2, Image(f, b)) then
        return false;
      fi;
    od;
  od;
  return true;
end);

# This function returns an isomorphism between the finite skew braces
# <obj1> and <obj2> 
# If <obj1> and <obj2> are not isomorphic the function returns fail
InstallGlobalFunction(IsomorphismSkewBraces, function(obj1, obj2)
  local f, ab1, ab2;

  if Size(obj1) <> Size(obj2) then
    return fail;
  fi;

  ab1 :=  UnderlyingAdditiveGroup(obj1);
  ab2 :=  UnderlyingAdditiveGroup(obj2);

  for f in AllInjectiveHomomorphisms(ab1, ab2) do
    if IsSkewBraceHomomorphism(f, obj1, obj2) then
      return f;
    fi;
  od;
  return fail;
end);



InstallMethod(SkewBraceElmConstructor, "for a skew brace and an underlying permutation", [ IsSkewBrace, IsPerm ], 
function( obj, perm )
  return Objectify(ElementsFamily(FamilyObj(obj))!.DefaultType, [ perm ]);
end);

InstallMethod( \+,
    "for two elements of a skew brace",
    IsIdenticalObj, [ IsSkewBraceElm, IsSkewBraceElm ],
    function( x, y )
      local fam;
      fam := FamilyObj(x);
      return SkewBraceElmConstructor(fam!.SkewBrace, x![1] * y![1]);
end);

InstallMethod( \=,
    "for two elements of a skew brace",
    IsIdenticalObj, [ IsSkewBraceElm, IsSkewBraceElm ],
    function( x, y )
      return x![1] = y![1];
end);

InstallMethod( \*,
    "for two elements of a skew brace",
    IsIdenticalObj, [ IsSkewBraceElm, IsSkewBraceElm ],
    function( x, y )
      local i, j, obj, mul, add;

      obj := FamilyObj(x)!.SkewBrace;
      add := SkewBraceAList(obj);
      mul := SkewBraceMList(obj);

      i := Position(add, x![1]);
      j := Position(add, y![1]);
      return SkewBraceElmConstructor(obj, add[Position(mul, mul[i]*mul[j])]);
end);

InstallMethod(AdditiveInverseOp, 
    "for an element of a skew brace",
    [ IsSkewBraceElm ],
    function( x )
      return SkewBraceElmConstructor(FamilyObj(x)!.SkewBrace, Inverse(x![1]));
end);

InstallMethod(InverseOp, 
    "for an element of a skew brace",
    [ IsSkewBraceElm ],
    function( x )
      local i, obj, mul, add;

      obj := FamilyObj(x)!.SkewBrace;
      add := SkewBraceAList(obj);
      mul := SkewBraceMList(obj);

      i := Position(add, x![1]);
      return SkewBraceElmConstructor(obj, add[Position(mul, mul[i]^-1)]);
end);

InstallMethod(ZeroOp, 
    "for an element of a skew brace",
    [ IsSkewBraceElm ],
    function( x )
      return SkewBraceElmConstructor(FamilyObj(x)!.SkewBrace, () );
end);

InstallMethod(OneOp, 
    "for an element of a skew brace",
    [ IsSkewBraceElm ],
    function( x )
      return SkewBraceElmConstructor(FamilyObj(x)!.SkewBrace, () );
end);

InstallMethod(ZeroOp, 
    "for an element of a skew brace",
    [ IsSkewBraceElm ],
    function( x )
      return SkewBraceElmConstructor(FamilyObj(x)!.SkewBrace, () );
end);

InstallMethod(ZeroImmutable, 
    "for a skew brace",
    [ IsSkewBrace ],
    function( obj )
      return SkewBraceElmConstructor( obj, () );
end);

InstallMethod(Representative, 
    "for a skew brace",
    [ IsSkewBrace ],
    function( obj )
      return ZeroImmutable( obj );
end);

InstallMethod(Random,
    "for a skew brace",
    [ IsSkewBrace ],
    function( obj )
      return SkewBraceElmConstructor(obj, Random(SkewBraceAList(obj)));
end);

InstallMethod(Enumerator,
    "for a skew brace",
    [ IsSkewBrace ],
    function( obj )
      return AsList(obj);
end);

InstallMethod(AsList, 
    "for a skew brace",
    [ IsSkewBrace ],
    function( obj )
      return List( SkewBraceAList(obj), x->SkewBraceElmConstructor( obj, x ) );
end);

InstallMethod(ViewObj, "for skew braces", [ IsSkewBrace ],
function(obj)
  if HasIdBrace(obj) or IsClassicalSkewBrace(obj) then
    Print("<brace of size ", Size(obj), ">");
  else
    Print("<skew brace of size ", Size(obj), ">");
  fi;
end);

InstallMethod(ViewObj, "for skew brace elements", [ IsSkewBraceElm ],
function(x)
  Print("<", x![1], ">");
end);

InstallMethod(PrintObj, "for skew braces", [ IsSkewBrace ],
function(obj)
  if HasIdBrace(obj) then
    Print( "SmallBrace(", IdBrace(obj)[1], ",", IdBrace(obj)[2], ")");
  elif HasIdSkewBrace(obj) then
    Print( "SmallSkewBrace(", IdSkewBrace(obj)[1], ",", IdSkewBrace(obj)[2], ")");
  else
    Print("<skew brace of size ", Size(obj), ">");
  fi;
end);

#### This function returns true is the <brace> is a two-sided brace
#### This means: (a+b)c+c=ac+bc
#### Equivalent condition: l(a+b)(c)+c=l(a)(c)+l(b)(c), where l(a)(b)=ab-a
InstallMethod(IsTwoSided, "for a skew brace", [IsSkewBrace], 
function(obj)
  local a, b, c;
  for a in AsList(obj) do 
    for b in AsList(obj) do
      for c in AsList(obj) do 
        if (a+b)*c <> a*c-c+b*c then
          return false;
        fi;
      od;
    od;
  od;
  return true;
end);

InstallMethod(SmallSkewBrace, "for a list of integers", [IsInt, IsInt],
function(size, number)
  local obj, known, implemented, dir, filename, add, mul;
  known := IsBound(NCBRACES[size]);
  if not known then
    dir := DirectoriesPackageLibrary("YangBaxter", "data")[1];
    filename := Filename(dir, Concatenation("SBsize", String(size), ".g"));
    if IsReadableFile(filename) then
      Read(filename);
    else
      Error("Skew braces of size ", size, " are not implemented");
    fi;
  fi;
  if number <= Size(NCBRACES[size]) then

    add := List(Group(NCBRACES[size][number].gadd));
    mul := List(Group(NCBRACES[size][number].gmul)); 

    Sortex(add);
    Sortex(mul);

    add := Permuted(add, Inverse(NCBRACES[size][number].p));
    mul := Permuted(mul, Inverse(NCBRACES[size][number].q));

    obj := SkewBrace(List([1..Size(add)], k->[add[k], mul[k]]));
    SetIdSkewBrace( obj, [ size, number ] );
    if size > 15 then
      Unbind(NCBRACES[size]);
    fi;
    return obj;
  else
    Error("there are just ", NrSmallSkewBraces(size), " skew braces of size ", size);
  fi;
end);

InstallMethod(SmallBrace, "for a list of integers", [IsInt, IsInt],
function(size, number)
  local obj, known, implemented, dir, filename, add, mul;
  known := IsBound(BRACES[size]);
  if not known then
    dir := DirectoriesPackageLibrary("YangBaxter", "data")[1];
    filename := Filename(dir, Concatenation("Bsize", String(size), ".g"));
    if IsReadableFile(filename) then
      Read(filename);
    else
      Error("Braces of size ", size, " are not implemented");
    fi;
  fi;
  if number <= Size(BRACES[size]) then

    add := List(Group(BRACES[size][number].gadd));
    mul := List(Group(BRACES[size][number].gmul)); 

    Sortex(add);
    Sortex(mul);

    add := Permuted(add, Inverse(BRACES[size][number].p));
    mul := Permuted(mul, Inverse(BRACES[size][number].q));

    obj := SkewBrace(List([1..Size(add)], k->[add[k], mul[k]]));
    #BRACES[size][number].perms);
    SetIdBrace( obj, [ size, number ] );
    SetIsClassicalSkewBrace(obj, true);
    if size > 15 then
      Unbind(BRACES[size]);
    fi;
    return obj;
  else
    Error("there are just ", NrSmallBraces(size), " braces of size ", size);
  fi;
end);

InstallMethod(IsSkewBraceImplemented, "for an integer", [IsInt],
function(size)
  local known, dir, filename;
  known := IsBound(NCBRACES[size]);
  if not known then
    dir := DirectoriesPackageLibrary("YangBaxter", "data")[1];
    filename := Filename(dir, Concatenation("SBsize", String(size), ".g"));
    if IsReadableFile(filename) then
      return true;
    else
      return false;
    fi;
  fi;
  return true;
end);

InstallMethod(IsBraceImplemented, "for an integer", [IsInt],
function(size)
  local known, implemented, dir, filename;
  known := IsBound(NCBRACES[size]);
  if not known then
    dir := DirectoriesPackageLibrary("YangBaxter", "data")[1];
    filename := Filename(dir, Concatenation("SBsize", String(size), ".g"));
    if IsReadableFile(filename) then
      return true;
    else
      return false;
    fi;
  fi;
  return true;
end);

#### This function returns the number of braces of size <n>
InstallGlobalFunction(NrSmallSkewBraces, 
function(size)
  local dir, filename;
  if size <= 15 then
    return Size(NCBRACES[size]);
  else
    dir := DirectoriesPackageLibrary("YangBaxter", "data")[1];
    filename := Filename(dir, Concatenation("SBsize", String(size), ".g"));
    if IsReadableFile(filename) then
      Read(filename);
      return Size(NCBRACES[size]);
    else
      Error("Skew braces of size ", size, " are not implemented");
    fi;
  fi;
end);

InstallGlobalFunction(NrSmallBraces, 
function(size)
  local dir, filename;
  if size <= 15 then
    return Size(BRACES[size]);
  else
    dir := DirectoriesPackageLibrary("YangBaxter", "data")[1];
    filename := Filename(dir, Concatenation("Bsize", String(size), ".g"));
    if IsReadableFile(filename) then
      Read(filename);
      return Size(BRACES[size]);
    else
      Error("Braces of size ", size, " are not implemented");
    fi;
  fi;
end);

InstallMethod(IsClassicalSkewBrace, "for a skew brace", [ IsSkewBrace ], 
function(obj)
  return IsAbelian(Group(SkewBraceAList(obj)));
end);

InstallMethod(Lambda, 
    "for two elements of a skew brace",
    IsIdenticalObj, [ IsSkewBraceElm, IsSkewBraceElm ],
    function( x, y )
      return -x+x*y;
end);

InstallMethod(InverseLambda, 
    "for two elements of a skew brace",
    IsIdenticalObj, [ IsSkewBraceElm, IsSkewBraceElm ],
    function( x, y )
      return Inverse(x)*(x+y);
end);

InstallMethod(Star, 
    "for two elements of a skew brace",
    IsIdenticalObj, [ IsSkewBraceElm, IsSkewBraceElm ],
    function( x, y )
      return -x+x*y-y;
end);

InstallMethod(Lambda2Permutation, "for an element of a skew brace", [ IsSkewBraceElm ], function(x)
  local obj, lst, p, k;
  obj := FamilyObj(x)!.SkewBrace;
  lst := AsList(obj);

  p := [1..Size(obj)];

  for k in [1..Size(obj)] do
    p[k] := Position(lst, Lambda(x, lst[k]));
  od;

  return PermList(p);
end);

InstallMethod(InverseBijective1Cocycle,
    "for a skew brace", 
    [ IsSkewBrace ],
    function(obj)
      local add, mul;
      add := SkewBraceAList(obj);
      mul := SkewBraceMList(obj);
      return MappingByFunction(Domain(AsList(obj)), Domain(mul), x->mul[Position(add, x![1])]);
end);

InstallMethod(Bijective1Cocycle,
    "for a skew brace", 
    [ IsSkewBrace ],
    function(obj)
       return InverseGeneralMapping(InverseBijective1Cocycle(obj));  
end);

InstallMethod(\in, "for a skew brace and a skew brace element", [ IsSkewBraceElm, IsSkewBrace ], 
function(x, obj)
  return x in AsList(obj);
end);

InstallMethod(SkewBrace2YB, "for a skew brace", [ IsSkewBrace ], function(obj)
  local a, b, x, y, u, v, add, set, tmp_r, tmp_l, lperms, rperms, yb;

  add := AsList(obj);
  set := [1..Size(obj)];

  lperms := [];
  rperms := [];

  for a in AsList(obj) do

    tmp_l := [];
    tmp_r := [];

    for b in AsList(obj) do
      Add(tmp_l, Position(AsList(obj), Lambda(a,b))); 
      Add(tmp_r, Position(AsList(obj), Lambda(a,b)^(-1)*a*b)); 
    od;
    Add(lperms, tmp_l);
    Add(rperms, tmp_r);
  od;

  lperms := List(lperms, PermList);
  rperms := List(TransposedMat(rperms), PermList);

  yb := Permutations2YB(lperms, rperms); 
  SetLabels(yb, AsList(obj));

  return yb;
end);

InstallMethod(Brace2CycleSet, "for a brace", [ IsSkewBrace ], function(obj)
  if not IsClassicalSkewBrace(obj) then
    Error("this is not a classical brace\n");
  fi;
  return YB2CycleSet(SkewBrace2YB(obj));
end);


################################################################################
#
# SelectSmallBraces
# AllSmallBraces
# AllSmallSkewBraces
#
SelectSmallBraces := function( argl, skew )
local sizes, sizepos, size, conditions, name, availabilitycheck, nrfunc, constructfunc, 
  funcs, vals, pos, f, res, i, j, br;

if Length(argl) = 0 then
  Error("You must specify at least one argument\n");
fi;
  
# determine expected position of size(s) in the list of arguments 
if argl[1] = Size then
  sizepos := 2;
else
  sizepos := 1;
fi;

if IsPosInt( argl[ sizepos ] ) then     # only one size is given
  sizes := [ argl[ sizepos ] ];
elif IsList (argl[ sizepos ]) then          # list of sizes is given
  if ForAll( argl[ sizepos ], IsPosInt ) then
    sizes := argl[ sizepos ];
  else
    Error("The ", Ordinal( sizepos ), " argument is not a list of positive integers\n");
  fi;
else
  Error("The ", Ordinal( sizepos ), " argument is not a positive integer or a list\n");
fi;

conditions := argl{[ sizepos+1 .. Length(argl)]};
 
if skew then
  name := "skew braces";
  availabilitycheck := IsSkewBraceImplemented;
  nrfunc := NrSmallSkewBraces;
  constructfunc := SmallSkewBrace;
else
  name := "braces";
  availabilitycheck := IsBraceImplemented;
  nrfunc := NrSmallBraces;
  constructfunc := SmallBrace;
fi;

if not ForAll( sizes, availabilitycheck ) then
  Error( name, " of sizes ", Filtered( sizes, i -> not availabilitycheck(i) ), " are not implemented\n");
fi;

if IsBound(conditions[1]) and not IsFunction( conditions[1] ) then
  Error( "Expected a function, but got ", conditions[1], "\n");
fi;

funcs:=[];
vals:=[];

pos:=1;
while pos <= Length(conditions) do
  if IsFunction( conditions[pos] ) then
    # we have a function
    Add( funcs, conditions[pos] );
    if not IsBound( conditions[pos+1] ) or IsFunction( conditions[pos+1] ) then
      # if next entry is bound and is a function too, default is '[true]'
      Add( vals, [ true ] );
      pos := pos+1;
    else
      # otherwise, use next entry for the list of values
      if IsList( conditions[pos+1] ) then
        Add( vals, conditions[pos+1] );
      else  
        Add( vals, [ conditions[pos+1] ] );
      fi;        
      pos := pos+2;
      # look ahead and check that the value is either 
      # the last or followed by a function
      if IsBound( conditions[pos] ) and not IsFunction( conditions[pos] ) then
        Error( "Expected a function, but got ", conditions[pos], "\n");
      fi;
    fi;
  fi;
od;

res := [];

for size in sizes do
  for i in [1..nrfunc(size)] do
    br := constructfunc(size,i);
    if ForAll( [1..Length(funcs)], j -> funcs[j](br) in vals[j] ) then
      Add( res, br );
    fi;
  od;
od;
  
return res;
end;


InstallGlobalFunction(AllSmallBraces, 
function( arg )
  return SelectSmallBraces( arg, false );
end);


InstallGlobalFunction(AllSmallSkewBraces, 
function( arg )
  return SelectSmallBraces( arg, true );
end);
