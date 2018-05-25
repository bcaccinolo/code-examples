/*****************************************************
  Outputs a CSV to have a vanilla hands poker range

  Done in a fucntional way. No object here.
/*****************************************************/

const cards = ['A', 'K', 'Q', 'J', 'T', '9', '8', '7', '6', '5', '4', '3', '2' ];

/* Returns the value of the card
   Example: K => 13
   Tests:
      console.log(cardValue('K'));
      console.log(cardValue('Q'));
      console.log(cardValue('2'));
      console.log(cardValue('A'));
*/
const cardValue = (c) => {
  let copy = Array.from(cards);
  copy.reverse();
  return copy.indexOf(c) + 2
}


/* Compares 2 cards >=
   Example: K, K => 0 - ===
            A, T => 2 - >
            T, J => 1 - <
   Tests:
        console.log(cardCompare('K', 'K'));
        console.log(cardCompare('A', 'K'));
        console.log(cardCompare('T', 'J'));
*/
const cardCompare = (c1, c2) => {
  if (cardValue(c1) === cardValue(c2)) {
    return 0
  }
  if (cardValue(c1) > cardValue(c2)) {
    return 2
  }
  if (cardValue(c1) < cardValue(c2)) {
    return 1
  }
}


/* Display hand for the range board
   Example:
      'A', 'A' => 'AA' - pair
      'A', '3' => 'A3s' - suited
      '3', 'A' => 'A3o' - off suit
   Tests:
      console.log(handDisp('K', 'K'));
      console.log(handDisp('K', '3'));
      console.log(handDisp('3', 'K'));
*/
const handDisp = (c1, c2) => {
  switch (cardCompare(c1, c2)) {
    case 0:
      return(c1 + c2);
    case 2:
      return(c1 + c2 + 's');
    case 1:
      return(c2 + c1 + 'o');
  }
}


// takes 2 cards and display them nicely
const iter2 = (c1) => {
  line = '';
  return (c2) => {
    process.stdout.write(handDisp(c1, c2));
    process.stdout.write(', ');
  }
}

// takes one card & iterates against all cards
const iter1 = (c1) => {
  cards.forEach(iter2(c1));
  process.stdout.write('\n');
}

cards.forEach(iter1);
