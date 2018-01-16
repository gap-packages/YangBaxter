load "NCbraces.m";

/***
 * 
 * This function produces the file <filename> (in GAP format) 
 * with the list of left NC-braces of size <n>
 *
 ***/
MakeList4GAP := procedure(n, filename)
  local l, secs, k, s;

  printf "Size: %o\n", n;
  l, secs := AllNCBraces(n);    
  printf "%o NC-brace(s), %o seconds\n--\n", #l, secs;

  s := Sprintf("NCBRACES[%o] := rec( total := -1, implemented := %o, size := %o, brace := [] );", n, #l, n);

  for k in [1..#l] do
    s := s cat Sprintf("NCBRACES[%o].brace[%o] := rec ( size := %o, perms := [ ", n, k, n);

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
 * This procedure counts the number of NC-braces of a given size
 * 
 ***/
EnumerateNCBraces := procedure(i, j)
  local p, q, k;

  p := 0;
  q := 0;

  for k in {i..j} do
    p := NumberOfNCBraces(k);
    printf "%o NC-braces of size %o\n--\n", p, k;
    q := q + p;
  end for;
  printf "there are %o NC-braces\n", q;

end procedure;

/***
 * 
 * This procedure creates the GAP files with the database of NC-braces
 * 
 ***/
MakeGAPDatabase := procedure(i, j)
  local k, s;
  for k in {i..j} do
    s := "NCBsize" cat IntegerToString(k) cat ".g";
    MakeList4GAP(k, s);
  end for;
end procedure;
  
