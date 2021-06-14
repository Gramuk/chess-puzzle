#!/usr/bin/perl 

package Bishop;

use strict;

sub new {
   my $class = shift;

    my $self = {
        x_axis => shift,
        y_axis => shift,
    };

   bless $self, $class;
   return $self;
}

# Sigh, probably my least favorite part of the code.  Probably could have been more elegant than 4 while loops.  So much code duplication.  Sigh.  Got hung up on a bug where I said $current_x_loaction < 0.  Bah.  May refactor later this week.
# Also, to be honest, the best solution here is to prepare a table of possible Bishop strike zones instead of recalulating every time.  Probably should do that as well.  I'll log a Hydra task.  See what I did there Joel?
sub CheckCapturePoints {
    my ($self, $rook_x_axis, $rook_y_axis) = @_;

    my $current_x_location = $self->{x_axis};
    my $current_y_location = $self->{y_axis};

    # NW
    while($current_x_location > 0 && $current_y_location < 8) {
        $current_x_location -= 1;
        $current_y_location += 1;
        if($current_x_location == $rook_x_axis && $current_y_location == $rook_y_axis) {
            return 1;
        }
    }

    $current_x_location = $self->{x_axis};
    $current_y_location = $self->{y_axis};

    # NE
    while($current_x_location < 8 && $current_y_location < 8) {
        $current_x_location += 1;
        $current_y_location += 1;
        if($current_x_location == $rook_x_axis && $current_y_location == $rook_y_axis) {
            return 1;
        }
    }


    $current_x_location = $self->{x_axis};
    $current_y_location = $self->{y_axis};

    # SW
    while($current_x_location >0 && $current_y_location > 0) {
        $current_x_location -= 1;
        $current_y_location -= 1;
        if($current_x_location == $rook_x_axis && $current_y_location == $rook_y_axis) {
            return 1;
        }
    }

    $current_x_location = $self->{x_axis};
    $current_y_location = $self->{y_axis};

    # SE
    while($current_x_location < 8 && $current_y_location > 0) {
        $current_x_location += 1;
        $current_y_location -= 1;
        if($current_x_location == $rook_x_axis && $current_y_location == $rook_y_axis) {
            return 1;
        }
    }

    return 0;

}

1;