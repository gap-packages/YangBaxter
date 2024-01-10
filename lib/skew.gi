### skew braces

InstallMethod(Skewbrace, "for a list of pairs of elements in a group", [IsList], 
function(p)
  local add, mul, per, fam, obj, gens;

  ### <add> is (a permutation representation of) the additive group of the brace
  ### <mul> is the multiplicative group of the brace, 

  add := List(p, x->x[1]); 
  per := Sortex(add);
  mul := Permuted(List(p, x->x[2]), per);
 
  fam := NewFamily("SkewbraceElmFamily", IsSkewbraceElm, IsMultiplicativeElementWithInverse and IsAdditiveElementWithInverse);
  fam!.DefaultType := NewType(fam, IsSkewbraceElmRep);

  obj := Objectify(NewType(CollectionsFamily(fam), IsSkewbrace and IsAttributeStoringRep), rec());
  fam!.Skewbrace := obj;

  SetSize(obj, Size(add)); 
  SetSkewbraceAList(obj, add);
  SetSkewbraceMList(obj, mul);

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
InstallMethod(IdBrace, "for a skew brace", [IsSkewbrace], function(obj)
  if not IsClassical(obj) then
    Error("the skew brace is not classical");
  fi;
  return [Size(obj), First([1..NrSmallBraces(Size(obj))], k->IsomorphismSkewbraces(obj, SmallBrace(Size(obj),k)) <> fail)];
end);

# This function returns the id of the skew brace <obj>
InstallMethod(IdSkewbrace, "for a skew brace", [IsSkewbrace], function(obj)
  return [Size(obj), First([1..NrSmallSkewbraces(Size(obj))], k->IsomorphismSkewbraces(obj, SmallSkewbrace(Size(obj),k)) <> fail)];
end);

InstallMethod(AutomorphismGroup, "for a skew brace", [IsSkewbrace], function(obj)
  local f,s,lst,aut,add,is_homomorphism;

  is_homomorphism := function(f, dom, codom)
    local x,y,fx,fy,fxy;
    for x in dom do
      for y in dom do
        fx := Image(f, FromSkewbrace2Add(dom, [x])[1]);
        fy := Image(f, FromSkewbrace2Add(dom, [y])[1]);
        fxy := Image(f, FromSkewbrace2Add(dom, [x*y])[1]);
        if not FromAdd2Skewbrace(codom, [fx])[1]*FromAdd2Skewbrace(codom, [fy])[1] = FromAdd2Skewbrace(codom, [fxy])[1] then
          return false;
        fi;
      od;
    od;
    return true;
  end;

  lst := [];
  add := UnderlyingAdditiveGroup(obj);
  aut := AutomorphismGroup(add);

  for f in aut do
    if is_homomorphism(f, obj, obj) then
      Add(lst, f);
    fi;
  od;

  s := Subgroup(aut, lst); 
  SetIsAutomorphismGroupOfSkewbrace(s, true);
  SetIsAutomorphismGroup(s, true);
	SetAutomorphismDomain(s, obj);

  return s;
end);

InstallMethod(ImageElm, "for an automorphism and a skew brace element", [ IsGroupHomomorphism, IsSkewbraceElm ], function(f, x)
	local obj;
	obj := FamilyObj(x)!.Skewbrace;
	if Source(f) = UnderlyingAdditiveGroup(obj) then 
		return FromAdd2Skewbrace(obj, [Image(f, x![1])])[1];
  else
		Error(x, " is not in ", obj);
  fi; 
end);

InstallGlobalFunction(SkewbraceElm, function(obj, x)
  if x in SkewbraceAList(obj) then
    return SkewbraceElmConstructor(obj, x);
  else
    Error("the permutation does not belong to the additive group of the skew brace");
  fi;
end);

InstallGlobalFunction(IsSkewbraceHomomorphism, function(f, obj1, obj2)
  local a, b, c, x, y, z;
  for x in obj1 do
    a := x![1];
    for y in obj1 do
      b := y![1]; 
      z := x*y;
      c := z![1];
      if SkewbraceElm(obj2, Image(f, c)) <> SkewbraceElm(obj2, Image(f, a))*SkewbraceElm(obj2, Image(f, b)) then
        return false;
      fi;
    od;
  od;
  return true;
end);

# This function returns an isomorphism between the finite skew braces
# <obj1> and <obj2> 
# If <obj1> and <obj2> are not isomorphic the function returns fail
InstallGlobalFunction(IsomorphismSkewbraces, function(obj1, obj2)
  local f, ab1, ab2;

  if Size(obj1) <> Size(obj2) then
    return fail;
  fi;

  ab1 :=  UnderlyingAdditiveGroup(obj1);
  ab2 :=  UnderlyingAdditiveGroup(obj2);

  for f in AllInjectiveHomomorphisms(ab1, ab2) do
    if IsSkewbraceHomomorphism(f, obj1, obj2) then
      return f;
    fi;
  od;
  return fail;
end);



InstallMethod(SkewbraceElmConstructor, "for a skew brace and an underlying permutation", [ IsSkewbrace, IsPerm ], 
function( obj, perm )
  return Objectify(ElementsFamily(FamilyObj(obj))!.DefaultType, [ perm ]);
end);

InstallMethod( \<,
    "for two elements of a skew brace",
    IsIdenticalObj, [ IsSkewbraceElm, IsSkewbraceElm ],
    function( x, y )
      return x![1] < y![1];
end);

InstallMethod( \+,
    "for two elements of a skew brace",
    IsIdenticalObj, [ IsSkewbraceElm, IsSkewbraceElm ],
    function( x, y )
      local fam;
      fam := FamilyObj(x);
      return SkewbraceElmConstructor(fam!.Skewbrace, x![1] * y![1]);
end);

InstallMethod( \=,
    "for two elements of a skew brace",
    IsIdenticalObj, [ IsSkewbraceElm, IsSkewbraceElm ],
    function( x, y )
      return x![1] = y![1];
end);

InstallMethod( \*,
    "for two elements of a skew brace",
    IsIdenticalObj, [ IsSkewbraceElm, IsSkewbraceElm ],
    function( x, y )
      local i, j, obj, mul, add;

      obj := FamilyObj(x)!.Skewbrace;
      add := SkewbraceAList(obj);
      mul := SkewbraceMList(obj);

      i := Position(add, x![1]);
      j := Position(add, y![1]);
      return SkewbraceElmConstructor(obj, add[Position(mul, mul[i]*mul[j])]);
end);

InstallMethod(AdditiveInverseOp, 
    "for an element of a skew brace",
    [ IsSkewbraceElm ],
    function( x )
      return SkewbraceElmConstructor(FamilyObj(x)!.Skewbrace, Inverse(x![1]));
end);

InstallMethod(InverseOp, 
    "for an element of a skew brace",
    [ IsSkewbraceElm ],
    function( x )
      local i, obj, mul, add;

      obj := FamilyObj(x)!.Skewbrace;
      add := SkewbraceAList(obj);
      mul := SkewbraceMList(obj);

      i := Position(add, x![1]);
      return SkewbraceElmConstructor(obj, add[Position(mul, mul[i]^-1)]);
end);

InstallMethod(ZeroOp, 
    "for an element of a skew brace",
    [ IsSkewbraceElm ],
    function( x )
      return SkewbraceElmConstructor(FamilyObj(x)!.Skewbrace, () );
end);

InstallMethod(OneOp, 
    "for an element of a skew brace",
    [ IsSkewbraceElm ],
    function( x )
      return SkewbraceElmConstructor(FamilyObj(x)!.Skewbrace, () );
end);

InstallMethod(ZeroOp, 
    "for an element of a skew brace",
    [ IsSkewbraceElm ],
    function( x )
      return SkewbraceElmConstructor(FamilyObj(x)!.Skewbrace, () );
end);

InstallMethod(ZeroImmutable, 
    "for a skew brace",
    [ IsSkewbrace ],
    function( obj )
      return SkewbraceElmConstructor( obj, () );
end);

InstallMethod(Representative, 
    "for a skew brace",
    [ IsSkewbrace ],
    function( obj )
      return ZeroImmutable( obj );
end);

InstallMethod(Random,
    "for a skew brace",
    [ IsSkewbrace ],
    function( obj )
      return SkewbraceElmConstructor(obj, Random(SkewbraceAList(obj)));
end);

InstallMethod(Enumerator,
    "for a skew brace",
    [ IsSkewbrace ],
    AsList);

InstallMethod(AsList, 
    "for a skew brace",
    [ IsSkewbrace ],
    function( obj )
      return List( SkewbraceAList(obj), x->SkewbraceElmConstructor( obj, x ) );
end);

InstallMethod(ViewObj, "for skew braces", [ IsSkewbrace ],
function(obj)
  if HasIdBrace(obj) or IsClassical(obj) then
    Print("<brace of size ", Size(obj), ">");
  else
    Print("<skew brace of size ", Size(obj), ">");
  fi;
end);

InstallMethod(ViewObj, "for skew brace elements", [ IsSkewbraceElm ],
function(x)
  Print("<", x![1], ">");
end);

InstallMethod(PrintObj, "for skew braces", [ IsSkewbrace ],
function(obj)
  if HasIdBrace(obj) then
    Print( "SmallBrace(", IdBrace(obj)[1], ",", IdBrace(obj)[2], ")");
  elif HasIdSkewbrace(obj) then
    Print( "SmallSkewbrace(", IdSkewbrace(obj)[1], ",", IdSkewbrace(obj)[2], ")");
  else
    Print("<skew brace of size ", Size(obj), ">");
  fi;
end);

#### This function returns true is the <brace> is a two-sided brace
#### This means: (a+b)c+c=ac+bc
#### Equivalent condition: l(a+b)(c)+c=l(a)(c)+l(b)(c), where l(a)(b)=ab-a
InstallMethod(IsTwoSided, "for a skew brace", [IsSkewbrace], 
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

InstallMethod(SmallSkewbrace, "for a list of integers", [IsInt, IsInt],
function(size, number)
  local obj, known, implemented, dir, filename, add, mul, l, n;

	# If <size> is a prime number, the brace is trivial
  if Gcd(size, Phi(size))=1 then
    if number=1 then
      return TrivialBrace(CyclicGroup(IsPermGroup, size));
    else
      Error("there is only one brace of size ", size);
    fi;
  fi;

 	# If <size> is the square of a prime, braces are known
	if IsPrime(Sqrt(size)) then
		return BraceP2(size, number);
	fi;

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

    obj := Skewbrace(List([1..Size(add)], k->[add[k], mul[k]]));
    SetIdSkewbrace( obj, [ size, number ] );
    if size > 15 then
      Unbind(NCBRACES[size]);
    fi;
    return obj;
  else
    Error("there are just ", NrSmallSkewbraces(size), " skew braces of size ", size);
  fi;
end);

InstallMethod(SmallBrace, "for a list of integers", [IsInt, IsInt],
function(size, number)
  local obj, known, implemented, dir, filename, add, mul, l;

  # Braces of size p are known
  if IsPrime(size) then
    if number=1 then
        l := AsList(CyclicGroup(IsPermGroup, size));
        return Skewbrace(List([1..size], k->[l[k],l[k]]));
    else
        Error("there is only one brace of size ", size);
    fi;
  fi;

	# If <size> is a prime number, the brace is trivial
  # The same if <size> Burnside number
  if Gcd(size, Phi(size))=1 then
    if number=1 then
      return TrivialBrace(CyclicGroup(IsPermGroup, size));
    else
      Error("there is only one brace of size ", size);
    fi;
  fi;

 	# If <size> is the square of a prime, braces are known
	if IsPrime(Sqrt(size)) then
		return BraceP2(size, number);
	fi;

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

    obj := Skewbrace(List([1..Size(add)], k->[add[k], mul[k]]));
    SetIdBrace( obj, [ size, number ] );
    SetIsClassical(obj, true);
    if size > 15 then
      Unbind(BRACES[size]);
    fi;
    return obj;
  else
    Error("there are just ", NrSmallBraces(size), " braces of size ", size);
  fi;
end);

InstallMethod(TrivialSkewbrace, "for a group", [IsGroup],
function(group)
  local l, obj;
 
  if IsPermGroup(group) then
    l := AsList(group);
  else
    l := AsList(Image(IsomorphismPermGroup(group)));
  fi;
  obj := Skewbrace(List([1..Size(group)], k->[l[k],l[k]]));
  SetIsTrivialSkewbrace(obj, true);
  return obj;
end);

InstallMethod(TrivialBrace, "for a group", [IsGroup],
function(group)
  local l;
  if not IsAbelian(group) then
    Error("The group should be abelian");
  else
    return TrivialSkewbrace(group);
  fi;
end);

InstallMethod(IsSkewbraceImplemented, "for an integer", [IsInt],
function(size)
  local known, dir, filename;

  if Gcd(size, Phi(size))=1 or IsPrime(Sqrt(size)) then
    return true;
  fi;

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

  if Gcd(size, Phi(size))=1 or IsPrime(Sqrt(size)) then
    return true;
  fi;

  known := IsBound(BRACES[size]);
  if not known then
    dir := DirectoriesPackageLibrary("YangBaxter", "data")[1];
    filename := Filename(dir, Concatenation("Bsize", String(size), ".g"));
    if IsReadableFile(filename) then
      return true;
    else
      return false;
    fi;
  fi;
  return true;
end);

#### This function returns the number of braces of size <n>
InstallGlobalFunction(NrSmallSkewbraces, 
function(size)
  local dir, filename;

  if Gcd(size, Phi(size))=1 then
    return 1;
  fi;

	if IsPrime(Sqrt(size)) then
		return 4;
	fi;

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

  if Gcd(size, Phi(size))=1 then
    return 1;
  fi;

	if IsPrime(Sqrt(size)) then
		return 4;
	fi;

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

InstallMethod(IsClassical, "for a skew brace", [ IsSkewbrace ], 
function(obj)
  return IsAbelian(Group(SkewbraceAList(obj)));
end);

InstallMethod(IsOfNilpotentType, "for a skew brace", [ IsSkewbrace ], 
function(obj)
  return IsNilpotent(UnderlyingAdditiveGroup(obj));
end);

InstallMethod(IsTrivialSkewbrace, "for a skew brace", [ IsSkewbrace ],
function(obj)
local a,b;
  for a in obj do
    for b in obj do
      if a*b <> a+b then
        return false;
      fi;
    od;
  od;
  return true;
end);

InstallMethod(Lambda, 
    "for two elements of a skew brace",
    IsIdenticalObj, [ IsSkewbraceElm, IsSkewbraceElm ],
    function( x, y )
      return -x+x*y;
end);

InstallMethod(InverseLambda, 
    "for two elements of a skew brace",
    IsIdenticalObj, [ IsSkewbraceElm, IsSkewbraceElm ],
    function( x, y )
      return Inverse(x)*(x+y);
end);

InstallMethod(Star, 
  "for two elements of a skew brace",
  IsIdenticalObj, [ IsSkewbraceElm, IsSkewbraceElm ],
  function( x, y )
    return -x+x*y-y;
end);

InstallMethod(Star,
  "for two subsets of elements of the same skew brace",
  [IsCollection, IsCollection], function(subset1, subset2)
  local elm, gens, group, obj; 
  elm := AsList(subset1)[1];
  obj := FamilyObj(elm)!.Skewbrace;
  gens := List(Cartesian(AsList(subset1), AsList(subset2)), x->Star(x[1], x[2])); 
  group := Group(List(gens, x->x![1]));
  return List(AsList(group), x->SkewbraceElmConstructor(obj, x));
end);

InstallMethod(Lambda2Permutation, "for an element of a skew brace", [ IsSkewbraceElm ], function(x)
  local obj, lst, p, k;
  obj := FamilyObj(x)!.Skewbrace;
  lst := AsList(obj);

  p := [1..Size(obj)];

  for k in [1..Size(obj)] do
    p[k] := Position(lst, Lambda(x, lst[k]));
  od;

  return PermList(p);
end);

InstallMethod(InverseBijective1Cocycle,
    "for a skew brace", 
    [ IsSkewbrace ],
    function(obj)
      local add, mul;
      add := SkewbraceAList(obj);
      mul := SkewbraceMList(obj);
      return MappingByFunction(Domain(AsList(obj)), Domain(mul), x->mul[Position(add, x![1])]);
end);

InstallMethod(Bijective1Cocycle,
    "for a skew brace", 
    [ IsSkewbrace ],
    function(obj)
       return InverseGeneralMapping(InverseBijective1Cocycle(obj));  
end);

InstallMethod(\in, "for a skew brace and a skew brace element", [ IsSkewbraceElm, IsSkewbrace ], 
function(x, obj)
  return x in AsList(obj);
end);

InstallMethod(Brace2YB, "for a skew brace", [ IsSkewbrace ], function(obj)
  return Skewbrace2YB(obj);
end);

InstallMethod(Skewbrace2YB, "for a skew brace", [ IsSkewbrace ], function(obj)
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

InstallMethod(SkewbraceSubset2YB, "for a skew brace and a subset of a skew brace", [ IsSkewbrace, IsCollection ], function(obj, subset)
  local a, b, x, y, u, v, add, set, tmp_r, tmp_l, lperms, rperms, yb;

  set := [1..Size(subset)];

  lperms := [];
  rperms := [];

  for a in AsList(subset) do

    tmp_l := [];
    tmp_r := [];

    for b in AsList(subset) do
      Add(tmp_l, Position(AsList(subset), Lambda(a,b))); 
      Add(tmp_r, Position(AsList(subset), Lambda(a,b)^(-1)*a*b)); 
    od;
    Add(lperms, tmp_l);
    Add(rperms, tmp_r);
  od;

  lperms := List(lperms, PermList);
  rperms := List(TransposedMat(rperms), PermList);

  yb := Permutations2YB(lperms, rperms); 
  SetLabels(yb, AsList(subset));

  return yb;

end);

InstallMethod(Brace2CycleSet, "for a brace", [ IsSkewbrace ], function(obj)
  if not IsClassical(obj) then
    Error("this is not a classical brace");
  fi;
  return YB2CycleSet(Skewbrace2YB(obj));
end);


################################################################################
#
# SelectSmallBraces
# AllSmallBraces
# AllSmallSkewbraces
#
SelectSmallBraces := function( argl, skew )
local sizes, sizepos, size, conditions, name, availabilitycheck, nrfunc, constructfunc, 
  funcs, vals, pos, f, res, i, j, br;

if Length(argl) = 0 then
  Error("You must specify at least one argument");
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
    Error("The ", Ordinal( sizepos ), " argument is not a list of positive integers");
  fi;
else
  Error("The ", Ordinal( sizepos ), " argument is not a positive integer or a list");
fi;

conditions := argl{[ sizepos+1 .. Length(argl)]};
 
if skew then
  name := "skew braces";
  availabilitycheck := IsSkewbraceImplemented;
  nrfunc := NrSmallSkewbraces;
  constructfunc := SmallSkewbrace;
else
  name := "braces";
  availabilitycheck := IsBraceImplemented;
  nrfunc := NrSmallBraces;
  constructfunc := SmallBrace;
fi;

if not ForAll( sizes, availabilitycheck ) then
  Error( name, " of sizes ", Filtered( sizes, i -> not availabilitycheck(i) ), " are not implemented");
fi;

if IsBound(conditions[1]) and not IsFunction( conditions[1] ) then
  Error( "Expected a function, but got ", conditions[1]);
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
        Error( "Expected a function, but got ", conditions[pos]);
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

InstallGlobalFunction(AllSmallSkewbraces, 
function( arg )
  return SelectSmallBraces( arg, true );
end);

# The function transform a list of element of the
# multiplicative group of a skew brace into the additiv
# group
InstallGlobalFunction(FromMul2Add, function(obj, subset)
  local p;
  p := Bijective1Cocycle(obj);
  return List(List(subset, x->x^p), y->y![1]);
end);

InstallGlobalFunction(FromAdd2Mul, function(obj, subset)
  local q;
  q := InverseBijective1Cocycle(obj);
  return List(List(subset, x->SkewbraceElmConstructor(obj, x)), y->y^q);
end);

InstallGlobalFunction(FromSkewbrace2Add, function(obj, subset)
  return List(subset, x->x![1]);
end);

InstallGlobalFunction(FromSkewbrace2Mul, function(obj, subset)
  return FromAdd2Mul(obj, FromSkewbrace2Add(obj, subset));
end);

InstallGlobalFunction(FromAdd2Skewbrace, function(obj, subset)
  return List(subset, x->SkewbraceElmConstructor(obj, x));
end);

InstallGlobalFunction(FromMul2Skewbrace, function(obj, subset)
  return FromAdd2Skewbrace(obj, FromMul2Add(obj, subset));
end);

InstallGlobalFunction(BraceP2, function(size, number)
  local l, i, j, p, q, x, y, u, v, add, mul, tmp;

  add := NullMat(size,size);
  mul := NullMat(size,size);

  if number = 1 then
    return TrivialBrace(CyclicGroup(IsPermGroup, size));
  elif number = 2 then
    l := AsList(ZmodnZ(size));
    for i in [1..size] do
      x := l[i];
      for j in [1..size] do
        y := l[j];
        add[i][j] := Position(l, x+y);
        mul[i][j] := Position(l, x+y+Sqrt(size)*x*y);
      od;
    od;

    p := List(add, PermList);
    q := List(mul, PermList);

    return Skewbrace(List([1..size], k->[p[k],q[k]]));
  elif number=3 then
    return TrivialBrace(ElementaryAbelianGroup(IsPermGroup, size));
  elif number=4 then

    tmp := AsList(ZmodnZ(Sqrt(size))); 
    l := AsList(Cartesian(tmp,tmp));

    for i in [1..size] do
      for j in [1..size] do

        x := l[i][1];
        y := l[i][2];
        u := l[j][1];
        v := l[j][2];

        add[Position(l,[x,y])][Position(l,[u,v])] := Position(l,[x+u,y+v]);
        mul[Position(l,[x,y])][Position(l,[u,v])] := Position(l,[x+u+y*v,y+v]);
      od;
    od;

    p := List(add, PermList);
    q := List(mul, PermList);

    return Skewbrace(List([1..size], k->[p[k],q[k]]));
  else
    Error("there are four braces of size ", size);
  fi;
end); 

InstallMethod(DirectProductSkewbraces, "for two skew braces", [IsSkewbrace, IsSkewbrace], function(obj1, obj2)
  local l,u,v,a,b,c,d,add,mul;

  l := List(Cartesian(obj1,obj2), u->[u]);

  add := AsSet(DirectProduct(UnderlyingAdditiveGroup(obj1),UnderlyingAdditiveGroup(obj2)));
  mul := NullMat(Size(l),Size(l));

  for u in l do
  	a := u[1];
    for v in l do
    	b := v[1];
      c := [a[1]*b[1],a[2]*b[2]];
      mul[Position(l,v)][Position(l,u)] := Position(l,[c]);
    od;
  od;

  mul := List(mul, PermList);
  return Skewbrace(List([1..Size(l)], x->[add[x],mul[x]]));
end);

InstallMethod( DirectProductOp,
    "for a list of skew braces, and a skew brace",
    [ IsList, IsSkewbrace ], 0,
    function( braces, b )

    local new, old, i;

    # Check the arguments.
    if not ForAll( braces, IsSkewbrace ) then
      TryNextMethod();
    fi;

    old := braces[1];

    for i in [ 2 .. Length(braces) ] do
      new := DirectProductSkewbraces(old,braces[i]);
      old := new;
    od;

    return old;

end);

InstallMethod(\/, "for a semigroup and an ideal",
[IsSkewbrace, IsSkewbrace and IsIdealInParent],
function(obj, ideal)
  return Quotient(obj,ideal);
end);

InstallMethod(IsBiSkewbrace, "for a skew brace", [ IsSkewbrace ],
function(obj)
  local a,b,c;
  for a in obj do
    for b in obj do
      for c in obj do
        if not a+(b*c)=(a+b)*Inverse(a)*(a+c) then
          return false;
        fi;
      od;
    od;
  od;
  return true;
end);

# returns all group homomorphism from the multiplicative group
# of <obj2> to the skew brace automorphism group of <obj1>
InstallMethod(SkewbraceActions, "for two skew braces", [ IsSkewbrace, IsSkewbrace ], 
function(obj2, obj1)
  return AllHomomorphisms(UnderlyingMultiplicativeGroup(obj2), AsGroup(AutomorphismGroup(obj1)));
end);

InstallMethod(EvaluateSkewbraceAction, "for two skew braces elements and a map", [ IsSkewbraceElm, IsSkewbraceElm, IsGeneralMapping ], 
function(b, a, f)
  local x, A, B;

  A := FamilyObj(a)!.Skewbrace;
  B := FamilyObj(b)!.Skewbrace;

  # WARNING: The skew brace automorphism group acts on the right!
  b := FromSkewbrace2Mul(B, [b])[1];
  x := Image(Inverse(Image(f, b)), a![1]);

  return FromAdd2Skewbrace(A, [x])[1];
end);

InstallMethod(SemidirectProduct, "for two skew braces and a map", [ IsSkewbrace, IsSkewbrace, IsGeneralMapping ], 
function(obj1, obj2, sigma)
  local l,u,v,a,b,c,d,add,mul;

	l := List(Cartesian(obj1,obj2), u->[u]);

	mul := NullMat(Size(l),Size(l));
	add := NullMat(Size(l),Size(l));

  # WARNING: The skew brace automorphism group acts on the right!
	for u in l do
		a := u[1];
		for v in l do
			b := v[1];
     c := [a[1]*EvaluateSkewbraceAction(a[2],b[1],sigma),a[2]*b[2]];
			mul[Position(l,v)][Position(l,u)] := Position(l,[c]);
			add[Position(l,v)][Position(l,u)] := Position(l,[[a[1]+b[1],a[2]+b[2]]]);
		od;
	od;

	mul := List(mul, PermList);
	add := List(add, PermList);

	return Skewbrace(List([1..Size(l)], x->[add[x],mul[x]]));

end);



