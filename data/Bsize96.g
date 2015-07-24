gap> MakeList([96]);
Error, user interrupt in
  pa := ParentPcgs( pcgs ); called from 
SiftedPcElement( InducedPcgsWrtFamilyPcgs( grp ), elm ) called from
gen in H called from
func( elm ) called from
ForAll( GeneratorsOfGroup( G ), function ( gen )
      return gen in H;
  end ) called from
p[1] = x called from
...  at line 16 of *stdin*
you can 'return;'
brk> gap> LogTo();;LogTo("../data/Bsize97.g");
