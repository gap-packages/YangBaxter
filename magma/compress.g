LoadPackage("io");

# This function decompress data compressed with COMPRESS
# The procedure is as follows:
# 1. Create lists <add> and <mul> with the elements of the groups
# 2. Make a sorted list (of permutations) for <add>: a,b,c,...
# 3. Make a sorted list (of permutations) for <mul>: x,y,z,...
# 4. Apply the inverse of <p> to the list a,b,c,...
# 5. Apply the inverse of <q> to the list x,y,z,...
# 5. Return a list of the form [a,x]
DECOMPRESS := function(data)
  local add, per, mul;

  add := List(Group(data.gadd));
  mul := List(Group(data.gmul)); 

  Sortex(add);
  Sortex(mul);

  add := Permuted(add, Inverse(data.p));
  mul := Permuted(mul, Inverse(data.q));

  return List([1..Size(add)], k->[add[k], mul[k]]);
end;

# This function compress the information of a (skew)brace 
# Procedure:
# 1. A (skew)brace is a list [a,x], [b,y], [c,z],... of pairs of permutations
# 2. Order the list [a,b,c,...] and save the permutation <p> needed
# 3. Order the list [x,y,z,...] and save the permutation <q> needed
# 4. Construct small generating sets of <add> and <mul>
# 5. Save these generating sets and the permutations <p> and <q>
COMPRESS := function(data)
  local add, mul, res, p, q;

  add := List(data.perms, x->x[1]);
  mul := List(data.perms, x->x[2]);

  p := Sortex(add);
  q := Sortex(mul);

  add := Permuted(List(data.perms, x->x[1]), p);
  mul := Permuted(List(data.perms, x->x[2]), q);

  res := rec(
    gadd := SmallGeneratingSet(Group(add)),  
    gmul := SmallGeneratingSet(Group(mul)),
    p := p,
    q := q,
  );

  # a naive checking
  if Set(DECOMPRESS(res)) <> Set(data.perms) then
    return fail;
  else
    return res;
  fi;

end;

# This function compress the list of (skew)braces
# The input is NCBRACES[size] or BRACES[size]
# Example: 
# gap> COMPRESS_ALL(NCBRACES[8]);
# gap> COMPRESS_ALL(BRACES[8]);
COMPRESS_ALL := function(lst)
  local res,d;
  res := [];
  for d in lst.brace do
    Add(res, COMPRESS(d));
  od;
  return res;
end;

# This internal function compress the list of skew braces
COMPRESS_SKEWBRACES := function(n)
  Print("NCBRACES[", n, "] := ", COMPRESS_ALL(NCBRACES[n]), ";\n");
  return;
end;

# This internal function compress the list of braces 
COMPRESS_BRACES := function(n)
  Print("BRACES[", n, "] := ", COMPRESS_ALL(BRACES[n]), ";\n");
end;

