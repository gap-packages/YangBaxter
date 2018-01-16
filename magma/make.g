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

create_skewbraces := function(lst)
  local k;
  for k in lst do
    LogTo();
    LogTo(Concatenation("SBsize", String(k), ".g"));
    Read(Concatenation("SBsize", String(k), ".dat"));
    COMPRESS_SKEWBRACES(k);
  od;
end;


BRACES := [];
NCBRACES := [];


