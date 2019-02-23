InstallMethod(AdditiveGroupOfRing, "for a ring", [IsRing], function(ring)
  local x, y, l, perms;
  perms := NullMat(Size(ring), Size(ring));
  l := AsList(ring);
  for x in l do
    for y in l do
      perms[Position(l, x)][Position(l, y)] := Position(l, x+y);
    od;
  od;
  return Group(List(perms, PermList));
end);

InstallMethod(IsJacobsonRadical, "for a ring", [IsRing], function(ring)
  local x, rad;
  rad := [];
  for x in ring do
  if not First(ring, y->x+y+x*y=Zero(ring)) = fail then
    Add(rad, x);
  fi;
  od;
  return Size(ring)=Size(rad);
end);

# InstallMethod(AdjointGroup, "for a ring", [IsRing], function(ring)
#   local x, y, l, perms;
#   if not IsJacobsonRadical(ring) then
#     return fail;
#   fi;
#   perms := NullMat(Size(ring), Size(ring));
#   l := AsList(ring);
#   for x in l do
#     for y in l do
#       perms[Position(l, x)][Position(l, y)] := Position(l, x+y+x*y);
#     od;
#   od;
#   return Group(List(perms, PermList));
# end);

# InstallMethod(RadicalRing2Brace, "for a radical ring", [IsRing], function(ring)
#   local add, mul;
#   add := AsList(AdditiveGroupOfRing(ring));
#   mul := AsList(AdjointGroup(ring));
#   return Skewbrace(List([1..Size(ring)], k->[add[k],mul[k]]));
# end);

