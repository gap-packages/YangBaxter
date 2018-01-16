/***
 *
 * NumberOfNCBracesWithAdditiveGroup
 *
 * This function returns the number of left braces with finite additive 
 * group isomorphic to <A>. 
 *  
 ***/
NumberOfNCBracesWithAdditiveGroup := function(A)
  local used, G, f, g, H, p, act, X, XxAut, Y, k;
  
  used := [];
  p := [];
  k := 0;

  G, f, g := Holomorph(A);

  for c in Subgroups(G:OrderEqual:=Order(A), IsRegular:=true) do
      X := Conjugates(G, c`subgroup);

      XxAut := CartesianProduct(X, Stabilizer(G, 1));
      act := map< XxAut -> X | x :-> Conjugate(x[1], x[2]) >;
      Y := GSet(Stabilizer(G,1), X, act);

      k := k + #Orbits(Stabilizer(G, 1), Y);

  end for;
  return k;
end function;

/***
 *
 * NCBracesWithAdditiveGroup
 *
 * This function returns the list of left braces with finite additive 
 * group isomorphic to <A>. 
 *  
 ***/
NCBracesWithAdditiveGroup := function(A)
  local used, G, f, g, H, p;
  
  used := [];
  p := [];

  G, f, g := Holomorph(A);

  for c in Subgroups(G:OrderEqual:=Order(A), IsRegular:=true) do

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
 * AllNCBraces
 * 
 * This function returns the list of left braces of size <n>
 *
 ***/
AllNCBraces := function(n)
  local p, q, t, s, j, total;
  
  t := Cputime();
  p := [];
  j := 0;
  total := #{ x: x in {1..NumberOfSmallGroups(n)} };

  for k in [1..NumberOfSmallGroups(n)] do

    j := j+1;
    printf "id: %o,%o (%o/%o): ", n, k, j, total;

    s := Cputime();
    q := NCBracesWithAdditiveGroup(SmallGroup(n, k));
    if #q ne 0 then
      for x in q do
        Append(~p, x);
      end for;
    end if;
    printf "%o found, %o seconds\n", #q, Cputime(s);
  end for;

  return p, Cputime(t);
end function;

/*** 
 * 
 * NumberOfNCBraces
 * 
 * This function returns the number of left braces of size <n>
 *
 ***/
NumberOfNCBraces := function(n)
  local p, q, t, s, j, total;
  
  t := Cputime();
  j := 0;
  q := 0;
  total := #{ x: x in {1..NumberOfSmallGroups(n)} };

  for k in [1..NumberOfSmallGroups(n)] do

    j := j+1;
    printf "id: %o,%o (%o/%o): ", n, k, j, total;

    s := Cputime();
    p := NumberOfNCBracesWithAdditiveGroup(SmallGroup(n, k));
    q := q + p;
    printf "%o found, %o seconds\n", p, Cputime(s);
  end for;

  return q, Cputime(t);
end function;

