#!perl
#
# @param template file
# @param destination file
#
# Script that 'merges' two property files: first file is used as the template.
# Second file is the destination file that is used as output, but also serves as input for placeholders from the template.
#
# Example:
# Template contains properties like these:
# prop1=val1
# prop2=??
#
# Destination file contains:
# prop2=filledIn
#
#
# Then the result of running this script is that destination file contains:
# prop1=val1
# prop2=filledIn
#

use 5.010;
use strict;
use warnings;
use File::Copy;
use Data::Dumper;

my $templateFile = $ARGV[0] || die "No template file given as first argument";
my $destinationFile = $ARGV[1] || die "No destination file given as second argument";



sub getKeys {
  my %keyvalues = getKeyValues(shift);
  return keys(%keyvalues);
}

# Create a hash of keys and values from the given file
# @param filename of the property file to use
# @returns a hash
sub getKeyValues {
  my $file = shift;
  open(FILE, "<$file");
  my %properties;
  while (<FILE>) {
    s/\#.*//g; # Remove comments
    chomp; # Remove EOL
    next if /^$/; # Skip lines that are empty by now
    my @keyAndValue = split('=', $_, 2); # split lines in key and value, but only use 2 parts (use the first '=' sign only)
    $properties{$keyAndValue[0]} = $keyAndValue[1];
  }
  close FILE;
  return %properties;
}

if ( ! -f $templateFile ) {
	die("Template file $templateFile does not exist. Exiting.\n");
}

print "Using properties from '$templateFile' to fill '$destinationFile'\n";

if (! -f $destinationFile) {
  print "Will copy template file to destination, as destination file does not exist.\n";
  copy($templateFile, $destinationFile);
  exit;
}

# Case 2: No changes in _keys_ (but probably in values): do not do anything
my @keysInTemplateFile = sort(getKeys($templateFile));
#print Dumper \@keysInTemplateFile;
my @keysInDestinationFile = sort(getKeys($destinationFile));

# Smart matching: compare the values of two arrays
# See http://perldoc.perl.org/perlop.html#Smartmatch-Operator
if (@keysInTemplateFile ~~ @keysInDestinationFile) {
  print "Will not do anything, all keys from template are present in destination file.\n";
  exit;
}


# Case 3:
#  - template has placeholder values ('??') that already have real values in the destination file
#  - template that has overwritten specific values, should keep those values
#  - template that has old values (not in template anymore) should remove those

my %destinationKeyValues = getKeyValues($destinationFile);

open (TPL, "<$templateFile");
open(DST, ">$destinationFile");
while (<TPL>) {
  chomp;
  if (/^[\s]*\#/) {
    print DST $_, "\n";
    next;
  }
  if (/^$/) {
    print DST $_, "\n";
    next;
  }
  my @elements = /^([^\#=]*)=([^\#]*)(\#.*|)$/g; # Split lines into: key, value, comments
  my $key = $elements[0] || "";
  my $value = $elements[1] || "";
  my $comment = $elements[2] || "";

  # Use value from destination file, if set at all there.
  if ($destinationKeyValues{$key}) {
    $value = $destinationKeyValues{$key};
  }
  if ($value eq "??") {
    print "No value known for property '$key', edit file $destinationFile manually to fix this.\n";
  }
  print DST $key, "=", $value;
  if ($comment) {
    print DST " ", $comment;
  }
  print DST "\n";
}
close(TPL);
close(DST);
