#### Splits the list <lst> into blocks of equal <size>
#InstallGlobalFunction(list2matrix, 
#function(lst, size)
#  return List([1..Size(lst)/size], i->lst{(i-1)*size+[1..size]});
#end);

InstallGlobalFunction(AllInjectiveHomomorphisms, function(G,H)
local c,i,m,o,j;
  c:=[];
  for i in AllHomomorphismClasses(G,H) do
		if not IsInjective(i) then
			continue;
	  fi;
    m:=MappingGeneratorsImages(i);
    o:=Orbit(H,m[2],OnTuples);
    for j in o do
      Add(c,GroupHomomorphismByImages(G,H,m[1],j));
    od;
  od;
  return c;
end);


