### cycle sets

### This function returns the cycle set associated with the action given <matrix>
InstallMethod(CycleSet, "for a matrix", [IsList],
function(matrix)
  local fam, obj;

  if not IS_CYCLESET(matrix) then
    Error("This is not a cycle set");
  fi;

  fam := NewFamily("CycleSetElmFamily", IsCycleSetElm, IsMultiplicativeElement);
  fam!.DefaultType := NewType(fam, IsCycleSetElmRep);

  obj := Objectify(NewType(CollectionsFamily(fam), IsCycleSet and IsAttributeStoringRep), rec());
  fam!.CycleSet := obj;

  SetSize(obj, Size(matrix)); 
  SetMatrixOfCycleSet(obj, matrix);
  SetPermutations(obj, List([1..Size(obj)], x->PermList(matrix[x])));

  return obj;
end);

InstallOtherMethod(Matrix, [ IsCycleSet and HasMatrixOfCycleSet ], MatrixOfCycleSet);

InstallMethod(ViewObj,
  "for a cycle set",
  [ IsCycleSet ],
  function(obj)
  Print("<A cycle set of size ", Size(obj), ">");
end);

InstallMethod(PrintObj,
  "for a cycle set",
  [ IsCycleSet ],
  function(obj)
  if Size(obj) < 6 then
    Print("CycleSet(", MatrixOfCycleSet(obj), ")");
  else
    Print("<A cycle set of size ", Size(obj), ">");
  fi;
end);

#InstallMethod(PrintObj,
#  "for cycle sets", 
#  [ IsCycleSet ],
#  function(obj)
#  Print( "CycleSet( ", obj!.size, ", ", obj!.matrix, " )");
#end);

InstallMethod(Enumerator,
    "for a cycle set", 
    [ IsCycleSet ],
    AsList);

InstallMethod(AsList, 
    "for a cycle set", 
    [ IsCycleSet ],
    function( obj )
  return List([1..Size(obj)], x->CycleSetElmConstructor(obj, x));
end);

InstallMethod( \=,
    "for two elements of a cycle set",
    IsIdenticalObj, [ IsCycleSetElm, IsCycleSetElm ],
    function( x, y )
      return x![1] = y![1];
end);

InstallMethod(ViewObj, "for a cycle set element", [ IsCycleSetElm ],
function(x)
  Print("<", x![1], ">");
end);

InstallMethod(CycleSetElmConstructor, "for a cycle set and an integer", [ IsCycleSet, IsInt ], 
function( obj, x )
  return Objectify(ElementsFamily(FamilyObj(obj))!.DefaultType, [ x ]);
end);

InstallMethod( \*,
    "for two elements of a cycle set",
    IsIdenticalObj, [ IsCycleSetElm, IsCycleSetElm ],
    function( x, y )
    local fam;
    fam := FamilyObj(x);
    return CycleSetElmConstructor(fam!.CycleSet, MatrixOfCycleSet(fam!.CycleSet)[x![1],y![1]]);
end);

InstallMethod(Permutations2CycleSet, "for a list of permutations", [ IsList ], 
function(perms)
  return CycleSet(List(perms, x->ListPerm(x, Size(perms))));
end);

### This function returns the <i>-th cycle set of size <n>
### These solutions were computed by Etingof, Schedler and Soloviev
InstallMethod(SmallCycleSet, "for a list of integers", [ IsInt, IsInt ],
function(n, i)
  local m, data;
  data := [
    CSsize1, 
    CSsize2, 
    CSsize3, 
    CSsize4, 
    CSsize5, 
    CSsize6, 
    CSsize7, 
    CSsize8,
  ];
  if n in [1..8] then
    m := data[n][i];
    return CycleSet(m);
  else
    return fail;
  fi;
end);

### This function returns the number of cycle sets of size <n>
InstallGlobalFunction(NrSmallCycleSets, 
function(n)
  local l;
  l := [ 1, 2, 5, 23, 88, 595, 3456, 34530, 321931 ];
  if n <= 9 then
    return l[n];
  else
    return fail;
  fi;
end);

InstallOtherMethod(IsSquareFree,
  "for cycle sets", 
  [ IsCycleSet ],
  function(obj)
  return ForAll(obj, x -> x*x = x);
end);


InstallMethod(IsIndecomposable,
  "for cycle sets", 
  [ IsCycleSet ],
  function(obj)
    return IsTransitive(IYBGroup(obj), [1..Size(obj)]);
end);

InstallMethod(IsDecomposable,
  "for cycle sets", 
  [ IsCycleSet ],
  function(obj)
    return not IsIndecomposable(obj);
end);


#InstallOtherMethod(Permutations,
#  "for cycle sets",
#  [ IsCycleSet ],
#  function(obj)
#  return List([1..Size(obj!.matrix)], i->PermList(obj!.matrix[i]));
#end);

### This function converts a cycle set into a set-theoretical solution
### EXAMPLE:
### gap> c := CycleSet([[1, 2], [1,2]]);;
### gap> r := CycleSet2YB(c);;
InstallMethod(CycleSet2YB, "for cycle sets", [ IsCycleSet ],
function(obj)
  local mat, perms, lperms, rperms, x, y;
  mat := MatrixOfCycleSet(obj);
  perms := Permutations(obj);
  lperms := NullMat(Size(obj), Size(obj));
  for x in [1..Size(obj)] do
    for y in [1..Size(obj)] do
      lperms[x][y] := mat[x/perms[y],y];
    od;
  od;
  rperms := List(Permutations(obj), x->ListPerm(Inverse(x), Size(obj)));
  return YB(lperms, rperms);
end);

#InstallGlobalFunction(IsCycleSetCocycle, function(obj, cocycle)
#  local x,y,z;
#  for x in [1..Size(obj)] do
#    for y in [1..Size(obj)] do
#      for z in [1..Size(obj)] do
#        if cocycle[x][z]+cocycle[obj!.matrix[x][y]][obj!.matrix[x][z]] <> cocycle[y][z]+cocycle[obj!.matrix[y][x]][obj!.matrix[y][z]] then
#          return false;
#        fi;
#      od;
#    od;
#  od;
#  return true;
#end);
#
#### This function returns a list of 2-cocycles with values in the finite field <field> of the cycle set <obj>
#InstallGlobalFunction(CycleSetCocycles, function(obj, field)
#  local m,t,x,y,z,xy,yx,xz,yz,e2,e3;
#
#  m := NullMat(obj!.size^3, obj!.size^2, field);
#  e3 := EnumeratorOfTuples([1..obj!.size], 3);
#  e2 := EnumeratorOfTuples([1..obj!.size], 2);
#
#  for t in e3 do
#    x := t[1];
#    y := t[2];
#    z := t[3];
#
#    xy := obj!.matrix[x][y];
#    yx := obj!.matrix[y][x];
#    xz := obj!.matrix[x][z];
#    yz := obj!.matrix[y][z];
#
#    m[Position(e3, t)][Position(e2, [x,z])] := m[Position(e3, t)][Position(e2, [x,z])]+One(field);
#    m[Position(e3, t)][Position(e2, [xy,xz])] := m[Position(e3, t)][Position(e2, [xy,xz])]+One(field);
#    m[Position(e3, t)][Position(e2, [y,z])] := m[Position(e3, t)][Position(e2, [y,z])]-One(field);
#    m[Position(e3, t)][Position(e2, [yx,yz])] := m[Position(e3, t)][Position(e2, [yx,yz])]-One(field);
#  od;
#  return List(Elements(VectorSpace(field, NullspaceMat(TransposedMat(m)))), x->list2matrix(x, Size(obj)));
#end);

#### This function returns a list of 2-cocycles with values in <field> of the cycle set <obj>
#### satisfying f(x,x)=0 for all x
#InstallGlobalFunction(CycleSetSquareFreeCocycles, function(obj, field)
#  local m,t,x,y,z,xy,yx,xz,yz,e2,e3;
#
#  if not IsSquareFree(obj) then
#    return fail;
#  fi;
#
#  m := NullMat(obj!.size^3+obj!.size, obj!.size^2, field);
#  e3 := EnumeratorOfTuples([1..obj!.size], 3);
#  e2 := EnumeratorOfTuples([1..obj!.size], 2);
#
#  for t in e3 do
#    x := t[1];
#    y := t[2];
#    z := t[3];
#
#    xy := obj!.matrix[x][y];
#    yx := obj!.matrix[y][x];
#    xz := obj!.matrix[x][z];
#    yz := obj!.matrix[y][z];
#
#    m[Position(e3, t)][Position(e2, [x,z])] := m[Position(e3, t)][Position(e2, [x,z])]+One(field);
#    m[Position(e3, t)][Position(e2, [xy,xz])] := m[Position(e3, t)][Position(e2, [xy,xz])]+One(field);
#    m[Position(e3, t)][Position(e2, [y,z])] := m[Position(e3, t)][Position(e2, [y,z])]-One(field);
#    m[Position(e3, t)][Position(e2, [yx,yz])] := m[Position(e3, t)][Position(e2, [yx,yz])]-One(field);
#  od;
#
#  # For square free extensions
#  for x in [1..obj!.size] do
#    m[obj!.size^3+x][Position(e2,[x,x])] := One(field);
#  od;
#
#  return Elements(VectorSpace(field, NullspaceMat(TransposedMat(m))));
#end);
#
#### This function constructs (abelian) extension of cycle sets
#InstallGlobalFunction(AbelianExtension, function(obj, f, field)
#  local m, a, b, c, u, v, x, y;
#
#  m := NullMat(Size(field)*obj!.size, Size(field)*obj!.size); 
#  c := Cartesian(field, [1..obj!.size]);
#
#  for u in c do
#    for v in c do
#      a := u[1];
#      b := v[1];
#      x := u[2];
#      y := v[2];
#      m[Position(c, u)][Position(c, v)] := Position(c, [b+f[x][y],obj!.matrix[x][y]]);
#    od;
#  od;
#  return CycleSet(m);
#end);
#
#### This function returns true if <cocycle> if a constant cocycle of <obj>
#InstallGlobalFunction(IsConstantCycleSetCocycle, function(obj, cocycle)
#  local x, y, z, xy, xz, yx, yz,e;
#
#  cocycle := Flat(cocycle); 
#  e := EnumeratorOfTuples([1..obj!.size], 2);
#
#  for x in [1..obj!.size] do
#    for y in [1..obj!.size] do
#      xy := obj!.matrix[x][y];
#      yx := obj!.matrix[y][x];
#      for z in [1..obj!.size] do
#        xz := obj!.matrix[x][z];
#        yz := obj!.matrix[y][z];
#        if cocycle[Position(e, [xy,xz])]*cocycle[Position(e, [x,z])] <> cocycle[Position(e, [yx,yz])]*cocycle[Position(e, [y,z])] then 
#          return false;
#        fi;
#      od;
#    od;
#  od;
#  return true;
#end);
#
#InstallGlobalFunction(ConstantCycleSetCocycles, function(obj, set)
#  local l,t;
#  l := [];
#  for t in IteratorOfTuples(SymmetricGroup(Size(set)), Size(obj)^2) do
#    if IsConstantCycleSetCocycle(obj, t) then
#      Add(l, t);
#    fi;
#  od;
#  return l;
#end);
#
#InstallGlobalFunction(ExtensionByConstantCocycle, function(obj, cocycle, set)
#  local m, a, b, c, u, v, x, y, e, xy; 
#
#  cocycle := Flat(cocycle);
#  m := NullMat(Size(set)*obj!.size, Size(set)*obj!.size); 
#  c := Cartesian(set, [1..obj!.size]);
#  e := EnumeratorOfTuples([1..obj!.size], 2);
#
#  for u in c do
#    for v in c do
#      a := u[1];
#      b := v[1];
#      x := u[2];
#      y := v[2];
#      xy := obj!.matrix[x][y];
#      m[Position(c, u)][Position(c, v)] := Position(c, [b^cocycle[Position(e,[x,y])], obj!.matrix[x][y]]);
#    od;
#  od;
#  return CycleSet(m);
#end);
#
#### This very naive function return the list of all dynamical cocycles
#### of the cycle set <obj> with values in <set>
#InstallMethod(DynamicalCocycles, "for a cycle set", [ IsCycleSet, IsList ], 
#function(obj, set)
#  local e,f,t,l;
#  
#  l := [];
#  e := EnumeratorOfCartesianProduct([1..obj!.size], [1..obj!.size], [1..Size(set)]);
#
#  for t in IteratorOfTuples(SymmetricGroup(Size(set)), Size(obj)^2*Size(set)) do
#    f := List([1..Size(t)], k->[e[k], t[k]]);
#    if IsDynamicalCocycle(obj, f, set) then
#      Add(l, f);
#    fi;
#  od;
#  return l;
#end);
#
#InstallGlobalFunction(IsDynamicalCocycle, 
#function(obj, cocycle, set)
#  local X3,S3,v,u,x,y,z,xy,xz,yx,yz,a,b,c,c_xyab,c_xzac,c_yxba,c_yzbc;
#  
#  X3 := Cartesian([1..obj!.size], [1..obj!.size], [1..obj!.size]);
#  S3 := Cartesian(set, set, set);
#
#  for u in X3 do
#    x := u[1];
#    y := u[2];
#    z := u[3];
#    xy := obj!.matrix[x][y];
#    yx := obj!.matrix[y][x];
#    xz := obj!.matrix[x][z];
#    yz := obj!.matrix[y][z];
#    for v in S3 do
#      a := v[1];
#      b := v[2];
#      c := v[3];
#      c_xyab := DynamicalCocycle(cocycle, [x, y, a, b]);
#      c_xzac := DynamicalCocycle(cocycle, [x, z, a, c]);
#      c_yxba := DynamicalCocycle(cocycle, [y, x, b, a]);
#      c_yzbc := DynamicalCocycle(cocycle, [y, z, b, c]);
#      if DynamicalCocycle(cocycle, [xy, xz, c_xyab, c_xzac]) <> DynamicalCocycle(cocycle, [yx, yz, c_yxba, c_yzbc]) then
#        return false;
#      fi;
#    od;
#  od;
#  return true;
#end);
#
#InstallGlobalFunction(DynamicalCocycle, 
#function(cocycle, v)
#  local p, t, xys;
#  t := v[4];
#  xys := v{[1..3]};
#  p := First(cocycle, x->x[1]=xys)[2];
#  return t^p;
#end);
#
#### This function returns the extension of <rack> constructed with the dynamical cocycle <q>
#### (x,s)>(y,t)=(x>y,q_{x,y}(s,t)) for x,y in <rack> and s,t in the image of <q>
#InstallGlobalFunction(DynamicalExtension,
#function(obj, cocycle, set)
#  local m, a, b, c, u, v, x, y; 
#
#  m := NullMat(Size(set)*Size(obj), Size(obj)*Size(set));
#  c := Cartesian(set, [1..Size(obj)]);
#  Display(c);
#  for u in c do
#    for v in c do
#      a := u[1];
#      b := v[1];
#      x := u[2];
#      y := v[2];
#      m[Position(c, u)][Position(c, v)] := Position(c, [DynamicalCocycle(cocycle, [x, y, a, b]), obj!.matrix[x][y]]);
#    od;
#  od;
#  return CycleSet(m);
#end);
#
#### This function returns the fiber of <p> with respect to the epimorphism <map> 
#InstallGlobalFunction(Fiber,
#function(map, p)
#  local k, list;
#  
#  list := [];
#
#  for k in [1..Size(map)] do
#    if map[k] = p then
#      Add(list, k);
#    fi;
#  od;
#  return list;
#end);
#
#### This function returns the dynamical 2-cocycle that allows us to construct
#### the extension <dom> from <codom>
#InstallGlobalFunction(DynamicalCocycleFromCoveringMap,
#function(map, dom, codom)
#  local g, q, p, x, y, s, t; 
#
#  g := List([1..Size(codom)], x->Fiber(map, x));
#  q := [];
#  
#  for x in [1..Size(codom)] do
#    for y in [1..Size(codom)] do
#      for s in [1..Size(g[1])] do
#        p := List([1..Size(g[1])], t->Position(g[y^Inverse(PermList(codom!.matrix[x]))], dom!.matrix[g[x][s]][g[y][t]]));
#        if PermList(p) = fail then
#          return fail;
#        else
#          Add(q, [[x, y, s], PermList(p)]);
#        fi;
#      od;
#    od;
#  od;
#  return q;
#end);
#
InstallGlobalFunction(MakeCycleSetHomorphism,
function(f, dom, codom)
  local c, done , i, j;

  c := true;
  done := true;

  while c = true do
    c := false;
    for i in [1..Size(dom)] do
      for j in [1..Size(dom)] do
        if f[i]*f[j] <> 0 then
          if f[dom!.MatrixOfCycleSet[i][j]] = 0 then
            f[dom!.MatrixOfCycleSet[i][j]] := codom!.MatrixOfCycleSet[f[i]][f[j]];
            c := true;
          elif f[dom!.MatrixOfCycleSet[i][j]] <> 0 and f[dom!.MatrixOfCycleSet[i][j]] <> codom!.MatrixOfCycleSet[f[i]][f[j]] then
            done := false;
            c := false;
          fi;
        fi;
      od;
    od;
    if done = true then
      return f;
    else
      return done;
    fi;
  od;
end);

InstallMethod(Hom, "for cycle sets", [ IsCycleSet, IsCycleSet ],
function(dom, codom)
  local l,o,w,i,j,f,g;
  l := [List([1..Size(dom)], x->0)];
  o := [];
  while not Size(l) = 0 do
    w := l[1];
    Remove(l,1);
    if not 0 in w then
      Add(o,w);
    else
      i := Position(w,0);
      for j in [1..Size(codom)] do
        f := ShallowCopy(w);
        f[i] := j;
        g := MakeCycleSetHomorphism(f, dom, codom);
        if not g = false then
          Add(l,f);
        fi;
      od;
    fi;
  od;
  return o;
end);

#### This function returns an epimorphism from <r> to <s> (if exists) 
InstallMethod(IsQuotient, "for cycle sets", [ IsCycleSet, IsCycleSet ],
function(dom, codom)
  local f, h; 
  h := Hom(dom, codom);
  for f in h do
    if Size(Unique(f))=Size(codom) then
      return f;  
    fi;
  od;
  return false;
end);

#InstallMethod(IsCovering, "for cycle sets", [ IsCycleSet, IsCycleSet ],
#function(dom, codom)
#  local l, f, h; 
#  h := Hom(dom, codom);
#  for f in h do
#    l := Collected(f);
#    if Size(Unique(f))=Size(codom) and ForAll(l, x->x[2]=l[1][2]) then 
#      return f;  
#    fi;
#  od;
#  return false;
#end);

InstallMethod(IsCycleSetHomomorphism, "for cycle sets", [ IsList, IsCycleSet, IsCycleSet ],
function(f, dom, codom)
  local x, y, ldo, lco;

  ldo := AsList(dom);
  lco := AsList(codom);

  for x in ldo do
    for y in ldo do
      if lco[f[Position(ldo, x*y)]] <> lco[f[Position(ldo, x)]]*lco[f[Position(ldo, y)]] then
        return false;
      fi;
    od;
  od;
  return true;
end);

InstallOtherMethod(IsomorphismCycleSets, "for cycle sets", [ IsCycleSet, IsCycleSet ],
function(dom, codom)
  local f;
  for f in SymmetricGroup(Size(dom)) do
    if IsCycleSetHomomorphism(ListPerm(f, Size(dom)), dom, codom) then 
      return ListPerm(f);
    fi;
  od;
  return fail;
end);

#FIXME!
#InstallOtherMethod(IsomorphismCycleSets, "for cycle sets", [ IsCycleSet, IsCycleSet ],
#function(dom, codom)
#  local f;
#  f := IsQuotient(dom, codom);
#  if Size(dom) = Size(codom) and f <> false then
#    return f;
#  else 
#    return fail;
#  fi;
#end);

InstallMethod(IsSimpleCycleSet, "for cycle sets", [ IsCycleSet ],
function(obj)
  local n,k;

  if Size(obj)=1 then
    return false;
  fi;

  if Size(obj)>2 and not IsIndecomposable(obj) then
    return false;
  fi;

  if not IsPrime(Size(obj)) and IsRetractable(CycleSet2YB(obj)) then
    return false;
  fi;

  for n in [2..Size(obj)-1] do
    for k in [1..NrSmallCycleSets(n)] do
      if not IsQuotient(obj, SmallCycleSet(n,k)) = false then
        return false;
      fi;
    od;
  od;
  return true;
end);

#InstallOtherMethod(AutomorphismGroup, "for a cycle set", [ IsCycleSet ],
#function(obj)
#  return Group(List(Filtered(Hom(obj, obj), x->PermList(x) <> fail), PermList));
#end);

InstallMethod(IdCycleSet, "for a cycle set", [ IsCycleSet ],
function(obj)
  local n,k,f;
  if Size(obj) in [1..8] then
    n := Size(obj);
    for k in [1..NrSmallCycleSets(n)] do 
      f := IsomorphismCycleSets(obj, SmallCycleSet(n,k));
      if f <> fail then
        return [n, k];
      fi;
    od;
  fi;
  return fail;
end);

#InstallMethod(SubCycleSet, "for a cycle set", [ IsCycleSet, IsList ], 
#function(obj, subset)
#  local tmp, m, ij, k, l, i, j;
#  tmp := List(subset);
#  for i in tmp do
#    for j in tmp do
#      ij := obj!.matrix[i][j];
#      if not ij in tmp then
#        Add(tmp, ij);
#      fi;
#    od;
#  od;
#  Sort(tmp);
#  m := NullMat(Size(tmp), Size(tmp));
#  for i in [1..Size(tmp)] do
#    for j in [1..Size(tmp)] do
#      m[i][j] := obj!.matrix[tmp[i]][tmp[j]]; 
#    od;
#  od;
#
#  # relabeling
#  for i in [1..Size(m)] do
#    for j in [1..Size(m)] do
#      m[i][j] := Position(tmp, m[i][j]);
#    od;
#  od;
#  return CycleSet(m);
#end);

#InstallMethod(MinimalGenerators, "for a cycle set", [ IsCycleSet ], 
#function(obj)
#  local i, j, c;
#  for i in [1..Size(obj)] do
#    for c in IteratorOfCombinations(obj!.matrix[1], i) do
#      if Size(SubCycleSet(obj, c))=Size(obj) then 
#        return c;
#      fi;
#    od;
#  od;
#  return fail;
#end);

InstallMethod(IYBGroup, "for a cycle set", [ IsCycleSet ],
function(obj)
  return Group(Permutations(obj));
end);

InstallOtherMethod(IsMultipermutation, "for a cycle set", [ IsCycleSet ],
function(obj)
  return IsMultipermutation(CycleSet2YB(obj));
end);

InstallOtherMethod(MultipermutationLevel, "for a cycle set", [ IsCycleSet ],
function(obj)
  return MultipermutationLevel(CycleSet2YB(obj));
end);

### Returns an affine cycle set over ZmodnZ(<n>) - 
### The action is: x.y=-fg^(-1)x+g^(-1)y
### I need: <f>^2=0 and <g> invertible
InstallMethod(AffineCycleSetZmodnZ, "for constructing an affine cycle set", [ IsInt, IsInt, IsInt ], 
function(n, f, g)
  local x, y, e, m;
 
  e := Elements(ZmodnZ(n));
 
  f := f*One(ZmodnZ(n));
  g := g*One(ZmodnZ(n));
 
  if not IsZero(f^2) or Inverse(g)=fail then
    return fail;
  fi;
 
  m := NullMat(n,n);
  for x in e do
    for y in e do
      m[Position(e, x)][Position(e, y)] := Position(e, -f*Inverse(g)*x+Inverse(g)*y);
    od;
  od;
  return CycleSet(m);
end);

#InstallMethod(DehornoyClass, "for a cycle set", [ IsCycleSet ],
#function(obj)
#  return fail;
#end);

#### d_n(x_1,...,x_n)
#InstallMethod(BoundaryMap, "for a cycle set and an integer", [ IsCycleSet, IsInt ],
#function(obj, n)
#  local m, i, t, e1, e2, d1, d2;
#
#  m := NullMat((obj!.size)^(n-1), (obj!.size)^n);
#
#  if n<2 then
#    return m;
#  fi;
#
#  e1 := EnumeratorOfTuples([1..obj!.size], n);
#  e2 := EnumeratorOfTuples([1..obj!.size], n-1);
#
#  for t in e1 do
#    for i in [1..n-1] do
#      d1 := ShallowCopy(t);
#      Remove(d1, i);
#      d2 := List(d1, x->obj!.matrix[t[i]][x]);
#      m[Position(e2, d1)][Position(e1, t)] := m[Position(e2, d1)][Position(e1, t)] + (-1)^i;
#      m[Position(e2, d2)][Position(e1, t)] := m[Position(e2, d2)][Position(e1, t)] - (-1)^i;
#    od;
#  od;
#  return m;
#end);

#InstallMethod(Homology, "for a cycle set and an integer", [ IsCycleSet, IsInt ],
#function(obj, n)
#  local a, b, smith;
#  a := BoundaryMap(obj, n);
#  b := BoundaryMap(obj, n+1);
#  smith := SmithNormalFormIntegerMat(b);
#  return [obj!.size^n-Rank(a)-Rank(smith), Filtered(DiagonalOfMat(smith), x->x>1)];
#end);
#
#InstallMethod(BettiNumbers, "for a cycle set and an integer", [ IsCycleSet, IsInt ],
#function(obj, n)
#  local a, b;
#  a := BoundaryMap(obj, n);
#  b := BoundaryMap(obj, n+1);
#  return obj!.size^n-Rank(a)-Rank(b);
#end);
#
#InstallMethod(Torsion, "for a cycle set and an integer", [ IsCycleSet, IsInt ],
#function(obj, n)
#  local m;
#  m := BoundaryMap(obj, n+1);
#  return Filtered(DiagonalOfMat(SmithNormalFormIntegerMat(m)), x->x>1);
#end);

### returns true if the map f:f(x)=x>x is bijective
InstallOtherMethod(IsNonDegenerate, "for a cycle set", [ IsCycleSet ],
function(obj)
  local mat,i,p;
  mat := MatrixOfCycleSet(obj);
  p := [];
  for i in [1..Size(obj)] do
    p[i] := mat[i,i];
  od;
  if PermList(p) <> fail then
    return true;
  else
    return false;
  fi;
end);

### This function returns the dual of a finite cycle set
### By definition, it is the cycle set (X,o) where 
### (x.y)o(y.x)=x and (xoy).(yox)=x for all x,y
#InstallMethod(Dual, "for a cycle set", [ IsCycleSet ],
#function(obj)
#  return Permutations2CycleSet(List(LPerms(CycleSet2YB(obj)), Inverse));
#end);

#### A cycle set is balanced if x.y=(y*x).y for all x,y
#InstallMethod(IsBalanced, "for a cycle set", [ IsCycleSet ],
#function(obj)
#  local lperms, x, y;
#
#  lperms := NullMat(obj!.size, obj!.size);
#  for x in [1..obj!.size] do
#    for y in [1..obj!.size] do
#      lperms[x][y] := obj!.matrix[x^Inverse(PermList(obj!.matrix[y]))][y];
#    od;
#  od;
#
#  for x in [1..obj!.size] do
#    for y in [1..obj!.size] do
#      if obj!.matrix[x][y] <> lperms[x][y] then
#        return false;
#      fi;
#    od;
#  od;
#  return true;
#end);

# returns the cycle of the action of x containing y
#InstallMethod(CycleSetCycle, "for a cycle set and two integers", [ IsCycleSet, IsInt, IsInt ],
#function(obj, x, y)
#local p;
#  p := Permutations(obj)[x];
#  if not y in MovedPoints(p) then
#    return [y];
#  else
#    return First(Cycles(p, MovedPoints(p)), c->y in c);
#  fi;
#end);

