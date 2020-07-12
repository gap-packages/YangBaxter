# This function checks the compatibility condition
# in a skew brace: 
# a(b+c)=ab-a+ac for all a,b,c 
# It works for braces and skew braces!
InstallGlobalFunction(IS_BRACE,  function(obj)
  local a,b,c;
  for a in obj do
    for b in obj do
      for c in obj do
        if a*(b+c) <> a*b-a+a*c then
          return false;
        fi;
      od;
    od;
  od;
  return true;
end);

InstallGlobalFunction(IS_CYCLESET, function(m)
  local x, y, z, xy, xz, yx, yz, size;

  size := Size(m);

  ### Check bijectivity
  if fail in List([1..size], i->PermList(m[i])) then
    return false;
  fi;

  ### Check (xy)(xz)=(yx)(yz)
  for x in [1..size] do
    for y in [1..size] do
      xy := m[x][y];
      yx := m[y][x];
      for z in [1..size] do
        xz := m[x][z];
        yz := m[y][z];
        if m[xy][xz] <> m[yx][yz] then
          return false;
        fi;
      od;
    od;
  od;
  return true;
end);

InstallGlobalFunction(IS_RACK, 
function( m )
  local i, j, k;
  for i in [1..Size(m)] do
    for j in [1..Size(m)] do
      for k in [1..Size(m)] do
        if m[i][m[j][k]] <> m[m[i][j]][m[i][k]] then
          return false;
        fi;
      od;
    od;
  od;
  for i in [1..Size(m)] do
    if PermList(m[i]) = fail then
      return false;
    fi;
  od;
  return true;
end);

InstallGlobalFunction(IS_YB, function(l, r)
  local x, y, z, v;

  if Size(r) <> Size(l) then
    return false;
  fi;

  for x in [1..Size(l)] do
    for y in [1..Size(l)] do
      for z in [1..Size(l)] do
        v := [x,y,z];
        if YB_ij(l, r, YB_ij(l, r, YB_ij(l, r, v, 2, 3), 1, 2), 2, 3) \
          <> YB_ij(l, r, YB_ij(l, r, YB_ij(l, r, v, 1, 2), 2, 3), 1, 2) then
          return false;
        fi;
      od;
    od;
  od;
  return true;
end);

### This function returns the value of <obj> acting on the coordinates (<i>,<j>) of <v> 
InstallGlobalFunction(YB_ij, 
function(l, r, v, i, j)
  local w;
  w := ShallowCopy(v);
  w[i] := l[v[i]][v[j]];
  w[j] := r[v[j]][v[i]];
  return w;
end);



