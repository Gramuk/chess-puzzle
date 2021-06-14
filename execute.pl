#!/usr/bin/perl 

use lib '.';
use Rook;
use Bishop;
use Board;
use strict;

my $rook_x_axis = 7;
my $rook_y_axis = 0;
my $bishop_x_axis = 2;
my $bishop_y_axis = 2;

my $rook_pretty_x_access;
my $rook_pretty_y_access;

my $rook = new Rook($rook_x_axis, $rook_y_axis);
my $bishop = new Bishop($bishop_x_axis, $bishop_y_axis);

my @moves = (1..15);
my $bishop_win = 0;

for(@moves) {
    ($rook_x_axis, $rook_y_axis) = $rook->Move();
    ($rook_pretty_x_access, $rook_pretty_y_access) = Board::TranslatePosition($rook_x_axis, $rook_y_axis);
    print "Rook is at $rook_pretty_x_access$rook_pretty_y_access.\n";
    $bishop_win = $bishop->CheckCapturePoints($rook_x_axis, $rook_y_axis);
    if ($bishop_win == 1) {
        print "Bishop has won!\n";
        exit();
    }
    else {
        print "Rook is still on the loose!\n";
    }

}

print "Rook wins!\n";