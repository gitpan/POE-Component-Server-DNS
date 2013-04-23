
use strict;
use warnings;

use 5.006;

use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  "ABSTRACT" => "A non-blocking, concurrent DNS server POE component",
  "AUTHOR" => "Chris Williams <chris\@bingosnet.co.uk>, Jan-Pieter Cornet <johnpc\@xs4all.nl>, Brandon Black <blblack\@gmail.com>, Richard Harman <richard\@richardharman.com>, Stephan Jauernick <stephan\@stejau.de>",
  "BUILD_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.59"
  },
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.30"
  },
  "DISTNAME" => "POE-Component-Server-DNS",
  "EXE_FILES" => [],
  "LICENSE" => "perl",
  "NAME" => "POE::Component::Server::DNS",
  "PREREQ_PM" => {
    "Carp" => 0,
    "Net::DNS" => "0.58",
    "POE" => "1.004",
    "POE::Component::Client::DNS" => "1.051",
    "POE::Component::Client::DNS::Recursive" => "1.06",
    "POE::Filter::DNS::TCP" => "0.04",
    "Socket" => 0
  },
  "TEST_REQUIRES" => {},
  "VERSION" => "0.30",
  "test" => {
    "TESTS" => "t/*.t"
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.63_03) } ) {
  my $tr = delete $WriteMakefileArgs{TEST_REQUIRES};
  my $br = $WriteMakefileArgs{BUILD_REQUIRES};
  for my $mod ( keys %$tr ) {
    if ( exists $br->{$mod} ) {
      $br->{$mod} = $tr->{$mod} if $tr->{$mod} > $br->{$mod};
    }
    else {
      $br->{$mod} = $tr->{$mod};
    }
  }
}

unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



