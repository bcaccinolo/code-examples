// @flow

// import { Map } from 'immutable';

import _ from 'lodash';
import f_ from 'lodash/fp';

import { pickOne, generateValues } from './arrayUtils';
import { calculate, isInScope } from './calculation';

let good = false;
let result;
let allValues;

while(good === false) {
  let start = generateValues();
  let game = {
    valuesInitial: start,
    values: start,
    operations: [],
    results: [0],
    result: 0
  };

  console.log(game);

  const newGame = calculate(game)
  const newGame2 = calculate(newGame)
  const newGame3 = calculate(newGame2)
  const newGame4 = calculate(newGame3)
  const newGame5 = calculate(newGame4)

  allValues = newGame5.valuesInitial;
  result = newGame5.values;
  good = isInScope(result);
}

console.log(allValues);
console.log(result);
console.log(good);
