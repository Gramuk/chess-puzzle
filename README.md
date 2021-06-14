The Problem
We decide to move the black rook and play for its survival. The move happens as follows:

1. Toss a coin, if it's heads, the rook moves up. If it's tails, the rook moves to the right.
2. Roll 2 dice (6 sided). The sum of numbers on the face up side of both the dice will be the
   number of squares the rook moves.
3. If the rook reaches the right most column on the board, it emerges again from the left
   most column.
4. If the rook reaches the top most row, it emerges again from the bottom most row.
   A. Move the rook as described above for 15 rounds. If it manages to survive from being captured by the bishop, the player with the rook wins. Else the player with bishop wins.
   B. The starting position for rook is h1 square and bishop remains stationary on c3.
5. Write code to determine which player won, given the above constraints. Make sure to record (or print) the result of coin toss, dice and rook's position after every move.

Based on some fun testing using the following command ...
for i in {1..10000}; do perl execute.pl | grep 'Rook wins'; done | wc -l

Rook only wins 6.5% of the time. Poor Rook.
