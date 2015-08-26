/***
 *
 * BracesWithAbelianGroup
 *
 * This function returns the list of left braces with finite additive 
 * group isomorphic to <A>. 
 *  
 ***/
BracesWithAbelianGroup := function(A)
  local used, G, f, g, H, p;
  
  used := [];
  p := [];

  if not IsAbelian(A) then
    return p;
  end if;

  G, f, g := Holomorph(A);

  for c in Subgroups(G:OrderEqual:=Order(A), IsSolvable:=true, IsRegular:=true) do

    for H in Conjugates(G, c`subgroup) do

      if forall{ x : x in used | IsConjugate(Stabilizer(G, 1), H, x) eq false} then

        Append(~used, H);
        Append(~p, [ [a,h]: a in Image(f), h in H | a*h in Stabilizer(G, 1) ]);

      end if;
    end for;
  end for;
  return p;
  end function;

/*** 
 * 
 * AllBraces
 * 
 * This function returns the list of left braces of size <n>
 *
 ***/
AllBraces := function(n)
  local p, q, t, s, j, total;
  
  t := Cputime();
  p := [];
  j := 0;
  total := #{ x: x in {1..NumberOfSmallGroups(n)} | IsAbelian(SmallGroup(n,x)) };

  for k in [1..NumberOfSmallGroups(n)] do

    if not IsAbelian(SmallGroup(n,k)) then
      continue;
    end if;

    j := j+1;
    printf "id: %o,%o (%o/%o): ", n, k, j, total;

    s := Cputime();
    q := BracesWithAbelianGroup(SmallGroup(n,k));
    if #q ne 0 then
      for x in q do
        Append(~p, x);
      end for;
    end if;
    printf "%o found, %o seconds\n", #q, Cputime(s);
  end for;

  return p, Cputime(t);
end function;



