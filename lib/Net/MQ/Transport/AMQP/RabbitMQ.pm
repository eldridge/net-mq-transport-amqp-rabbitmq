package Net::MQ::Transport::AMQP::RabbitMQ;

use Moose;

=head1 NAME

Net::MQ::Transport::AMQP::RabbitMQ - transport Net::MQ messages over AMQP using Net::RabbitMQ

=head1 SYNOPSIS

This class may be used separately, but it is designed to be
used as part of the unified Net::MQ API for integrating the
messaging pattern into your application.

 package MyApp::Event::Album::Purchased;

 with 'Net::MQ::Message';

 __PACKAGE__->transport([ 'AMQP::RabbitMQ' => { host => '192.168.0.32' } ]);

=cut

our $VERSION = '0.01';

with 'Net::MQ::Transport';

use Net::RabbitMQ;

has host =>
	isa			=> 'Str',
	is			=> 'ro',
	required	=> 1;

has channel =>
	isa			=> 'Int',
	is			=> 'ro',
	default		=> 1;

has exchange =>
	isa			=> 'Str',
	is			=> 'ro',
	default		=> 'amq.direct';

has connection =>
	isa			=> 'Net::RabbitMQ',
	is			=> 'ro',
	lazy_build	=> 1,
	init_arg	=> undef;

sub _build_connection
{
	my $self = shift;

	my $amqp = new Net::RabbitMQ;

	$amqp->connect($self->host, {});
	$amqp->channel_open($self->channel);

	return $amqp;
}

sub publish
{
	my $self	= shift;
	my $msg		= shift;

	print "poop\n";

	$self->connection->publish($self->channel, $msg->key, $msg->freeze({ format => 'JSON' }), {});
}

sub dequeue
{
}

sub poll
{
}

sub ack
{
}

=head1 AUTHOR

Mike Eldridge, C<< <diz at cpan.org> >>

=head1 LICENSE AND COPYRIGHT

Copyright 2010 Mike Eldridge.

This program is free software; you can redistribute it and/or
modify it under the terms of either: the GNU General Public
License as published by the Free Software Foundation; or the
Artistic License.

See http://dev.perl.org/licenses/ for more information.

=cut

1;

