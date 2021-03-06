use warnings;
use strict;

use inc::Module::Install;

name			'Net::MQ::Transport::AMQP';
author			'Mike Eldridge <diz@cpan.org>';
license			'perl';
version_from	'lib/Net/MQ/Transport/AMQP/RabbitMQ.pm';

requires 'Net::MQ'					=> '0.01';
requires 'Net::MQ::Transport::AMQP'	=> '0.01';
requires 'Moose'					=> '1.15';
requires 'Net::RabbitMQ'			=> '0.1.6';

WriteAll;

