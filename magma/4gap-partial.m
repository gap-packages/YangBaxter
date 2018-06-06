load "braces.m";

/***
 * 
 * This function produces the file <filename> (in GAP format) 
 * with the list of left braces of size <n>
 * The files are created after each group is studied
 *
 ***/
MakeList4GAP_partial := procedure(n, filename)
  local l, secs, k, s, j, total, p, q, m;

  printf "Size: %o\n", n;
  
  t := Cputime();
  j := 0;
  m := 0;
  total := #{ x: x in {1..NumberOfSmallGroups(n)} | IsAbelian(SmallGroup(n,x)) };

  s := Sprintf("BRACES[%o] := rec( total := -1, implemented := %o, size := %o, brace := [] );", n, -1, n);
  PrintFile(filename, s);

  for k in [1..NumberOfSmallGroups(n)] do

    p := [];

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
    s := Sprintf("");

    for l in [1..#q] do
      s := s cat Sprintf("BRACES[%o].brace[%o] := rec ( size := %o, perms := [ ", n, m+l, n);

      for x in p[l] do
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

    m := m+#p;
    PrintFile(filename, s);

  end for;

  printf "%o found\n", m;

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
  
