SetPackageInfo( rec(
PackageName := "YangBaxter",
Subtitle := "YangBaxter",
Version := "0",
Date := "00/00/0000",

##  <#GAPDoc Label="PKGVERSIONDATA">
##  <!ENTITY VERSION "0">
##  <!ENTITY RELEASEDATE "14 December 2017">
##  <!ENTITY RELEASEYEAR "2017">
##  <#/GAPDoc>

ArchiveURL := "http://",
ArchiveFormats := ".zoo",
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
  )
],

#Status := "deposited",
#README_URL := 
#  "http://www.math.rwth-aachen.de/~Greg.Gamble/Example/README.example",
#PackageInfoURL := 
#  "http://www.math.rwth-aachen.de/~Greg.Gamble/Example/PackageInfo.g",
#
#AbstractHTML := 
#  "The <span class=\"pkgname\">Example</span> package, as its name suggests, \
#   is an example of how to create a <span class=\"pkgname\">GAP</span> \
#   package. It has little functionality except for being a package",
#
#PackageWWWHome := "http://www.math.rwth-aachen.de/~Greg.Gamble/Example",
#               
PackageDoc := rec(
  # use same as in GAP            
  BookName  := "YangBaxter",
  # format/extension can be one of .tar.gz, .tar.bz2, -win.zip, .zip.
  ArchiveURLSubset := ["doc"],
  HTMLStart := "doc/chap0.html",
  PDFFile   := "doc/manual.pdf",
  # the path to the .six file used by GAP's help system
  SixFile   := "doc/manual.six",
  # a longer title of the book, this together with the book name should
  # fit on a single text line (appears with the '?books' command in GAP)
  # LongTitle := "Elementary Divisors of Integer Matrices",
  LongTitle := "YangBaxter",
),


Dependencies := rec(
   GAP := ">=4.4",
  NeededOtherPackages := [],
  SuggestedOtherPackages := [],
  ExternalConditions := []
),

AvailabilityTest := ReturnTrue,
BannerString := Concatenation( 
  "--\nYB - Version ", ~.Version, "\n", ~.ArchiveURL,"\n"),
Autoload := false,
Keywords := ["QYBE", "cycle sets", "racks", "quandles"]
));


