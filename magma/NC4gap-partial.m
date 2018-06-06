load "NCbraces.m";

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
  total := NumberOfSmallGroups(n);

  for k in [1..NumberOfSmallGroups(n)] do

    p := [];

    j := j+1;
    printf "id: %o,%o (%o/%o): ", n, k, j, total;

    s := Cputime();
    q := NCBracesWithAdditiveGroup(SmallGroup(n,k));
    if #q ne 0 then
      for x in q do
        Append(~p, x);
      end for;
    end if;

    printf "%o found, %o seconds\n", #q, Cputime(s);

    m := m+#q;
    s := Sprintf("NCBRACES[%o] := rec( total := -1, implemented := %o, size := %o, brace := [] );", n, -1, n);

    for l in [1..#p] do
      s := s cat Sprintf("NCBRACES[%o].brace[%o] := rec ( size := %o, perms := [ ", n, l, n);

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
  
