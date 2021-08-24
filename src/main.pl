#!/usr/bin/env perl

use Text::Wrap;
$Text::Wrap::columns = 60;

$params = "method=getQuote&format=text&lang=en";
$uri = "https://api.forismatic.com/api/1.0/?$params";

@response = split(/\(/, `curl -s "$uri"`);

$quote_text = $response[0];
$quote_text =~ s/^\s+|\s+$//g;
$quote_text = wrap("", " ", $quote_text);

print "\"\e[94m\e[1m$quote_text\e[0m\"\n";

if ($response[1]) {
    $quote_author = $response[1];
    $quote_author =~ s/\)//;
    $quote_author =~ s/^\s+|\s+$//;
    print "\e[93m$quote_author\e[0m\n";
}
