Quickstart guide for parallel braces enumeration with SCSCP package

The file `count.g` is the original file containing `AllSkewbraces` 
function which calculates skew braces enumerating all groups of a 
given order.

It was extended by `AllSkewbracesByGroupId` function which takes one
group id `[size,nr]` and produces all skew braces that originate from
that group id.

Obviously, this can be performed independently, and this is where
one can use the SCSCP package.

To set up parallel distributed calculation do the following:

1. Edit server configuration file `myserver.g` as needed (e.g. to
update filenames and paths).

2. Edit part 1 of the `gapd.sh` script to update the way how GAP 
starts and the location of the server configuration file.

3. Edit `gapfarm.sh` script to specify GAP workers, each listening
to a specific port. The number of workers depend on the number of
cores on your computer.

4. Start GAP workers with

    ./gapfarm.sh
    
5. Start a GAP session and execute the following commands:

Load SCSCP package:

    gap> LoadPackage("scscp");
    
Inform GAP which server to use (port numbers must be the same
as in `gapfarm.sh`):
    
    gap> SCSCPservers:=List([26133..26136], i -> ["localhost",i]);
    [ [ "localhost", 26133 ], [ "localhost", 26134 ], [ "localhost", 26135 ], [ "localhost", 26136 ] ]
    
Generate the list of tasks (each task is a group id):
    
    todo:=List([1..NrSmallGroups(16)],i->[16,i]);
    [ [ 16, 1 ], [ 16, 2 ], [ 16, 3 ], [ 16, 4 ], [ 16, 5 ], [ 16, 6 ], [ 16, 7 ], [ 16, 8 ], [ 16, 9 ], [ 16, 10 ], [ 16, 11 ], [ 16, 12 ], [ 16, 13 ], [ 16, 14 ] ]

Start parallel computation:
    
    gap> ParListWithSCSCP(todo,"AllSkewbracesByGroupId");
    #I  1/14:master --> localhost:26133
    #I  2/14:master --> localhost:26134
    #I  3/14:master --> localhost:26135
    #I  4/14:master --> localhost:26136
    #I  5/14:master --> localhost:26133
    #I  6/14:master --> localhost:26133
    #I  7/14:master --> localhost:26134
    #I  8/14:master --> localhost:26133
    #I  9/14:master --> localhost:26134
    #I  10/14:master --> localhost:26134
    #I  11/14:master --> localhost:26133
    #I  12/14:master --> localhost:26135
    #I  13/14:master --> localhost:26136
    #I  14/14:master --> localhost:26136
    [ 8, 83, 191, 190, 66, 66, 80, 144, 80, 161, 227, 118, 152, 39 ]

Each of the workers will produce output files with the name in the 
format `SBsizeX_Y.dat` in their current directory.
