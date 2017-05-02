﻿601,100
562,"CHARACTERDELIMITED"
586,"C:\Placeholder\Attributes.csv"
585,"C:\Placeholder\Attributes.csv"
564,
565,"rFv?3<f;yCirFO0XRtaFTNYmXD4wh>6VsJ4oX^P7Ez<4ANGvbeQ9fe0<RDVo?Ds\fTun8bIkqZ@1Y=RbkpFBCf=iRHT@UyXHxlbDJ86bd=9RrU69XX^AKaHO:GvueJ0?=s5@82cfgYiIjGVJPHn`8GrS<JKuvz7T_UDc2SWF7rt3;5Xf0G3<H_js;kH89lvL95OmWn6r"
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
589,","
568,""""
570,
571,
569,1
592,0
599,1000
560,7
pDimension
pSourceDir
pSourceFile
pTitleRows
pDelimiter
pQuote
pDebug
561,7
2
2
2
1
2
2
1
590,7
pDimension,""
pSourceDir,""
pSourceFile,""
pTitleRows,1.
pDelimiter,","
pQuote,"""
pDebug,0.
637,7
pDimension,Target Dimension
pSourceDir,File Directory
pSourceFile,File Name
pTitleRows,Number of Title Rows to Skip
pDelimiter,Delimiter Character (default=Comma)
pQuote,Quote Character (default=Double Quote)
pDebug,Debug Mode
577,2
vAttribute
vAttrType
578,2
2
2
579,2
1
2
580,2
0
0
581,2
0
0
582,2
VarType=32€ColType=827€
VarType=32€ColType=827€
572,121

#****Begin: Generated Statements***
#****End: Generated Statements****

#####################################################################################
##~~Copyright bedrocktm1.org 2011 www.bedrocktm1.org/how-to-licence.php Ver 1.0.0~~##
#####################################################################################

# This process will create Attributes to the dimension from a file.
# the file format is as per the dimension export file applied to an }ElementsAttributes dimension


### Constants ###

cProcess = 'Bedrock.Dim.Attr.ImportFromFile';
cTimeStamp = TimSt( Now, '\Y\m\d\h\i\s' );
cDebugFile = GetProcessErrorFileDirectory | cProcess | '.' | cTimeStamp | '.';
nMetaDataCount = 0;

### Initialise Debug ###

If( pDebug >= 1 );

  # Set debug file name
  sDebugFile = cDebugFile | 'Prolog.debug';

  # Log start time
  AsciiOutput( sDebugFile, 'Process Started: ' | TimSt( Now, '\d-\m-\Y \h:\i:\s' ) );

  # Log parameters
  AsciiOutput( sDebugFile, 'Parameters: pSourceDir  : ' | pSourceDir );
  AsciiOutput( sDebugFile, '            pSourceFile : ' | pSourceFile );
  AsciiOutput( sDebugFile, '            pDimension  : ' | pDimension );
  AsciiOutput( sDebugFile, '            pTitleRows  : ' | NumberToString( pTitleRows ) );
  AsciiOutput( sDebugFile, '            pDelimiter  : ' | pDelimiter );
  AsciiOutput( sDebugFile, '            pQuote      : ' | pQuote );

EndIf;


### Validate Parameters ###

nErrors = 0;

# Validate source dir
If( FileExists( pSourceDir ) = 0 );
  nErrors = 1;
  sMessage = 'Invalid source directory specified: folder does not exist.';
  If( pDebug >= 1 );
    AsciiOutput( sDebugFile, sMessage );
  EndIf;
  DataSourceType = 'NULL';
  ItemReject( sMessage );
EndIf;
If( SubSt( pSourceDir, Long( pSourceDir ), 1 ) @<> '\' );
  pSourceDir = pSourceDir | '\';
EndIf;

# Validate source file
sFile = pSourceDir | pSourceFile;
If( Long( Trim( pSourceFile ) ) = 0 % FileExists( sFile ) = 0 );
  nErrors = 1;
  sMessage = 'Invalid source file specified: file does not exist in directory.';
  If( pDebug >= 1 );
    AsciiOutput( sDebugFile, sMessage );
  EndIf;
  DataSourceType = 'NULL';
  ItemReject( sMessage );
EndIf;

# Validate dimension
If( DimensionExists( pDimension ) = 0 );
  nErrors = 1;
  sMessage = 'Invalid dimension specified: dimension does not exist.';
  If( pDebug >= 1 );
    AsciiOutput( sDebugFile, sMessage );
  EndIf;
  DataSourceType = 'NULL';
  ItemReject( sMessage );
EndIf;

# Validate delimiter
If( Trim( pDelimiter ) @= '' );
  pDelimiter = ',';
EndIf;
If( Long( pDelimiter ) > 1 );
  nErrors = 1;
  sMessage = 'Invalid delimiter specified: ' | pDelimiter | ' record delimiter must be single character.';
  If( pDebug >= 1 );
    AsciiOutput( sDebugFile, sMessage );
  EndIf;
  DataSourceType = 'NULL';
  ItemReject( sMessage );
EndIf;

# Validate qote character
If( Trim( pQuote ) @= '' );
  pQuote = '"';
EndIf;
If( Long( pQuote ) > 1 );
  nErrors = 1;
  sMessage = 'Invalid string qualifier: ' | pQuote | ' quote character must be single character.';
  If( pDebug >= 1 );
    AsciiOutput( sDebugFile, sMessage );
  EndIf;
  DataSourceType = 'NULL';
  ItemReject( sMessage );
EndIf;


### Assign Datasource ###

DataSourceType = 'CHARACTERDELIMITED';
DatasourceNameForServer = sFile;
DatasourceNameForClient = sFile;
DatasourceASCIIHeaderRecords = pTitleRows;
DatasourceASCIIDelimiter = pDelimiter;
DatasourceASCIIQuoteCharacter = pQuote;


### End Prolog ###
573,44

#****Begin: Generated Statements***
#****End: Generated Statements****

#####################################################################################
##~~Copyright bedrocktm1.org 2011 www.bedrocktm1.org/how-to-licence.php Ver 1.0.0~~##
#####################################################################################


### Check for error in prolog ###
If( nErrors > 0 );
  ProcessBreak;
EndIf;

## Metatdata Count
nMetaDataCount = nMetaDataCount + 1;

### Write data from source file to target dimension ###
sAttrType = SubSt( vAttrType, 1, 1 );

### Validate Record ###
IF(
  sAttrType @= 'A' %
  sAttrType @= 'N' %
  sAttrType @= 'S' );
  ## Continute
ELSE;
  sMessage = 'Invalid attribute type.';
  If( pDebug >= 1 );
    AsciiOutput( sDebugFile, vAttribute, vAttrType, 'Record ' | NumberToString(nMetaDataCount), sMessage );
    ITEMSKIP;
  ELSE;
    ITEMSKIP;
  EndIf;
EndIf;



If( pDebug <= 1 );
  AttrInsert( pDimension, '', vAttribute, sAttrType );
EndIf;


### End Metadata ###
574,3

#****Begin: Generated Statements***
#****End: Generated Statements****
575,35

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
576,CubeAction=1511€DataAction=1503€CubeLogChanges=0€
638,1
804,0
1217,65535
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
917,0
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
