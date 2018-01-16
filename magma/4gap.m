load "braces.m";

/***
 * 
 * This function produces the file <filename> (in GAP format) 
 * with the list of left braces of size <n>
 *
 ***/
MakeList4GAP := procedure(n, filename)
  local l, secs, k, s;

  printf "Size: %o\n", n;
  l, secs := AllBraces(n);    
  printf "%o brace(s), %o seconds\n--\n", #l, secs;

  s := Sprintf("BRACES[%o] := rec( total := -1, implemented := %o, size := %o, brace := [] );", n, #l, n);

  for k in [1..#l] do
    s := s cat Sprintf("BRACES[%o].brace[%o] := rec ( size := %o, perms := [ ", n, k, n);

    for x in l[k] do
      s := s cat Sprintf("[ ");
      if IsIdentity(x[1]) then
        s := s cat Sprintf(" (), ");
      else
        s := s cat Sprintf(" %o, ", x[1]);
      end if;
      
      if IsIdentity(x[2]) then
        s := s cat Sprintf(" (), ");
      else
        s := s cat Sprintf(" %o, ", x[2]);
      end if;
      s := s cat Sprintf(" ], ");
    end for;
    s := s cat Sprintf("]\n);\n\n");
  end for;

  PrintFile(filename, s);
end procedure;

/***
 *
 *
 *
SetLogFile("4gap.log");

for k in {1..15} do
  s := "Bsize" cat IntegerToString(k) cat ".g";
  MakeList4GAP(k, s);
end for;
*/
  
