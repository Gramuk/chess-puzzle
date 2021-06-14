#!/usr/bin/perl 

package Board;

use strict;

sub TranslatePosition {
    my ($x_axis, $y_axis) = @_;

    $y_axis += 1;

    my %x_axishashmap = (
        0 => 'A',
        1 => 'B',
        2 => 'C',
        3 => 'D',
        4 => 'E',
        5 => 'F',
        6 => 'G',
        7 => 'H',
    );

    $x_axis = $x_axishashmap{$x_axis};
    
    return ($x_axis, $y_axis)
}

1;
