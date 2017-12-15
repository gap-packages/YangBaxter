SetPackageInfo( rec(
PackageName := "YangBaxter",
Subtitle := "Combinatorial Solutions for the Yang-Baxter equation",
Version := "0.0.1",
Date := "15/12/2017",

##  <#GAPDoc Label="PKGVERSIONDATA">
##  <!ENTITY VERSION "0.0.1">
##  <!ENTITY RELEASEDATE "15 December 2017">
##  <!ENTITY RELEASEYEAR "2017">
##  <#/GAPDoc>

PackageWWWHome :=
  Concatenation( "https://gap-packages.github.io/", ~.PackageName ),
SourceRepository := rec(
    Type := "git",
    URL := Concatenation( "https://github.com/gap-packages/", ~.PackageName ),
),
IssueTrackerURL := Concatenation( ~.SourceRepository.URL, "/issues" ),

ArchiveURL := Concatenation( ~.SourceRepository.URL,
                                 "/releases/download/v", ~.Version,
                                 "/", ~.PackageName, "-", ~.Version ),
ArchiveFormats := ".tar.gz",

Persons := [
  rec( 
    LastName      := "Vendramin",
    FirstNames    := "Leandro",
    IsAuthor      := true,
    IsMaintainer  := true,
    Email         := "lvendramin@dm.uba.ar",
    WWWHome       := "http://mate.dm.uba.ar/~lvendram",
    PostalAddress := Concatenation( [
                       "Departamento de matem\'atica, FCEN, UBA",
                       "Ciudad Universitaria, Pab. 1,\n",
                       "Buenos Aires, Argentina" ] ),
    Place         := "Buenos Aires",
    Institution   := "UBA"
  ),
  rec( 
    LastName      := "Konovalov",
    FirstNames    := "Alexander",
    IsAuthor      := true,
    IsMaintainer  := true,
    Email         := "alexander.konovalov@st-andrews.ac.uk",
    WWWHome       := "http://www.cs.st-andrews.ac.uk/~alexk/",
    PostalAddress := Concatenation( [
                     "School of Computer Science\n",
                     "University of St Andrews\n",
                     "Jack Cole Building, North Haugh,\n",
                     "St Andrews, Fife, KY16 9SX, Scotland" ] ),
    Place         := "St Andrews",
    Institution   := "University of St Andrews"
     ),  
],

Status := "dev",

README_URL := 
  Concatenation( ~.PackageWWWHome, "/README.md" ),
PackageInfoURL := 
  Concatenation( ~.PackageWWWHome, "/PackageInfo.g" ),

AbstractHTML := 
"The <span class=\"pkgname\">YangBaxter</span> package provides functionality \
to construct classical and skew braces. It also includes a database of classical \
and skew braces of small orders.",
   
PackageDoc := rec(
  BookName  := "YangBaxter",
  ArchiveURLSubset := ["doc"],
  HTMLStart := "doc/chap0.html",
  PDFFile   := "doc/manual.pdf",
  # the path to the .six file used by GAP's help system
  SixFile   := "doc/manual.six",
  # a longer title of the book, this together with the book name should
  # fit on a single text line (appears with the '?books' command in GAP)
  LongTitle := "Combinatorial Solutions for the Yang-Baxter equation",
),

Dependencies := rec(
   GAP := ">=4.8",
  NeededOtherPackages := [ ],
  SuggestedOtherPackages := [ ],
  ExternalConditions := [ ]
),

AvailabilityTest := ReturnTrue,

TestFile := "tst/testall.g",

Keywords := ["QYBE", "cycle sets", "racks", "quandles"]

));
