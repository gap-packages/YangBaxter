### This function returns true if <obj> is a left brace
### The left brace condition is 
### a(b+c)+a=ab+aca for all a,b,c 
InstallGlobalFunction(IsLeftBrace, function(obj)
  local a, b, c;
  for a in obj!.ab do
    for b in obj!.ab do
      for c in obj!.ab do
        if BraceSum(obj, a, BraceProduct(obj, a, BraceSum(obj, b, c))) <> BraceSum(obj, BraceProduct(obj, a, b), BraceProduct(obj, a, c)) then
          return false;
        fi;
      od;
    od;
  od;
  return true;
end);
