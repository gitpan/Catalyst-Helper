use inc::Module::Install;

perl_version '5.8.1';

name 'Catalyst-Helper';
all_from 'lib/Catalyst/Helper.pm';

requires 'Class::Data::Inheritable';
requires 'NEXT';
requires 'Path::Class' => 0.09;
requires 'Template';
requires 'Time::HiRes';
requires 'File::Copy::Recursive';
requires 'Module::Install::Admin' => '0.61';
requires 'Module::Install'        => '0.61';

feature 'Test::WWW::Mechanize::Catalyst Support',
  -default                         => 1,
  'Test::WWW::Mechanize::Catalyst' => 0;

feature 'PAR Support',
  -default => 0,
  'PAR'    => 0;

feature 'CPANPLUS (for easier installations)',
  -default   => 0,
  'CPANPLUS' => 0;

auto_install;
WriteAll;

eval "use PAR ()";
print qq/ Install "PAR" for PAR packaging support.\n/ if $@;
print <<"EOF";

 Important:
    Install Task::Catalyst to get everything you need to start writing
    serious applications with Catalyst.

        perl -MCPANPLUS -e 'install Task::Catalyst'
        perl -MCPAN -e 'install Task::Catalyst'

 Have fun!
EOF
