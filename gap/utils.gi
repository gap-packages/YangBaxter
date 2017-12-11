### Splits the list <lst> into blocks of equal <size>
InstallGlobalFunction(list2matrix, 
function(lst, size)
  return List([1..Size(lst)/size], i->lst{(i-1)*size+[1..size]});
end);
