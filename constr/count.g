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

BracesWithAdditiveGroup:= function(ab)
  local aut, hol, c, s , p, l, f, used, m, max;

  aut := AutomorphismGroup(ab);
  hol := SemidirectProduct(aut, ab);

  l := [];
  used := [];

  for c in ConjugacyClassesSubgroups(hol) do

    if Size(Representative(c)) <> Size(ab) then
      continue;
    fi;
    
    p := ConstructBrace(hol, Representative(c));

    if not p = fail then
      Add(l, p);
    fi;
  od;
  
  return l;
end;

BracesWithAbelianGroupMAXIMAL:= function(ab)
  local aut, hol, c, s, p, l, f, used, m, max;

  aut := AutomorphismGroup(ab);
  hol := SemidirectProduct(aut, ab);

  l := [];
  used := [];
  
  max := ConjugacyClassesMaximalSubgroups(hol);
  Print("There are ", Size(max), " conjugacy classes of maximal subgroups\n");

  for m in max do 
    Print("Checking maximal: ", Position(max, m), " of size ", Size(Representative(m)));

    if Size(Representative(m)) mod Size(ab) <> 0 or IsSolvable(Representative(m)) = false then
      Print(" - Skipped!\n");
      continue;
    else
      Print("\n");
    fi;

    f := Filtered(ConjugacyClassesSubgroups(Representative(m)), x->Size(Representative(x)) = Size(ab));
    for c in f do 
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
od;
Print("--\n");
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

MakeList := function(n, l)
  local k, x;

  Print("## size ", n, "\n");
  Print("BRACES[", n, "] := rec( total := -1, implemented := ", -1, ", size := ", n, ", brace := [] );\n");
  for k in [1..Size(l)] do
    Print("BRACES[", n, "].brace[", k, "] := rec ( size := ", n, ", perms :=\n", l[k] );
    Print("\n);\n\n");
  od;
  return Size(l);
end;

AllSkewbraces := function(size)
  local t, x, l, k, ad;

  k := 1;
  t := 0;

  for ad in AllSmallGroups(Size, size) do
    Print("id: ", IdGroup(ad), "\n");
    l := BracesWithAdditiveGroup(Image(IsomorphismPermGroup(ad)));
    for x in l do
      LogTo();
      LogTo(Concatenation("SBsize", String(size), "_", String(k), ".dat"));
      MakeList(size, l);
      LogTo();
      Print("found ", Size(l), "\n");
      t := t+1;
    od;
    k := k+1;
  od;
  return t;
end;

AllSkewbracesByGroupId := function( id )
  local t, x, l, ad, size, nr;

  size := id[1];
  nr := id[2];
  t := 0;

    ad :=SmallGroup( id );
    Print("id: ", IdGroup(ad), "\n");
    l := BracesWithAdditiveGroup(Image(IsomorphismPermGroup(ad)));
    for x in l do
      LogTo();
      LogTo(Concatenation("SBsize", String(size), "_", String(nr), ".dat"));
      MakeList(size, l);
      LogTo();
      Print("found ", Size(l), "\n");
      t := t+1;
    od;

  return t;
end;


AllBraces := function(size)
  local x, l, ab;

  l := [];

  for ab in AllSmallGroups(Size, size, IsAbelian, true) do
    Print("id: ", IdGroup(ab), "\n");
    for x in BracesWithAdditiveGroup(Image(IsomorphismPermGroup(ab))) do
      Add(l, x);
    od;
  od;
  
  return l;
end;

#IsYB := function(group)
#  local f, s, ab, hol, aut, used;
#  
#  if not IsSolvable(group) then
#    return false;
#  fi;
#
#  for ab in AllSmallGroups(Size, Size(group), IsAbelian, true) do
#
#    aut := AutomorphismGroup(ab);
#    hol := SemidirectProduct(aut, ab);
#
#    used := [];
#
#    f := IsomorphicSubgroups(hol, group);
#
#    if f <> [] then
#      for s in List(f, x->Image(x)) do
#
#        if ForAny(used, x->IsConjugate(Image(Embedding(hol, 1)), s, x)) then
#          continue;
#        fi;
#     
#        Add(used, s);
#
#        if ForAll(Image(Embedding(hol, 2)), a->Number(s, x->x*a in Image(Embedding(hol, 1)))=1) then
#          return true;
#        fi;
#      od;
#    fi;
#  od;
#  return false;
#end;
