SetPackageInfo( rec(
PackageName := "YangBaxter",
Subtitle := "Combinatorial Solutions for the Yang-Baxter equation",
Version := "0.10.7",
Date := "14/07/2025", # dd/mm/yyyy format
License := "GPL-3.0",

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
    Email         := "Leandro.Vendramin@vub.be",
    WWWHome       := "https://vendramin.github.io/",
    PostalAddress := Concatenation( [
                       "Vrije Universiteit Brussel\n",
                       "Faculty of Sciences\n",
                       "Department of Mathematics and Data Science\n",
                       "Pleinlaan 2, B-1050\n",
                       "Brussel, Belgium" ] ),
    Place         := "Brussels",
    Institution   := "Vrije Universiteit Brussel"
  ),
  rec( 
    LastName      := "Konovalov",
    FirstNames    := "Olexandr",
    IsAuthor      := true,
    IsMaintainer  := true,
    Email         := "obk1@st-andrews.ac.uk",
    WWWHome       := "https://olexandr-konovalov.github.io/",
    PostalAddress := Concatenation( [
                     "School of Computer Science\n",
                     "University of St Andrews\n",
                     "Jack Cole Building, North Haugh,\n",
                     "St Andrews, Fife, KY16 9SX, Scotland" ] ),
    Place         := "St Andrews",
    Institution   := "University of St Andrews"
     ),  
],

Status := "deposited",

README_URL := 
  Concatenation( ~.PackageWWWHome, "/README.md" ),
PackageInfoURL := 
  Concatenation( ~.PackageWWWHome, "/PackageInfo.g" ),

AbstractHTML := 
"The <span class=\"pkgname\">YangBaxter</span> package provides functionality \
to construct classical and skew braces. It also includes a database of classical \
and skew braces of small orders.",
   
PackageDoc := rec(
  BookName  := ~.PackageName,
  ArchiveURLSubset := ["doc"],
  HTMLStart := "doc/chap0.html",
  PDFFile   := "doc/manual.pdf",
  # the path to the .six file used by GAP's help system
  SixFile   := "doc/manual.six",
  # a longer title of the book, this together with the book name should
  # fit on a single text line (appears with the '?books' command in GAP)
  LongTitle := ~.Subtitle,
),

Dependencies := rec(
   GAP := ">=4.9",
  NeededOtherPackages := [ [ "cryst", ">=4.0" ] ],
  SuggestedOtherPackages := [ ],
  ExternalConditions := [ ]
),

AvailabilityTest := ReturnTrue,

TestFile := "tst/testall.g",

Keywords := ["QYBE", "cycle sets", "racks", "quandles", "braces", "radical rings"]

));
