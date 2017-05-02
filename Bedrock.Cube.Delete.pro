﻿601,100
562,"NULL"
586,
585,
564,
565,"ets7Vau@_yfQ6]UR5RbW`k;1F=i6SY>k]PD4EXz4t9F9x<ZPY?k\EZJfG;8MpvIHEZ^1O]]0_CAqf4K30h1SvE;[5Yi`25y]_n;fHnKU6O:Vmo=JXb0^gu[VsGi[auC1n]fvtV:3K?U9l@ng]Y2sQ]GGmiZs6Rlus147am`Q[NCLUU6un5JZpQ>hyR1lAZ5CrE9Nr:gR"
559,1
928,0
593,
594,
595,
597,
598,
596,
800,
801,
566,0
567,","
588,"."
589,
568,""""
570,
571,
569,0
592,0
599,1000
560,3
pCubes
pDelimiter
pDebug
561,3
2
2
1
590,3
pCubes,""
pDelimiter,"&"
pDebug,0.
637,3
pCubes,List of Cubes to Delete Separated by Delimiter
pDelimiter,Delimiter
pDebug,Debug Mode
577,0
578,0
579,0
580,0
581,0
582,0
572,88

#****Begin: Generated Statements***
#****End: Generated Statements****


#####################################################################################
##~~Copyright bedrocktm1.org 2011 www.bedrocktm1.org/how-to-licence.php Ver 1.0.0~~##
#####################################################################################

# This process deletes cubes.


### Constants ###

cProcess = 'Bedrock.Cube.Delete';
cTimeStamp = TimSt( Now, '\Y\m\d\h\i\s' );
cDebugFile = GetProcessErrorFileDirectory | cProcess | '.' | cTimeStamp | '.';


### Initialise Debug ###

If( pDebug >= 1 );

  # Set debug file name
  sDebugFile = cDebugFile | 'Prolog.debug';

  # Log start time
  AsciiOutput( sDebugFile, 'Process Started: ' | TimSt( Now, '\d-\m-\Y \h:\i:\s' ) );

  # Log parameters
  AsciiOutput( sDebugFile, 'Parameters: pCubes     : ' | pCubes );
  AsciiOutput( sDebugFile, '            pDelimiter : ' | pDelimiter );

EndIf;


### Validate Parameters ###

nErrors = 0;

# If blank delimiter specified then convert to default
If( pDelimiter @= '' );
  pDelimiter = '&';
EndIf;

# If no cubes have been specified then terminate process
If( Trim( pCubes ) @= '' );
  nErrors = 1;
  sMessage = 'No cubes specified';
  If( pDebug >= 1 );
    AsciiOutput( sDebugFile, sMessage );
  EndIf;
  ItemReject( sMessage );
EndIf;


### Split parameter into individual cubes and delete ###

sCubes = pCubes;
nDelimiterIndex = 1;

While( nDelimiterIndex <> 0 );
  nDelimiterIndex = Scan( pDelimiter, sCubes );
  If( nDelimiterIndex = 0 );
    sCube = sCubes;
  Else;
    sCube = Trim( SubSt( sCubes, 1, nDelimiterIndex - 1 ) );
    sCubes = Trim( Subst( sCubes, nDelimiterIndex + Long(pDelimiter), Long( sCubes ) ) );
  EndIf;
  # Don't attempt to process a blank Cube
  If( sCube @<> '' );
    If( CubeExists( sCube ) = 1 );
      If( pDebug >= 1 );
        AsciiOutput( sDebugFile, 'Cube: ' | sCube | ' OK' );
      EndIf;
      If( pDebug <= 1 );
        CubeDestroy( sCube );
      EndIf;
    Else;
      If( pDebug >= 1 );
        AsciiOutput( sDebugFile, 'Cube: ' | sCube | ' does not exist' );
      EndIf;
    EndIf;
  EndIf;
End;


### End Prolog ###
573,3

#****Begin: Generated Statements***
#****End: Generated Statements****
574,3

#****Begin: Generated Statements***
#****End: Generated Statements****
575,36

#****Begin: Generated Statements***
#****End: Generated Statements****


#####################################################################################
##~~Copyright bedrocktm1.org 2011 www.bedrocktm1.org/how-to-licence.php Ver 1.0.0~~##
#####################################################################################


### Initialise Debug ###

If( pDebug >= 1 );

  # Set debug file name
  sDebugFile = cDebugFile | 'Epilog.debug';

  # Log errors
  If( nErrors <> 0 );
    AsciiOutput( sDebugFile, 'Errors Occurred' );
  EndIf;

  # Log finish time
  AsciiOutput( sDebugFile, 'Process Finished: ' | TimSt( Now, '\d-\m-\Y \h:\i:\s' ) );

EndIf;


### If errors occurred terminate process with a major error status ###

If( nErrors <> 0 );
  ProcessQuit;
EndIf;


### End Epilog ###
576,CubeAction=1511DataAction=1503CubeLogChanges=0
638,1
804,0
1217,1
900,
901,
902,
903,
906,
929,
907,
908,
904,0
905,0
909,0
911,
912,
913,
914,
915,
916,
917,1
918,1
919,0
920,50000
921,""
922,""
923,0
924,""
925,""
926,""
927,""
