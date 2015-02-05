#!/usr/bin/env perl
use strict;
use warnings;
use FindBin;
use lib "$FindBin::Bin/lib";
use Mojo::Server::PSGI;
use Plack::Builder;
use Hattyu::Web;

my $psgi = Mojo::Server::PSGI->new( app => Hattyu::Web->new );
my $app = $psgi->to_psgi_app;

builder {
				$app;
};

