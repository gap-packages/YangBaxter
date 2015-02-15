BindGlobal("YBFamily", NewFamily("YBFamily"));
InstallValue(YBType, NewType(YBFamily, IsYB));

### This function returns the set-theoretic solution given by the permutations <l_actions> and <r_actions>
### <l_action> and <r_action> are matrices!
InstallMethod(YB, "for a two lists of permutations", [ IsList, IsList ], 
function(l_actions, r_actions)
  if Size(r_actions) <> Size(l_actions) then 
    return fail;
  else
    if YB_IsBraidedSet(l_actions, r_actions) then      
      return Objectify(YBType, rec(size := Size(r_actions), r_actions := r_actions, l_actions := l_actions));
    else
      return fail;
    fi;
  fi;
end);


InstallMethod(ViewObj,
  "for a set-theoretical solution",
  [ IsYB ],
  function(obj)
  Print("A set-theoretical solution of size ", obj!.size);
end);

InstallMethod(PrintObj,
  "for a set-theoretical solution",
  [ IsYB ],
  function(obj)
  Print( "YB( ", obj!.size, ", ", obj!.r_actions, ", ", obj!.l_actions, " )" );
end);

InstallOtherMethod(Size, "for a set-theoretical solution", [ IsYB ],
function(obj)
  return obj!.size;
end);

InstallMethod(Permutations2YB, "for a list of permutations", [ IsList, IsList ],
function(lperms, rperms)
  return YB(List(lperms, x->ListPerm(x, Size(lperms))), List(rperms, y->ListPerm(y, Size(lperms))));
end);

InstallMethod(Table2YB, "for a square matrix", [ IsList ],
function(table)
  local ll, rr, x, y, p, n;

  n := Sqrt(Size(table));

  ll := List([1..n], x->[1..n]);
  rr := List([1..n], x->[1..n]);

  for p in table do
    x := p[1][1];
    y := p[1][2];
    ll[x][y] := p[2][1];
    rr[y][x] := p[2][2];
  od;
  return YB(ll, rr);
end);

#### This function returns the table of the solution, which is 
#### the matrix that in the (i,j)-entry has r(i,j)
InstallMethod(Table, "for a set theoretic solution", [ IsYB ], 
function(obj)
  local m, x, y;
  m := NullMat(Size(obj), Size(obj));
  for x in [1..Size(obj)] do
    for y in [1..Size(obj)] do
      m[x][y] := TableYB(obj, x, y);
    od;
  od;
  return m;
end);

### This function returns the set-theoretic solution
### corresponding to the matrix <table> such that the (i,j) entry is r(i,j)
InstallMethod(Table2YB, "for a set theoretic solution", [ IsList ], 
function(table)
  local ll, rr, x, y;

  ll := List([1..Size(table)], x->[1..Size(table)]);
  rr := List([1..Size(table)], x->[1..Size(table)]);

  for x in [1..Size(table)] do
    for y in [1..Size(table)] do
      ll[x][y] := table[x][y][1];
      rr[y][x] := table[x][y][2];
    od;
  od;
  return YB(ll, rr);
end);

#InstallMethod(AffineYB, "for an integer", [ IsInt ],
#function(m)
#  local x, y, ll, rr;
#
#  ll := List([1..m], x->[1..m]);
#  rr := List([1..m], x->[1..m]);
#
#  for x in [1..m] do
#    for y in [1..m] do
#      ll[x][y] := ((y-1) mod m)+1;
#      rr[y][x] := ((x+1) mod m)+1;
#    od;
#  od;
#  return YB(l_actions := ll, r_actions := rr);
#end);


### This function returns true if <obj> is square-free
### A solution r is square-free iff r(x,x)=(x,x) for all x
InstallOtherMethod(IsSquareFree,
  "for a set-theoretical solution",
  [ IsYB ],
  function(obj)
  local x;
  for x in [1..obj!.size] do
    if [obj!.l_actions[x][x], obj!.r_actions[x][x]] <> [x, x] then
      return false;
    fi;
  od;
  return true;
end);

InstallMethod(IYBGroup, "for a set-theoretical solution", [ IsYB ],
function(obj)
  return YBPermutationGroup(obj);
end);

InstallMethod(YBPermutationGroup, "for a set-theoretical solution", [ IsYB ],
function(obj)
  return Group(LeftPermutations(obj));
end);


### This function returns the vector value of <obj> at (<x>,<y>)
InstallMethod(TableYB, "for a set-theoretical solution", [ IsYB, IsInt, IsInt ],
function(obj, x, y)
  return [obj!.l_actions[x][y], obj!.r_actions[y][x]];
end);

### This function returns true if <obj> is involutive
### r is involutive <=> r^2=id
InstallMethod(IsInvolutive, "for a set-theoretical solution", [ IsYB ],
function(obj)
  local x,y,s;
  for x in [1..Size(obj)] do
    for y in [1..Size(obj)] do
      s :=  TableYB(obj, x, y);
      if TableYB(obj, s[1], s[2]) <> [x,y] then
        return false;
      fi;
    od;
  od;
  return true;
end);

#InstallMethod(YBTable, "for a set-theoretical solution", [ IsYB, IsInt, IsInt ],
#function(obj, i, j)
#  return [obj!.l_actions[x][y], obj!.r_actions[y][x]];
#end);


### This function returns true if the maps x->L_x are bijective
### r(x,y)=(L_x(y), R_y(x))
InstallMethod(IsLeftNonDegenerate,
  "for a set-theoretical solution",
  [ IsYB ],
  function(obj)
  local x;
  for x in [1..obj!.size] do
    if PermList(obj!.l_actions[x]) = fail then
      return false;
    fi;
  od;
  return true;
end);

### This function returns true if the maps x->R_x are bijective
### r(x,y)=(L_x(y), R_y(x))
InstallMethod(IsRightNonDegenerate,
  "for a set-theoretical solution",
  [ IsYB ],
  function(obj)
  local x;
  for x in [1..obj!.size] do
    if PermList(obj!.r_actions[x]) = fail then
      return false;
    fi;
  od;
  return true;
end);

### This function returns true if <r> is left and right non-degenerate
InstallMethod(IsNonDegenerate,
  "for a set-theoretical solution",
  [ IsYB ],
  function(obj)
  return (IsLeftNonDegenerate(obj) and IsRightNonDegenerate(obj));
end);

InstallMethod(LeftPermutations,
  "for a set-theoretical solution",
  [ IsYB ],
  function(obj)
  if IsLeftNonDegenerate(obj) then
    return List(obj!.l_actions, x->PermList(x));
  fi;
  return fail;
end);
    
### This function returns the right permutations
InstallMethod(RightPermutations,
  "for a set-theoretical solution",
  [ IsYB ],
  function(obj)
  if IsRightNonDegenerate(obj) then
    return List(obj!.r_actions, x->PermList(x));
  fi;
  return fail;
end);

InstallMethod(YB2CycleSet,
  "for a set-theoretical solution",
  [ IsYB ],
  function(obj)
  local p,m;
  m := [];
  for p in obj!.r_actions do
    Add(m, ListPerm(Inverse(PermList(p)),obj!.size));
  od;
  return CycleSet(m);
end);

InstallGlobalFunction(YB_xy,
  "for a set-theoretical solution",
  function(obj, x, y)
  return [obj!.l_actions[x][y], obj!.r_actions[y][x]];
end);

InstallMethod(Retract,
  "for a set-theoretical solution",
  [ IsYB ],
  function(obj)
  local e, c, s, pairs, x, y, z, ll, rr;

  pairs := [];
  for x in [1..obj!.size] do
    for y in [1..obj!.size] do
      if LeftPermutations(obj)[x] = LeftPermutations(obj)[y] then
        Add(pairs, [x, y]);
      fi;
    od;
  od;

  e := EquivalenceRelationByPairs(Domain([1..obj!.size]), pairs);
  c := EquivalenceClasses(e); 
  s := Size(c);

  ll := List([1..s], x->[1..s]);
  rr := List([1..s], x->[1..s]);

  for x in [1..s] do
    for y in [1..s] do
      z := YB_xy(obj, Representative(c[x]), Representative(c[y]));
      ll[x][y] := Position(c, First(c, u->z[1] in u));
      rr[y][x] := Position(c, First(c, u->z[2] in u));
    od;
  od;
  return YB(ll, rr);
end);

InstallMethod(IsRetractable,
  "for a set-theoretical solution",
  [ IsYB ],
  function(obj)
  local r;
  r := Retract(obj);
  if r!.size = obj!.size then
    return false;
  else
    return true;
  fi;
end);

InstallMethod(IsMultipermutation,
  "for a set-theoretical solution",
  [ IsYB ],
  function(obj)
  if not MultipermutationLevel(obj) = fail then
    return true;
  else
    return false;
  fi;
end);

InstallMethod(MultipermutationLevel,
  "for a set-theoretical solution",
   [ IsYB ],
  function(obj)
  local r,s,l;

  l := 0;
  r := ShallowCopy(obj);

  repeat
    s := ShallowCopy(r);
    r := Retract(s);
    if r!.size <> s!.size then
      l := l+1;
    else
      return fail;
    fi;
  until r!.size = 1;
  return l;
end);

### This function returns the number of involutive set-theoretic solutions of size <n>
InstallGlobalFunction(NrSmallSolutions, 
function(n)
  return NrSmallCycleSets(n);
end);

### This function returns the permutations defining the set-theoretic solution
### These permutations are in the following form: [ left_permutations, right_permutations ]
InstallOtherMethod(Permutations,
  "for set-theoretic solutions", 
  [ IsYB ],
  function(obj)
  return [LeftPermutations(obj), RightPermutations(obj)];
end);


### This function returns the <i>-th involutive set-theoretic solution of size <n>
### These solutions were computed by Etingof, Schedler and Soloviev
InstallGlobalFunction(SmallSolution, 
function(n, i)
  return CycleSet2YB(SmallCycleSet(n, i));
#  local r, data;
#  data := [
#    YB_size1, 
#    YB_size2, 
#    YB_size3, 
#    YB_size4, 
#    YB_size5, 
#    YB_size6, 
#    YB_size7, 
#    YB_size8
#  ];
#  if n in [1..8] then
#    r := data[n][i];
#    return YB(r[1], r[2]);
#  else
#    return fail;
#  fi;
end);

### This function returns the value of <obj> acting on the coordinates (<i>,<j>) of <v> 
InstallGlobalFunction(YB_ij, 
function(l_actions, r_actions, v, i, j)
  local w;
  w := ShallowCopy(v);
  w[i] := l_actions[v[i]][v[j]];
  w[j] := r_actions[v[j]][v[i]];
  return w;
end);

InstallGlobalFunction(YB_IsBraidedSet, 
function(l_actions, r_actions)
  local x, y, z, v;

  if Size(r_actions) <> Size(l_actions) then
    return false;
  fi;

  for x in [1..Size(l_actions)] do
    for y in [1..Size(l_actions)] do
      for z in [1..Size(l_actions)] do
        v := [x,y,z];
        if YB_ij(l_actions, r_actions, YB_ij(l_actions, r_actions, YB_ij(l_actions, r_actions, v, 2, 3), 1, 2), 2, 3) \
          <> YB_ij(l_actions, r_actions, YB_ij(l_actions, r_actions, YB_ij(l_actions, r_actions, v, 1, 2), 2, 3), 1, 2) then
          return false;
        fi;
      od;
    od;
  od;
  return true;
end);

### This function returns true if <subset> is r-invariant
### A subset Y of X is r-invariant if r(YxY) is included in YxY
InstallMethod(IsInvariant, "for a solution and a list", [IsYB, IsList], 
function(obj, subset)
  local x, y, z;
  for x in subset do
    for y in subset do
      z := YB_xy(obj, x, y);
      if not z[1] in subset or not z[2] in subset then
        return false;
      fi;
    od;
  od;
  return true;
end);

### This function returns the restricted solution with respect to <subset>
### If <subset> is not invariant, the function returns fail
InstallMethod(RestrictedSolution, "for a solution and a list", [ IsYB, IsList ],
function(obj, subset)
  local x, y, z, ll, rr;

  if not IsInvariant(obj, subset) then
    return fail;
  fi;

  ll := List([1..Size(subset)], x->[1..Size(subset)]);
  rr := List([1..Size(subset)], x->[1..Size(subset)]);

  for x in [1..Size(subset)] do
    for y in [1..Size(subset)] do
      ll[x][y] := Position(subset, subset[y]^LeftPermutations(obj)[subset[x]]);
      rr[y][x] := Position(subset, subset[x]^RightPermutations(obj)[subset[y]]);
    od;
  od;
  return YB(ll, rr);
end);

### This function returns the structure group of <r>
### Generators: x_1,x_2,...,x_n 
### Relations: x_ix_j=x_kx_l whenever r(i,j)=(k,l)
InstallMethod(StructureGroup, "for a solution", [ IsYB ], 
function(obj)
  local n, f, x, y, rels, i, j;

  n := Size(obj);
  f := FreeGroup(n);
  x := GeneratorsOfGroup(f); 

  rels := [];

  for i in [1..n] do
    for j in [1..n] do
      y := YB_xy(obj, i, j);
      Add(rels, x[i]*x[j]*Inverse(x[y[1]]*x[y[2]]));
    od;
  od;
  return f/rels;
end);

### This function returns the trivial solution over [1..size]
### r is trivial <=> r(x,y)=(y,x)
InstallMethod(TrivialSolution, "for an integer", [ IsInt ],
function(n)
  return YB(List([1..n], x->[1..n]), List([1..n], x->[1..n]));
end);

### This function returns Lyubashenko solution over [1..size] with respect to <f> and <g>
### r is defined as r(x,y)=(f(y),g(x)), where f and g are permutations 
InstallMethod(LyubashenkoSolution, "for an integer and two permutations", [ IsInt, IsPerm, IsPerm ],
function(size, f, g)
  if f*g=g*f then
    return YB(List([1..size], x->ListPerm(g, size)), List([1..size], x->ListPerm(f,size)));
  else
    return fail;
  fi;
end);

