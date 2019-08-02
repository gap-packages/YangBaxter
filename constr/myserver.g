#############################################################################
#
# This is the SCSCP server configuration file.
# The service provider can start the server just by the command 
# $ gap myserver.g
#
#############################################################################

#############################################################################
#
# Load necessary packages and read external files. 
# Put here and other commands if needed.
#
#############################################################################

LogTo(); # to close log file if it was opened from .gaprc
LoadPackage("yangbaxter");
Read("count.g");
InstallSCSCPprocedure( "AllSkewbracesByGroupId", AllSkewbracesByGroupId, 1, 1 );
RunSCSCPserver( SCSCPserverAddress, SCSCPserverPort );
