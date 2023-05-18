# <subset> is a subset of AsList(obj)

InstallMethod(IsIdeal, "for a skew brace and a collection", [ IsSkewbrace, IsCollection ], 
function(obj, subset)
  local a, x;

  if IsSkewbrace(subset) then
    if HasParent(subset) and Parent(subset) = obj then
      if HasIsIdealInParent(subset) then
        return IsIdealInParent(subset);
      fi;
    fi;
  fi;

  subset := AsList(subset);

  if Order(Group(List(subset, x->x![1]))) <> Size(subset) then
    # Print("## The subset is not a group!\n");
    return false;
  fi;

  for a in obj do
    for x in subset do
      if not Lambda(a, x) in subset then
        # Print("## The subset is not lambda stable\n");
        return false;
      elif not a*x*a^-1 in subset then
        # Print("## The subset is not normal with respect to *\n");
        return false;
      elif not a+x-a in subset then
        # Print("## The subset is not normal with respect to +\n");
        return false;
      fi;
    od;
  od;
  return true;
end);

InstallMethod(IsLeftIdeal, "for a skew brace and a collection", [ IsSkewbrace, IsCollection ], 
function(obj, subset)
  local a, x;

  if IsSkewbrace(subset) then
    if HasParent(subset) and Parent(subset) = obj then
      if HasIsLeftIdealInParent(subset) then
        return IsLeftIdealInParent(subset);
      fi;
    fi;
  fi;

  subset := AsList(subset);

  if Order(Group(List(subset, x->x![1]))) <> Size(subset) then
    return false;
  fi;

  for a in obj do
    for x in subset do
      if not Lambda(a, x) in subset then
        return false;
      fi;
    od;
  od;
  return true;
end);

InstallMethod(Ideals, "for a skew brace", [ IsSkewbrace ], function(obj)
  local add, sg, l, subset, x, res, tmp;
  l := [];
  add := SkewbraceAList(obj);
  for sg in NormalSubgroups(Group(add)) do 
    subset := List(sg, x->SkewbraceElmConstructor(obj, x));
    if IsIdeal(obj, subset) then
      Add(l, subset);
    fi;
  od;
  res := [];
  for x in l do
    tmp := SubSkewbrace(obj, x);
    SetIsIdealInParent(tmp, true);
    Add(res, tmp);
  od;
  return res;
end);

InstallMethod(LeftIdeals, "for a skew brace", [ IsSkewbrace], function(obj)
  local add, sg, l, subset, x, res, tmp;
  l := [];
  add := SkewbraceAList(obj);
  for sg in AllSubgroups(Group(add)) do 
    subset := List(sg, x->SkewbraceElmConstructor(obj, x));
    if IsLeftIdeal(obj, subset) then
      Add(l, subset);
    fi;
  od;
  res := [];
  for x in l do
    tmp := SubSkewbrace(obj, x);
    SetIsLeftIdealInParent(tmp, true);
    Add(res, tmp);
  od;
  return res;
end);

InstallMethod(StrongLeftIdeals, "for a skew brace", [ IsSkewbrace], function(obj)
  local add, sg, l, subset, x, res, tmp;
  l := [];
  add := SkewbraceAList(obj);
  for sg in NormalSubgroups(Group(add)) do 
    subset := List(sg, x->SkewbraceElmConstructor(obj, x));
    if IsLeftIdeal(obj, subset) then
      Add(l, subset);
    fi;
  od;
  res := [];
  for x in l do
    tmp := SubSkewbrace(obj, x);
    SetIsLeftIdealInParent(tmp, true);
    Add(res, tmp);
  od;
  return res;
end);

InstallGlobalFunction(SubSkewbrace, function(obj, sub)
  local p, res, add, mul, per, fam, gens;

  p := List(sub, y->[y![1], y^InverseBijective1Cocycle(obj)]);

  add := List(p, x->x[1]); 
  per := Sortex(add);
  mul := Permuted(List(p, x->x[2]), per);
 
  fam := ElementsFamily(FamilyObj(obj)); 
  res := Objectify(NewType(CollectionsFamily(fam), IsSkewbrace and IsAttributeStoringRep), rec());

  SetSize(res, Size(add)); 
  SetSkewbraceAList(res, add);
  SetSkewbraceMList(res, mul);

  gens := SmallGeneratingSet(Group(add));
  if gens = [] then
    SetUnderlyingAdditiveGroup(res, Group(()));
  else
    SetUnderlyingAdditiveGroup(res, Group(gens));
  fi;

  gens := SmallGeneratingSet(Group(mul));
  if gens = [] then
    SetUnderlyingMultiplicativeGroup(res, Group(()));
  else
    SetUnderlyingMultiplicativeGroup(res, Group(gens));
  fi;

  SetParent(res, obj);
  return res;

end);

InstallMethod(IsSimpleSkewbrace, "for a skew brace", [ IsSkewbrace ], 
function(obj)
  return Size(Ideals(obj))=2;
end);

InstallOtherMethod(IsSimple, "for a skew brace", [ IsSkewbrace ],
function(obj)
  return IsSimpleSkewbrace(obj);
end);

InstallMethod(Socle, "for a skew brace", [ IsSkewbrace ], function(obj)
  local add, l;
  add := SkewbraceAList(obj);
  l := List(Center(Group(add)), x->SkewbraceElmConstructor(obj, x));
  return AsIdeal(obj, Filtered(l, a->ForAll(AsList(obj), b->Lambda(a,b)=b)));
end);

InstallMethod(Annihilator, "for a skew brace", [ IsSkewbrace], function(obj)
  local mul,soc,ann,tmp;
  mul := UnderlyingMultiplicativeGroup(obj);
  soc := Socle(obj);
  tmp := Intersection(AsList(soc), FromMul2Skewbrace(obj, AsList(Center(mul))));
  ann := SubSkewbrace(obj, tmp);
  SetIsIdealInParent(ann, true);
  return ann;
end);

InstallMethod(AsIdeal, "for a skew brace and a subset of a skew brace", [ IsSkewbrace, IsCollection ], 
function(obj, subset)
  local res;
  if not IsIdeal(obj, AsList(subset)) then
    Error("this is not an ideal,");
  else
    res := SubSkewbrace(obj, subset);
    SetIsIdealInParent(res, true);
    return res;
  fi;
end);

InstallMethod(Quotient, "for two skew braces", [IsSkewbrace, IsSkewbrace], function(obj, ideal)
  local add, mul, bij, idA, idG, fA, fG, r, s, x, a, l;

  if not IsIdeal(obj, AsList(ideal)) then
    Error("this is not an ideal,");
  fi;

  # groups of <obj>
  add := UnderlyingAdditiveGroup(obj);
  mul := UnderlyingMultiplicativeGroup(obj);

  # bijection between <add> and <mul>
  bij := InverseBijective1Cocycle(obj);

  # the additive group of <ideal>
  idA := UnderlyingAdditiveGroup(ideal);
  idG := Group(List(ideal, x->Image(bij, x)));

  # canonical epimorphism from <add> to <idA>
  fA := NaturalHomomorphismByNormalSubgroup(add, idA);
  fG := NaturalHomomorphismByNormalSubgroup(mul, idG);

  # permutation representations of <add> and <mul>
  r := fA*IsomorphismPermGroup(Image(fA));
  s := fG*IsomorphismPermGroup(Image(fG));

  # list to construct the skew brace
  l := [];

  for x in Image(r) do
    a := SkewbraceElm(obj, Representative(PreImagesElm(r, x)));
    Add(l, [x, Image(s, Image(bij, a))]);
  od;

  return Skewbrace(l);
end);

InstallMethod(LeftSeries, "for a skew brace", [IsSkewbrace], function(obj)
  local tmp, old, new, l, done;

  done := false;
  old := ShallowCopy(obj);
  l := [old];

  repeat
    tmp := List(Cartesian(obj, old), x->Star(x[1],x[2]));
    new := SubSkewbrace(obj, List(Group(List(tmp, x->x![1])), y->SkewbraceElmConstructor(obj, y)));

    if Size(new) <> Size(old) then
      Add(l, new);
      SetIsLeftIdealInParent(new, true);
    fi;

    if Size(new)=Size(old) or Size(new)=1 then
      done := true;
    fi;

    old := ShallowCopy(new);

  until done; 
  return l;

end);

InstallMethod(RightSeries, "for a skew brace", [IsSkewbrace], function(obj)
  local tmp, old, new, l, done;

  done := false;
  old := ShallowCopy(obj);
  l := [AsIdeal(obj, AsList(obj))];

  repeat
    tmp := List(Cartesian(old, obj), x->Star(x[1],x[2]));
    new := SubSkewbrace(obj, List(Group(List(tmp, x->x![1])), y->SkewbraceElmConstructor(obj, y)));

    if Size(new) <> Size(old) then
      Add(l, new);
      SetIsIdealInParent(new, true);
    fi;

    if Size(new)=Size(old) or Size(new)=1 then
      done := true;
    fi;

    old := ShallowCopy(new);

  until done; 
  return l;
end);

InstallMethod(IsLeftNilpotent, "for a skew brace", [IsSkewbrace], function(obj)
  return 1 in List(LeftSeries(obj), Size);
end);

InstallMethod(IsRightNilpotent, "for a skew brace", [IsSkewbrace], function(obj)
  return 1 in List(RightSeries(obj), Size);
end);

InstallMethod(SocleSeries, "for a skew brace", [IsSkewbrace], function(obj)
  local l, tmp, old, new, done;

  old := ShallowCopy(obj);
  l := [old];
  done := false;

  repeat
    new := ShallowCopy(Quotient(old, Socle(old)));

    if Size(new) <> Size(old) then
      Add(l, new);
    fi;

    if Size(new)=Size(old) or Size(new)=1 then
      done := true;
    fi;
  
    old := ShallowCopy(new);
  until done; 

  return l;
  
end);

InstallMethod(MultipermutationLevel, "for a skew brace", [IsSkewbrace], function(obj)
  local s;
  s := SocleSeries(obj);
  if 1 in List(s, Size) then
    return Size(s);
  else
    return fail;
  fi;
end);

InstallMethod(IsMultipermutation, "for a skew brace", [IsSkewbrace], function(obj)
  return 1 in List(SocleSeries(obj), Size);
end);

InstallMethod(Fix, "for a skew brace", [IsSkewbrace], function(obj)
  return Filtered(AsList(obj), b->ForAll(AsList(obj), a->Lambda(a,b)=b));
end);

InstallMethod(KernelOfLambda, "for a skew brace", [IsSkewbrace], function(obj)
  return Filtered(AsList(obj), a->ForAll(AsList(obj), b->Lambda(a,b)=b));
end);

InstallMethod(SmoktunowiczSeries, "for a skew brace", [IsSkewbrace, IsInt], function(obj, bound)
  local n,i,s,tmp,new,old,k,done;

  done := false;
  s := [];
  n := 1;

  Add(s, obj);
  
  for k in [1..bound] do

    tmp := [];

    for i in [1..n] do
      Add(tmp, List(Cartesian(s[i], s[n+1-i]), x->Star(x[1],x[2])));
    od;

    old := ShallowCopy(s[n]);
    new := ShallowCopy(SubSkewbrace(obj, List(Group(List(Flat(tmp), x->x![1])), y->SkewbraceElmConstructor(obj, y))));

    if Size(new) = 1 then
      Add(s, new);
      break;
    else
      n := n+1; 
      old := ShallowCopy(new);
      Add(s, new);
    fi;
    
  od;
  return s;
end);


#  local i, n, s, old, tmp, new, done;
#
#  old := ShallowCopy(obj);
#  s := [old];
#  n := 1;
#  done := false;
#
#	repeat 
#		tmp := [];
#		for i in [1..n] do
#			tmp := Concatenation(tmp, List(Cartesian(AsList(s[i]), AsList(s[n+1-i])), x->Star(x[1],x[2])));  
#		od;
#		new := SubSkewbrace(obj, List(Group(List(tmp, x->x![1])), y->SkewbraceElmConstructor(obj, y)));
#
#		if Size(new) <> Size(old) then
#			Add(s, new);
#		fi;
#
#		if Size(new)=Size(old) or Size(new)=1 then
#			done := true;
#		fi;
#
#		old := ShallowCopy(new);
#		n := n+1;
#	until done;
#
#  return s;
#end);

InstallMethod(IsPrimeBrace, "for a skew brace", [IsSkewbrace], function(obj)
  local l, x, y;
  l := List(Ideals(obj), AsList);
  for x in l do
    if Size(x)=1 then
      continue;
    fi;
    for y in l do
      if Size(y) = 1 then
        continue;
      fi;
      if Size(Star(x, y))=1 then
        return false;
      fi;
    od;
  od;
  return true;
end);

InstallMethod(IsPrimeIdeal, "for an ideal of a skew brace", [IsSkewbrace and IsIdealInParent], function(obj)
  return IsPrimeBrace(Quotient(obj!.ParentAttr, obj));
end);

InstallMethod(PrimeIdeals, "for a skew brace", [IsSkewbrace], function(obj)
  return Filtered(Ideals(obj), x->IsPrimeIdeal(x));
end);

InstallMethod(IsSemiprime, "for a skew brace", [IsSkewbrace], function(obj)
  local l, x, y;
  l := List(Ideals(obj), AsList);
  for x in l do
    if Size(x)=1 then
      continue;
    fi;
    if Size(Star(x, x))=1 then
      return false;
    fi;
  od;
  return true;
end);

InstallMethod(IsSemiprimeIdeal, "for an ideal of a skew brace", [IsSkewbrace and IsIdealInParent], function(obj)
  return IsSemiprime(Quotient(obj!.ParentAttr, obj));
end);

InstallMethod(SemiprimeIdeals, "for a skew brace", [IsSkewbrace], function(obj)
  return Filtered(Ideals(obj), x->IsPrimeIdeal(x));
end);

InstallMethod(IntersectionOfTwoIdeals, "for ideals of a skew brace", [IsSkewbrace and IsIdealInParent, IsSkewbrace and IsIdealInParent], function(ideal1, ideal2)
  local obj, tmp;
  if Parent(ideal1) <> Parent(ideal2) then
    Error("The ideals do not belong to the same skew brace,");
  else
    obj := Parent(ideal1);
  fi;
  tmp := SubSkewbrace(obj, Intersection(AsList(ideal1), AsList(ideal2)));
  SetIsIdealInParent(tmp, true);
  return tmp;
end);

InstallMethod(SumOfTwoIdeals, "for ideals of a skew brace", [IsSkewbrace and IsIdealInParent, IsSkewbrace and IsIdealInParent], function(ideal1, ideal2)
  local obj, tmp, new;
  if Parent(ideal1) <> Parent(ideal2) then
    Error("The ideals do not belong to the same skew brace,");
  else
    obj := Parent(ideal1);
  fi;
  tmp := AsList(Group(List(Union(AsList(ideal1), AsList(ideal2)), x->x![1])));
  new := SubSkewbrace(obj, List(tmp, x->SkewbraceElmConstructor(obj, x)));
  SetIsIdealInParent(new, true);
  return new;
end);

InstallMethod(BaerRadical, "for a skew brace", [IsSkewbrace], function(obj)
  return Iterated(PrimeIdeals(obj), IntersectionOfTwoIdeals);
end);

InstallMethod(IsBaer, "for a skew brace", [IsSkewbrace], function(obj)
  return Size(BaerRadical(obj)) = Size(obj);
end);

InstallMethod(WedderburnRadical, "for a skew brace", [IsSkewbrace], function(obj)
  return Iterated(Filtered(Ideals(obj), x->IsLeftNilpotent(x) and IsRightNilpotent(x)), SumOfTwoIdeals);
end);

InstallMethod(IdealGeneratedBy, "for a skew brace and a collection", [ IsSkewbrace, IsCollection ], function(obj,subset)
  local f;
  f := Filtered(Ideals(obj), x->ForAll(subset, y->y in x));
  return Iterated(f, IntersectionOfTwoIdeals);
end);

InstallOtherMethod(IsSolvable, "for a skew brace", [IsSkewbrace], function(obj)
  return 1 in List(SolvableSeries(obj), Size);
end);

InstallMethod(SolvableSeries, "for a skew brace", [IsSkewbrace], function(obj)
  local tmp, old, new, l, done;

  done := false;
  old := ShallowCopy(obj);
  l := [old];

  repeat
    tmp := List(Cartesian(old, old), x->Star(x[1],x[2]));
    new := SubSkewbrace(obj, List(Group(List(tmp, x->x![1])), y->SkewbraceElmConstructor(obj, y)));

    if Size(new) <> Size(old) then
      Add(l, new);
    fi;

    if Size(new)=Size(old) or Size(new)=1 then
      done := true;
    fi;

    old := ShallowCopy(new);

  until done; 
  return l;

end);

InstallMethod(LeftNilpotentIdeals, "for a skew brace", [ IsSkewbrace], function(obj)
  return Filtered(Ideals(obj), IsLeftNilpotent);
end);

InstallMethod(RightNilpotentIdeals, "for a skew brace", [ IsSkewbrace], function(obj)
  return Filtered(Ideals(obj), IsRightNilpotent);
end);

InstallMethod(IsMinimalIdeal, "for an ideal of a skew brace", [ IsSkewbrace and IsIdealInParent ], function(obj)
  if Size(obj) > 1 then
    if Size(Filtered(Ideals(obj), x->IsIdeal(Parent(obj), AsList(x))))=2 then
      return true;
    fi;
  fi;
  return false;
end);

InstallMethod(MinimalIdeals, "for a skew brace", [ IsSkewbrace ], function(obj)
  return Filtered(Ideals(obj), IsMinimalIdeal);
end);

InstallMethod(DerivedSubSkewbrace, "for a skew brace", [ IsSkewbrace ], function(obj)
  local right;
  right := RightSeries(obj);
  if Size(right)=1 then
    return right[1];#AsIdeal(obj, AsList(right[1]));
  else
    return right[2];
  fi;
end);

InstallOtherMethod(IsPerfect, "for a skew brace", [ IsSkewbrace ], function(obj)
  return Size(obj)=Size(DerivedSubSkewbrace(obj));
end);

InstallMethod( IsIdealInParent,
    "for a left ideal",
    true,
    [ IsSkewbrace and IsLeftIdealInParent],
    
    function( I )
      return IsIdeal(ParentAttr(I),I);
end );

InstallMethod( ViewObj,
    "for a left ideal and ideal",
    true,
    [ IsSkewbrace and IsLeftIdealInParent],
    function( I )
      Print( "\>\><left ideal in \>\>" );
      #Distinguishes between parents with(out) parentobject -> solves nesting of "Left ideal in ..."
    if HasIdSkewbrace( ParentAttr(I) ) or HasIdBrace( ParentAttr(I) ) then 
      View( ParentAttr( I ) );
    else
      Print( ParentAttr( I ) );
    fi;
    Print( "\<,\< \>\>(size ", Size( I ), "\<\<\<\<)>" );
    end );

InstallMethod( ViewObj,
    "for a two-sided ideal",
    true,
    [ IsSkewbrace and IsIdealInParent],
    function( I )
      Print( "\>\><ideal in \>\>" );
      #Distinguishes between parents with(out) parentobject -> solves nesting of "Ideal in ;.."
      if HasIdSkewbrace( ParentAttr(I) ) or HasIdBrace( ParentAttr(I) ) then 
        View( ParentAttr( I ) );
      else
        Print( ParentAttr( I ) );
      fi;
      Print( "\<,\< \>\>(size ", Size( I ), "\<\<\<\<)>" );
    end );
