#use ExtUtils::MakeMaker;

use inc::Module::Install;

author 'Chris Williams <chris@bingosnet.co.uk>';
license 'perl';

WriteMakefile(
			  'NAME'	=> 'POE::Component::Server::DNS',
			  'PREREQ_PM' => {
							  'POE'    => 0.3202,
							  'Net::DNS' => 0.58,
							  'POE::Component::Client::DNS' => 0.99,
							  'POE::Component::Generic' => 0.0905,
							  'Carp'   => 0,
							  'Socket' => 0,
							  'IO::Socket::INET' => 0,
							 },
			  'VERSION_FROM' => 'lib/POE/Component/Server/DNS.pm',
			  'dist' => { 'COMPRESS' => 'gzip --best' },
			 );
