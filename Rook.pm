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

# Function to move the rook, but actually just rolls the dice and flips the coin
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

# Function that actually moves the rook
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


# Quick helper function to fix our position when we run off the board
sub CheckBoundary {
    my ($position) = @_;

    # This was fun!  I had an if statement here and took me a "hot" minute to realize I needed a while loop since dice go up to 12
    while ($position > 7) {
        $position -= 8;
    }

    return $position;
}

1;
