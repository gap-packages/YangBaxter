ConstructBrace := function(hol, subgroup)
  local ab, p, f, g, a, b;

  ab := Image(Embedding(hol, 2));

  p := [];
  f := IsomorphismPermGroup(ab);
  g := IsomorphismPermGroup(subgroup);

  for a in ab do
    if Number(subgroup, x->x*a in Image(Embedding(hol, 1))) <> 1 then
      return fail;
    else
      Add(p, [Image(f,a), Image(g, First(subgroup, x->x*a in Image(Embedding(hol, 1))))]);
    fi;
  od;

  return p;
end;

Brace := function(p)
  local ab, gr;

  ab := Group(List(p, x->x[1]));
  gr := Group(List(p, x->x[2]));

  return rec(
    size := Size(ab),
    ab := ab,
    gr := gr, 
    p := MappingByFunction(ab, gr, x->First(p, y->IsOne(y[1]*Inverse(x)))[2]),
  );
end;

BraceSum := function(brace, a, b)
  return a*b;
end;

## This function returns a*b, where <a> and <b> are elements of the abelian group of the <brace>
BraceProduct := function(brace, a, b)
  return PreImageElm(brace.p, Image(brace.p, b)*Image(brace.p, a));
end;

BracesWithAbelianGroup := function(ab)
  local aut, hol, c, s, p, l, f, used;

  aut := AutomorphismGroup(ab);
  hol := SemidirectProduct(aut, ab);

  l := [];
  used := [];
  
  f := Filtered(ConjugacyClassesSubgroups(hol), x->Size(Representative(x))=Size(ab));
  for c in Filtered(f, x->IsSolvable(Representative(x))) do
    for s in c do

      if ForAny(used, x->IsConjugate(Image(Embedding(hol, 1)), s, x)) then
        continue;
      fi;
     
      Add(used, s);
      p := ConstructBrace(hol, s);

      if not p = fail then
        Add(l, p);
      fi;
    od;
  od;
  return l;
end;

BracesWithAbelianGroup2 := function(ab)
  local gr, aut, hol, c, s, p, l, f, used;

  aut := AutomorphismGroup(ab);
  hol := SemidirectProduct(aut, ab);

  l := [];
  used := [];
  
  for gr in AllSmallGroups(Size, Size(ab), IsSolvable, true) do
    f := List(IsomorphicSubgroups(hol, gr), x->Image(x));

    for s in f do

      if ForAny(used, x->IsConjugate(Image(Embedding(hol, 1)), s, x)) then
        continue;
      fi;
     
      Add(used, s);
      p := ConstructBrace(hol, s);

      if not p = fail then
        Add(l, p);
      fi;
    od;
  od;
  return l;
end;


AllBraces := function(size)
  local x, l, ab;

  l := [];

  for ab in AllSmallGroups(Size, size, IsAbelian, true) do
    for x in BracesWithAbelianGroup(ab) do
      Add(l, x);
    od;
  od;
  
  return l;
end;

check := function(brace)
  local a, b, c;
  for a in brace.ab do
    for b in brace.ab do
      for c in brace.ab do
        if BraceSum(brace, a, BraceProduct(brace, a, BraceSum(brace, b, c))) <> BraceSum(brace, BraceProduct(brace, a, b), BraceProduct(brace, a, c)) then
          return false;
        fi;
      od;
    od;
  od;
  return true;
end;

MakeList := function(sizes)
  local k, n, l, x;

  for n in sizes do
    l := AllBraces(n);
    Print("## size ", n, "\n");
    Print("BRACES[", n, "] := rec( total := -1, implemented := ", Size(l), ", size := ", n, ", brace := [] );\n");
    for k in [1..Size(l)] do
      Print("BRACES[", n, "].brace[", k, "] := rec ( size := ", n, ", perms :=\n", l[k] );
      Print("\n);\n\n");
    od;
  od;
  return Size(l);
end;

IsYB := function(group)
  local f, s, ab, hol, aut, used;
  
  if not IsSolvable(group) then
    return false;
  fi;

  for ab in AllSmallGroups(Size, Size(group), IsAbelian, true) do

    aut := AutomorphismGroup(ab);
    hol := SemidirectProduct(aut, ab);

    used := [];

    f := IsomorphicSubgroups(hol, group);

    if f <> [] then
      for s in List(f, x->Image(x)) do

        if ForAny(used, x->IsConjugate(Image(Embedding(hol, 1)), s, x)) then
          continue;
        fi;
     
        Add(used, s);

        if ForAll(Image(Embedding(hol, 2)), a->Number(s, x->x*a in Image(Embedding(hol, 1)))=1) then
          return true;
        fi;
      od;
    fi;
  od;
  return false;
end;
