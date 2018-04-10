# <subset> is a subset of AsList(obj)
InstallMethod(IsIdeal, "for a skew brace and a collection", [ IsSkewBrace, IsCollection ], 
function(obj, subset)
  local a, x;

  if IsSkewBrace(subset) then
    if HasParent(subset) and Parent(subset) = obj then
      if HasIsIdealInParent(subset) then
        return IsIdealInParent(subset);
      fi;
    fi;
  fi;

  subset := AsList(subset);

  if Order(Group(List(subset, x->x![1]))) <> Size(subset) then
    return false;
  fi;

  for a in obj do
    for x in subset do
      if not Lambda(a, x) in subset or not a*x*a^-1 in subset or not a+x-a in subset then
        return false;
      fi;
    od;
  od;
  return true;
end);

InstallMethod(IsLeftIdeal, "for a skew brace and a collection", [ IsSkewBrace, IsCollection ], 
function(obj, subset)
  local a, x;

  if IsSkewBrace(subset) then
    if HasParent(subset) and Parent(subset) = obj then
      if HasIsIdealInParent(subset) then
        return IsIdealInParent(subset);
      elif HasIsLeftIdealInParent(subset) then
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

InstallMethod(Ideals, "for a skew brace", [ IsSkewBrace ], function(obj)
  local add, sg, l, subset, x, res, tmp;
  l := [];
  add := SkewBraceAList(obj);
  for sg in NormalSubgroups(Group(add)) do 
    subset := List(sg, x->SkewBraceElmConstructor(obj, x));
    if IsIdeal(obj, subset) then
      Add(l, subset);
    fi;
  od;
  res := [];
  for x in l do
    tmp := SubSkewBrace(obj, x);
    SetIsIdealInParent(tmp, true);
    Add(res, tmp);
  od;
  return res;
end);

InstallMethod(LeftIdeals, "for a skew brace", [ IsSkewBrace], function(obj)
  local add, sg, l, subset, x, res, tmp;
  l := [];
  add := SkewBraceAList(obj);
  for sg in NormalSubgroups(Group(add)) do 
    subset := List(sg, x->SkewBraceElmConstructor(obj, x));
    if IsLeftIdeal(obj, subset) then
      Add(l, subset);
    fi;
  od;
  res := [];
  for x in l do
    tmp := SubSkewBrace(obj, x);
    SetIsIdealInParent(tmp, true);
    Add(res, tmp);
  od;
  return res;
end);

InstallGlobalFunction(SubSkewBrace, function(obj, sub)
  local p, res, add, mul, per, fam, gens;

  p := List(sub, y->[y![1], y^InverseBijective1Cocycle(obj)]);

  add := List(p, x->x[1]); 
  per := Sortex(add);
  mul := Permuted(List(p, x->x[2]), per);
 
  fam := ElementsFamily(FamilyObj(obj)); 
  res := Objectify(NewType(CollectionsFamily(fam), IsSkewBrace and IsAttributeStoringRep), rec());

  SetSize(res, Size(add)); 
  SetSkewBraceAList(res, add);
  SetSkewBraceMList(res, mul);

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

InstallMethod(IsSimpleSkewBrace, "for a skew brace", [ IsSkewBrace ], 
function(obj)
  return Size(Ideals(obj))=2;
end);

InstallMethod(Socle, "for a skew brace", [ IsSkewBrace ], function(obj)
  local add, l;
  add := SkewBraceAList(obj);
  l := List(Center(Group(add)), x->SkewBraceElmConstructor(obj, x));
  return AsIdeal(obj, Filtered(l, a->ForAll(AsList(obj), b->Lambda(a,b)=b)));
end);

InstallMethod(AsIdeal, "for a skew brace and a subset of a skew brace", [ IsSkewBrace, IsCollection ], 
function(obj, subset)
  local res;
  res := SubSkewBrace(obj, subset);
  SetIsIdealInParent(res, true);
  return res;
end);

InstallMethod(Quotient, "for two skew braces", [IsSkewBrace, IsSkewBrace], function(obj, ideal)
  local add, mul, bij, idA, idG, fA, fG, r, s, x, a, l;

  if not IsIdeal(obj, AsList(ideal)) then
    Error("<ideal> must be an ideal of <obj>");
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
    a := SkewBraceElm(obj, Representative(PreImagesElm(r, x)));
    Add(l, [x, Image(s, Image(bij, a))]);
  od;

  return SkewBrace(l);
end);

InstallMethod(LeftSeries, "for a skew brace", [IsSkewBrace], function(obj)
  local tmp, old, new, l, done;

  done := false;
  old := ShallowCopy(obj);
  l := [old];

  repeat
    tmp := List(Cartesian(obj, old), x->Star(x[1],x[2]));
    new := SubSkewBrace(obj, List(Group(List(tmp, x->x![1])), y->SkewBraceElmConstructor(obj, y)));

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

InstallMethod(RightSeries, "for a skew brace", [IsSkewBrace], function(obj)
  local tmp, old, new, l, done;

  done := false;
  old := ShallowCopy(obj);
  l := [old];

  repeat
    tmp := List(Cartesian(old, obj), x->Star(x[1],x[2]));
    new := SubSkewBrace(obj, List(Group(List(tmp, x->x![1])), y->SkewBraceElmConstructor(obj, y)));

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

InstallMethod(IsLeftNilpotent, "for a skew brace", [IsSkewBrace], function(obj)
  return 1 in List(LeftSeries(obj), Size);
end);

InstallMethod(IsRightNilpotent, "for a skew brace", [IsSkewBrace], function(obj)
  return 1 in List(RightSeries(obj), Size);
end);

InstallMethod(SocleSeries, "for a skew brace", [IsSkewBrace], function(obj)
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

InstallMethod(MultipermutationLevel, "for a skew brace", [IsSkewBrace], function(obj)
  local s;
  s := SocleSeries(obj);
  if 1 in List(s, Size) then
    return Size(s);
  else
    return fail;
  fi;
end);

InstallMethod(IsMultipermutation, "for a skew brace", [IsSkewBrace], function(obj)
  return 1 in List(SocleSeries(obj), Size);
end);

InstallMethod(Fix, "for a skew brace", [IsSkewBrace], function(obj)
  local center, f;
  center := List(Center(UnderlyingAdditiveGroup(obj)), x->SkewBraceElmConstructor(obj, x));
  f := Filtered(AsList(obj), b->ForAll(AsList(obj), a->Lambda(a,b)=b));
  return Filtered(f, x->x in center);
end);

InstallMethod(KernelOfLambda, "for a skew brace", [IsSkewBrace], function(obj)
  return Filtered(AsList(obj), a->ForAll(AsList(obj), b->Lambda(a,b)=b));
end);

InstallMethod(SmoktunowiczSeries, "for a skew brace", [IsSkewBrace], function(obj)
  local i, n, s, old, tmp, new, done;

  old := ShallowCopy(obj);
  s := [old];
  n := 1;
  done := false;

	repeat 
		tmp := [];
		for i in [1..n] do
			tmp := Concatenation(tmp, List(Cartesian(AsList(s[i]), AsList(s[n+1-i])), x->Star(x[1],x[2])));  
		od;
		new := SubSkewBrace(obj, List(Group(List(tmp, x->x![1])), y->SkewBraceElmConstructor(obj, y)));

		if Size(new) <> Size(old) then
			Add(s, new);
		fi;

		if Size(new)=Size(old) or Size(new)=1 then
			done := true;
		fi;

		old := ShallowCopy(new);
		n := n+1;
	until done;

  return s;
end);

InstallMethod(IsPrime, "for a skew brace", [IsSkewBrace], function(obj)
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

InstallMethod(IsPrimeIdeal, "for an ideal of a skew brace", [IsSkewBrace and IsIdealInParent], function(obj)
  return IsPrime(Quotient(obj!.ParentAttr, obj));
end);

InstallMethod(PrimeIdeals, "for a skew brace", [IsSkewBrace], function(obj)
  return Filtered(Ideals(obj), x->IsPrimeIdeal(x));
end);

InstallMethod(IsSemiprime, "for a skew brace", [IsSkewBrace], function(obj)
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

InstallMethod(IsSemiprimeIdeal, "for an ideal of a skew brace", [IsSkewBrace and IsIdealInParent], function(obj)
  return IsSemiprime(Quotient(obj!.ParentAttr, obj));
end);

InstallMethod(SemiprimeIdeals, "for a skew brace", [IsSkewBrace], function(obj)
  return Filtered(Ideals(obj), x->IsPrimeIdeal(x));
end);

InstallMethod(IntersectionOfTwoIdeals, "for ideals of a skew brace", [IsSkewBrace and IsIdealInParent, IsSkewBrace and IsIdealInParent], function(ideal1, ideal2)
  local obj, tmp;
  if Parent(ideal1) <> Parent(ideal2) then
    Error("The ideals do not belong to the same skew brace,");
  else
    obj := Parent(ideal1);
  fi;
  tmp := SubSkewBrace(obj, Intersection(AsList(ideal1), AsList(ideal2)));
  SetIsIdealInParent(tmp, true);
  return tmp;
end);

InstallMethod(SumOfTwoIdeals, "for ideals of a skew brace", [IsSkewBrace and IsIdealInParent, IsSkewBrace and IsIdealInParent], function(ideal1, ideal2)
  local obj, tmp, new;
  if Parent(ideal1) <> Parent(ideal2) then
    Error("The ideals do not belong to the same skew brace,");
  else
    obj := Parent(ideal1);
  fi;
  tmp := AsList(Group(List(Union(AsList(ideal1), AsList(ideal2)), x->x![1])));
  new := SubSkewBrace(obj, List(tmp, x->SkewBraceElmConstructor(obj, x)));
  SetIsIdealInParent(new, true);
  return new;
end);

InstallMethod(BaerRadical, "for a skew brace", [IsSkewBrace], function(obj)
  return Iterated(PrimeIdeals(obj), IntersectionOfTwoIdeals);
end);

InstallMethod(IsBaer, "for a skew brace", [IsSkewBrace], function(obj)
  return Size(BaerRadical(obj)) = Size(obj);
end);

InstallMethod(WedderburnRadical, "for a skew brace", [IsSkewBrace], function(obj)
  return Iterated(Filtered(Ideals(obj), x->IsLeftNilpotent(x) or IsRightNilpotent(x)), SumOfTwoIdeals);
end);

InstallMethod(IdealGeneratedBy, "for a skew brace and a collection", [ IsSkewBrace, IsCollection ], function(obj,subset)
  local f;
  f := Filtered(Ideals(obj), x->ForAll(subset, y->y in x));
  return Iterated(f, IntersectionOfTwoIdeals);
end);

InstallOtherMethod(IsSolvable, "for a skew brace", [IsSkewBrace], function(obj)
  return 1 in List(SolvableSeries(obj), Size);
end);

InstallMethod(SolvableSeries, "for a skew brace", [IsSkewBrace], function(obj)
  local tmp, old, new, l, done;

  done := false;
  old := ShallowCopy(obj);
  l := [old];

  repeat
    tmp := List(Cartesian(old, old), x->Star(x[1],x[2]));
    new := SubSkewBrace(obj, List(Group(List(tmp, x->x![1])), y->SkewBraceElmConstructor(obj, y)));

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

InstallMethod(LeftNilpotentIdeals, "for a skew brace", [ IsSkewBrace], function(obj)
  return Filtered(Ideals(obj), IsLeftNilpotent);
end);

InstallMethod(RightNilpotentIdeals, "for a skew brace", [ IsSkewBrace], function(obj)
  return Filtered(Ideals(obj), IsRightNilpotent);
end);

