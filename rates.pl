
#make .xsl from xml
if($ARGV[0] eq "-makexls") {
	open(INFILE, $ARGV[1]);
	$inCounty = "true";
	$inType = "false";
	$inData = "false";
	while(<INFILE>){
		$line = $_;
		if(/<\/row/){
			$inCounty = "false";
			$inType = "true";
			$inData = "false";
			next;
		}
		if(/<\/column/){
			$inCounty = "false";
			$inType = "false";
			$inData = "true";
			next;
		}
		next if(/<table/ || /<row/ || /<column/ || /<data/ || /<\/data/ || /<\/table/);
		if($inCounty eq "true"){
			$line =~ s/<key>//;
			$line =~ s/<\/key>//;
			$line =~ s/^ *//;
			$line =~ s/ *$//;
			push(@county, $line);
		}
		if($inType eq "true") {
			$line =~ s/<key>//;
			$line =~ s/<\/key>//;
			$line =~ s/^ *//;
			$line =~ s/ *$//;
			push(@type, $line);
		}
		if($inData eq "true"){
			$line =~ s/<values><value>//;
			$line =~ s/<\/value><\/values>//;
			$line =~ s/^ *//;s/ *$//;
			push(@data, $line);
		}
	}
	chop @county;
	chop @type;
	chop @data;
	
	use Spreadsheet::WriteExcel;
	
	my $FileName = $ARGV[2];
	my $workbook = Spreadsheet::WriteExcel->new($FileName);
	my $worksheet1 = $workbook->add_worksheet("PERL");
	
	$worksheet1->freeze_panes(1, 1);
	
	my $format = $workbook->add_format(
	center_across => 1,
	bold => 1,
	size => 10,
	border => 4,
	color => "black",
	bg_color => "CYAN",
	border_color => "black",
	align => "vcenter",
	);
	
	my $format1 = $workbook->add_format(
	center_across => 1,
	bold => 1,
	size => 10,
	border => 4,
	color => "black",
	bg_color => "ORANGE",
	border_color => "black",
	align => "right",
	);
	
	$worksheet1->set_column(0,0,20);
	
	for( $i = 0; $i < @type; $i++){
		$worksheet1->set_column(0,$i+1,20);
		$worksheet1->write(0,$i+1, $type[$i], $format);
	}
	for( $i = 0; $i < @county; $i++){
		$worksheet1->write($i+1,0, $county[$i], $format1);
	}
	$i=0;
	foreach (@data){
		@singleData = split ("</value><value>", $data[$i]);
		for( $j = 0; $j < @type; $j++){
			$worksheet1->write($i+1,$j+1, $singleData[$j]);
		}
		++$i;	
	}
}

#format spread sheet for xml
if($ARGV[0] eq "-makexml"){
	    use strict;
	    use Spreadsheet::ParseExcel;
	
	    my $parser   = Spreadsheet::ParseExcel->new();
	    my $workbook = $parser->parse($ARGV[1]);
	
	    if ( !defined $workbook ) {
	        die $parser->error(), ".\n";
	    }
	    print "<table id=\"\">\n	<row name=\"\">\n";
	
	    for my $worksheet ( $workbook->worksheets() ) {
	
	        my ( $row_min, $row_max ) = $worksheet->row_range();
	        my ( $col_min, $col_max ) = $worksheet->col_range();
		
	        for my $row ( $row_min .. $row_max ) {
	               	my $cell = $worksheet->get_cell( $row, 0);
	        	next unless $cell;
			my $value = $cell->value();
	                print "		<key>$value<\/key>\n";
	        }
		print "	<\/row>\n";
		print "	<column name=\"\">\n";
		for my $col ( $col_min .. $col_max ) {
	               	my $cell = $worksheet->get_cell( 0, $col);
	        	next unless $cell;
			my $value = $cell->value();
	                print "		<key>$value<\/key>\n";
	        }
		print "	<\/column>\n";
		print "	<data>\n";
		for my $row ( $row_min .. $row_max ) {
			print "		<values>";
			for my $col ( $col_min .. $col_max ) {
	               		my $cell = $worksheet->get_cell( $row+1, $col+1);
				next unless $cell;
				my $value = $cell->value();
				print "<value>$value<\/value>"
	       		}
			print "<\/values>\n";
	        }
		print " 	<\/data>\n";
		print "<\/table>\n";
	    }    
}