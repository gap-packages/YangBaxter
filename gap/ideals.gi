# <subset> is a subset of AsList(obj)
is_ideal := function(obj, subset)
  local lst, a, x;

  lst := AsList(obj);

  if Order(Group(List(subset, x->x![1]))) <> Size(subset) then
    return false;
  fi;

  for a in lst do
    for x in subset do
      if not Lambda(a, x) in subset or not a*x*a^-1 in subset or not a+x-a in subset then
        return false;
      fi;
    od;
  od;
  return true;
end;

ideals := function(obj)
  local add, sg, l, subset;
  l := [];
  add := SkewBraceAList(obj);
  for sg in NormalSubgroups(Group(add)) do 
    subset := List(sg, x->SkewBraceElmConstructor(obj, x));
    if is_ideal(obj, subset) then
      Add(l, subset);
    fi;
  od;
  return l;
end;

is_simple := function(obj)
  return Size(ideals(obj))=2;
end;

socle := function(obj)
  local add, l;
  add := SkewBraceAList(obj);
  l := List(Center(Group(add)), x->SkewBraceElmConstructor(obj, x));
  return Filtered(l, a->ForAll(AsList(obj), b->Lambda(a,b)=b));
end;

skewbrace2solution := function(obj)
  local a, b, x, y, u, v, add, set, tmp_r, tmp_l, lperms, rperms;

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

  return Permutations2YB(lperms, rperms); 
end;

yb2permutation := function(obj)
  local perm, x, y, u, v;

  perm := [1..Size(obj)^2];

  for x in [1..Size(obj)] do
    for y in [1..Size(obj)] do
      u := YB_xy(obj, x, y)[1];
      v := YB_xy(obj, x, y)[2];
      perm[x+Size(obj)*y] := u+Size(obj)*v;
    od;
  od;
  return PermList(perm);
end;

inverse_bijective_1cocycle := function(obj)
  local add, mul;
  add := SkewBraceAList(obj);
  mul := SkewBraceMList(obj);
  return MappingByFunction(Domain(AsList(obj)), Domain(mul), x->mul[Position(add, x![1])]);
end;

bijective_1cocycle := function(obj)
  return InverseGeneralMapping(inverse_bijective_1cocycle(obj));  
end;


