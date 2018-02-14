DeclareAttribute("LeftIdeals", IsSkewBrace);
DeclareAttribute("Ideals", IsSkewBrace);
DeclareAttribute("Socle", IsSkewBrace);

# <#GAPDoc Label="LeftSeries">
# <ManSection>
#    <Oper Name="LeftSeries"
#          Arg="t"/>
#    <Returns>
#          A list of the elements of the left series
#    </Returns>
# <Description>
# The left series of a skew brace <A>obj</A> is defined
# recursively as <M>A^1=A</M> and <M>A^{n+1}=A*A^n</M> for <M>n\geq1</M>, where <M>a*b=\lambda_a(b)-b</M>. 
# <Example>
# <![CDATA[
# gap> br := SmallSkewBrace(8,20);
# <skew brace of size 8>
# gap> LeftSeries(br);
# [ <skew brace of size 8>, <brace of size 2>, <brace of size 1> ]
# ]]>
# </Example>
#
# </Description>
# </ManSection>
# <#/GAPDoc>
DeclareAttribute("LeftSeries", IsSkewBrace);

# <#GAPDoc Label="SmoktunowiczSeries">
# <ManSection>
#    <Oper Name="SmoktunowiczSeries"
#          Arg="t"/>
#    <Returns>
#          A list of the elements of the Smoktunowicz's series 
#    </Returns>
# <Description>
# The Smoktunowicz's series of a skew brace <A>obj</A> is defined
# recursively as <M>A^{[1]}=A</M> and <M>A^{[n+1]}=\sum_{i=1}^n A^{[i]}*A^{[n+1-i]}</M> for <M>n\geq1</M>, where <M>a*b=\lambda_a(b)-b</M>. 
# <Example>
# <![CDATA[
# gap> br := SmallSkewBrace(10,2);
# <skew brace of size 10>
# gap> SmoktunowiczSeries(br);
# [ <skew brace of size 10>, <brace of size 1> ]
# ]]>
# </Example>
#
# </Description>
# </ManSection>
# <#/GAPDoc>
DeclareAttribute("SmoktunowiczSeries", IsSkewBrace);



DeclareAttribute("RightSeries", IsSkewBrace);
DeclareAttribute("SocleSeries", IsSkewBrace);
DeclareAttribute("MultipermutationLevel", IsSkewBrace);
DeclareAttribute("Fix", IsSkewBrace);
DeclareAttribute("KernelOfLambda", IsSkewBrace);

DeclareProperty("IsSimpleSkewBrace", IsSkewBrace);
DeclareProperty("IsLeftNilpotent", IsSkewBrace);
DeclareProperty("IsRightNilpotent", IsSkewBrace);
DeclareProperty("IsMultipermutation", IsSkewBrace);

DeclareOperation("IsIdeal", [ IsSkewBrace, IsCollection ]);
DeclareOperation("IsLeftIdeal", [ IsSkewBrace, IsCollection ]);
DeclareOperation("AsIdeal", [ IsSkewBrace, IsCollection ]);

DeclareOperation("Quotient", [IsSkewBrace, IsSkewBrace]);

DeclareGlobalFunction("SubSkewBrace");

