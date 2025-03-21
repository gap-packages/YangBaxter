IsRegularSubgroup := function( HolA, H )
local A, a, count, h, f, x;
A := Image( Embedding( HolA, 2 ) );
for a in A do
  count:=0;
  for h in H do
    # h=(f,x) as an element of the semidirect product.
    # We can do f := h^Projection(HolA);
    # But how to find x?
    # Why the line below is equivalent to IsOne(x*Image(f,a)) where h=(f,x) ?
    if h * a in Image( Embedding(HolA, 1) ) then
      # note that Image( Embedding(HolA, 1) ) is AutG as a subgroup of HolA
      # h*a  = (f,x)(1,a) = (f, xf(a)) is in AutG iff xf(a)=1
      count := count+1;
    fi;
    if count > 1 then
      return false;
    fi;  
  od;
  if count = 0 then 
    return false;
  fi;  
od;
return true;
end;


NrBracesOverGroup := function( G )

local nr, HolA, AutA, A, phi, PermHolA, PermAutA, PermA,
ccn, flat, orbs, orb, rep, a, fx;

if not IsAbelian( G ) then
  Error("The group G must be abelian!\n");
fi;

nr:=0;

HolA := SemidirectProduct( AutomorphismGroup(G), G );
AutA := Image( Embedding( HolA, 1 ) );
A    := Image( Embedding( HolA, 2 ) );

phi      := IsomorphismPermGroup( HolA );
PermHolA := Image( phi);
PermAutA := Image( phi, AutA );
PermA    := Image( phi,A );
  
ccn:=Filtered(ConjugacyClassesSubgroups( PermHolA ), c -> Size(Representative(c)) = Size( A ) );
  
flat:=Concatenation(List(ccn,AsList));
  
orbs := Orbits( PermAutA, flat );
  
for orb in orbs do
  for rep in orb do
     if rep in flat and IsRegularSubgroup( HolA, PreImage( phi, rep ) ) then
        nr := nr + 1;
     fi;
     break;
   od;
od;

return nr;

end;


NrBracesFromScratch:=function(n)
return Sum( List( AllSmallGroups(n, IsAbelian), NrBracesOverGroup ) );
end;
