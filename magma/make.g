Read("compress.g");

create_braces := function(lst)
  local k;
  for k in lst do
    LogTo();
    LogTo(Concatenation("Bsize", String(k), ".g"));
    Read(Concatenation("Bsize", String(k), ".dat"));
    COMPRESS_BRACES(k);
  od;
end;

BRACES := [];


