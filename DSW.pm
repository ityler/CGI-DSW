# -- 
# 	DSW Module - "Dead Simple Web"
# --
#	Extremely lightweight HTML5 web framework to extend
# 	Perls' CGI::base to include HTML5 DOCTYPE and W3C validated
# 	output.
#
# --
package DSW;

use strict;
use warnings;
use base qw(Exporter);

our @EXPORT = qw(new dsw_start dsw_end HTM_div HTM_p HTM_pre HTM_li HTM_ul jscript any);

sub new {
    my $class = shift;
    my($path,$data) = @_;
    my $self = bless {
        path => $path,
        data => $data,
    }, $class;
    return $self;
}

# -- Output HTML opening page structure	-- #
#	 PARAM: String	| Page Title
#	 PARAM: String	| Stylesheet include path
#	 Required to form HTML5 document structure
# --
sub dsw_start {
	my($o);									# Output
    my($x,$y) = @_;							# Arguments
    $x = (exists $_[0]) ? $_[0] : "";		# Page title
    $y = (exists $_[1]) ? $_[1] : "";		# CSS include
    $o = &hdrs."<html>\n
			    <head>\n\t
				<title>$x</title>\n\t";		# HTML structure
    if($y eq ""){ } else { 					# Stylesheet included
		$o .= "<link rel='stylesheet' type='text/css' href='$y'>\n";	# Set CSS inclusion
	}	
    $o .= "</head>\n<body>\n";  			# HTML structure
	print $o;								# Output HTML opening structure
}


# -- Output HTML closing page structure -- #
sub dsw_end { print "</body>\n</html>"; }


# --/--/ Elements \--\-- #

# -- Output HTML paragraph element <p> -- #
#	 PARAM: String	| Text string to be output
#	 PARAM: String	| Id/Class attribute	(Optional)
#	 PARAM: String	| Id/Class attribute	(Optional)
# --
sub HTM_p { 
    my($x,$y,$z,$p,$o,$oi,$oc);
    $oi = ""; $oc = "";
    $x = (exists $_[0]) ? $_[0] : "";
    $y = (exists $_[1]) ? $_[1] : "";
    $z = (exists $_[2]) ? $_[2] : "";
	$p = uc(substr($y,0,2));                            # Type identifier
    if($p eq "I="){
        $oi = "id='".substr($y,2,length($y))."'";       # Id attribute
    } elsif($p eq "C="){
        $oc = "class='".substr($y,2,length($y))."''"    # Class attribute
    }
    $p = substr($z,0,2);                                # Type identifier
    if($p eq "C="){                     
        $oc = "class='".substr($z,2,length($z))."'";    # Class attribute
    } elsif($p eq "I="){
        $oi = "id='".substr($z,2,length($z))."'";       # Id attribute
    }
    $o = "<p ${oi} ${oc}>${x}</p>";                    	# Return formatted output
	print $o;											# Output element
}

# -- Output HTML pre element <pre> -- #
#	 PARAM: String	| Text string to be output
#	 PARAM: String	| Id/Class attribute	(Optional)
#	 PARAM: String	| Id/Class attribute	(Optional)
# --
sub HTM_pre { 
	my($x,$y,$z,$p,$o,$oi,$oc);
    $oi = ""; $oc = "";
    $x = (exists $_[0]) ? $_[0] : "";
    $y = (exists $_[1]) ? $_[1] : "";
    $z = (exists $_[2]) ? $_[2] : "";
	$p = uc(substr($y,0,2));                            # Type identifier
    if($p eq "I="){
        $oi = "id='".substr($y,2,length($y))."'";       # Id attribute
    } elsif($p eq "C="){
        $oc = "class='".substr($y,2,length($y))."''"    # Class attribute
    }
    $p = substr($z,0,2);                                # Type identifier
    if($p eq "C="){                     
        $oc = "class='".substr($z,2,length($z))."'";    # Class attribute
    } elsif($p eq "I="){
        $oi = "id='".substr($z,2,length($z))."'";       # Id attribute
    }
    $o = "<pre ${oi} ${oc}>${x}</pre>";                 # Return formatted output
	print $o;											# Output element
}
# -- Output HTML list item element <li> -- #
#	 PARAM: String	| Text string to be output
#	 PARAM: String	| Id/Class attribute	(Optional)
#	 PARAM: String	| Id/Class attribute	(Optional)
# --
sub HTM_li {
	my($x,$y,$z,$p,$o,$oi,$oc);
    $oi = ""; $oc = "";
    $x = (exists $_[0]) ? $_[0] : "";
    $y = (exists $_[1]) ? $_[1] : "";
    $z = (exists $_[2]) ? $_[2] : "";
	$p = uc(substr($y,0,2));                            # Type identifier
    if($p eq "I="){
        $oi = "id='".substr($y,2,length($y))."'";       # Id attribute
    } elsif($p eq "C="){
        $oc = "class='".substr($y,2,length($y))."''"    # Class attribute
    }
    $p = substr($z,0,2);                                # Type identifier
    if($p eq "C="){                     
        $oc = "class='".substr($z,2,length($z))."'";    # Class attribute
    } elsif($p eq "I="){
        $oi = "id='".substr($z,2,length($z))."'";       # Id attribute
    }
    $o = "<li ${oi} ${oc}>${x}</li>";                 	# Return formatted output
	print $o;											# Output element
}

# -- Output HTML unordered list element <ul> -- #
#	 PARAM: String	| Text string to be output
#	 PARAM: String	| Id/Class attribute	(Optional)
#	 PARAM: String	| Id/Class attribute	(Optional)
# --
sub HTM_ul {
	my($x,$y,$z,$p,$o,$oi,$oc);
    $oi = ""; $oc = "";
    $x = (exists $_[0]) ? $_[0] : "";
    $y = (exists $_[1]) ? $_[1] : "";
    $z = (exists $_[2]) ? $_[2] : "";
	$p = uc(substr($y,0,2));                            # Type identifier
    if($p eq "I="){
        $oi = "id='".substr($y,2,length($y))."'";       # Id attribute
    } elsif($p eq "C="){
        $oc = "class='".substr($y,2,length($y))."''"    # Class attribute
    }
    $p = substr($z,0,2);                                # Type identifier
    if($p eq "C="){                     
        $oc = "class='".substr($z,2,length($z))."'";    # Class attribute
    } elsif($p eq "I="){
        $oi = "id='".substr($z,2,length($z))."'";       # Id attribute
    }
    $o = "<ul ${oi} ${oc}>${x}</ul>";                 	# Return formatted output
	print $o;											# Output element
}

# -- Include external script -- #
#	 PARAM:	STRING
#	 Accepts script location to be included in document
# --
sub jscript {
    my($x,$o) = $_[0];
    if($x eq ""){										# Check not empty
    } else { 
        $o = "<script src='$x'></script>";				
		print $o;										# Return script include
	}
}

# -- Output any HTML5 element -- #
#	 PARAM:	String
#	 Allows output of any HTML5 element, included for inclusions sake
# --		 
sub any { 
	print "$_[0]"; 
	## TODO: Take first passed param as element
	# Example: &any( "h5" , "i=element_id" , "c=classname" )
	# Create opening and closing tags based on first passed parameter
}

## ---- CURRENTLY IN DEVELOPMENT ---- ##
# -- Output HTML div element <div> -- #
#	 PARAM: String	| element string to be output
#	 PARAM: String	| Id/Class attribute	(Optional)
#	 PARAM: String	| Id/Class attribute	(Optional)
# --
sub HTM_div {
    print "<div></div>";
	#	How to output other div elements gracefully within div
	#	Example: 
	#	<div> 
	#		<div> 
	#			<p>Problem</p>
	#		</div>
	#	</div>
}


# --/--/ Internal \--\-- #

# -- Output HTML5 page headers -- #
#	HTML5 doctype (still not available in default CGI w/o some hackery)
# --
sub hdrs {
    return "Content-type: text/html; charset=utf-8\n\n<!DOCTYPE html>\n";
}

1;