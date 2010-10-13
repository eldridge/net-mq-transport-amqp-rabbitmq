#!perl -T

use Test::More tests => 1;

BEGIN {
    use_ok( 'Net::MQ::Transport::AMQP::RabbitMQ' ) || print "Bail out!
";
}

diag( "Testing Net::MQ::Transport::AMQP::RabbitMQ $Net::MQ::Transport::AMQP::VERSION, Perl $], $^X" );
