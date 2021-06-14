#!/usr/bin/perl 

package Rook;

sub new {
   my $class = shift;

    my $self = {
        x_axis => shift,
        y_axis => shift,

    };

   bless $self, $class;
   return $self;
}

sub Move {
    my ($self) = @_;

    # Here we are going to represent heads as one, tails as two
    my $cointoss = int(rand(2));

    # Roll the die and sum
    my $die1 = int(rand(5)) + 1;
    my $die2 = int(rand(5)) + 1;
    my $distance = $die1 + $die2;

    # Heads if statement
    if ($cointoss == 1) {
        print "Coin toss was heads.\n";
        print "Die 1 was a $die1.\n";
        print "Die 2 was a $die2.\n";
        $self->CalculatePosition('y', $distance);

    }
    # Tails if statement
    else {
        print "Coin toss was tails.\n";
        print "Die 1 was a $die1.\n";
        print "Die 2 was a $die2.\n";
        $self->CalculatePosition('x', $distance);
    }

    return ($self->{x_axis}, $self->{y_axis});
}

sub CalculatePosition {
    my ($self, $direction, $distance) = @_;

    if ($direction eq 'x') {
        $self->{x_axis} += $distance;
        $self->{x_axis} = CheckBoundary($self->{x_axis});
    }
    else {
        $self->{y_axis} += $distance;
        $self->{y_axis} = CheckBoundary($self->{y_axis});
    }
}

sub CheckBoundary {
    my ($position) = @_;

    while ($position > 7) {
        $position -= 8;
    }

    return $position;
}

1;
