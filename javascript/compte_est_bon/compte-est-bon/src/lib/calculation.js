// @flow

import _ from 'lodash';
import { pickOne, pickOperation } from './arrayUtils';
import { duplicateObject } from './utils';


const isMinusDoable = (a: number, b: number): boolean => {
  return (a - b) >= 0;
}

const isDivideDoable = (a: number, b: number): boolean => {
  const result = a / b;
  return Math.floor(result) === result;
}

export const calculate = (game: Object) => {
  let newGame = duplicateObject(game);
  let value1, value2,  values, operation;

  [value1, values]  = pickOne(newGame.values);
  [value2, values] = pickOne(values);

  let result;
  while (_.isNil(result)) {
    operation = pickOperation();

    switch (operation) {
      case 'plus':
        result = value1 + value2;
        break;
      case 'minus':
        if(isMinusDoable(value1, value2)) {
          result = value1 - value2;
        }
        break;
      case 'divide':
        if(isDivideDoable(value1, value2)) {
          result = value1 / value2;
        }
        break;
      case 'times':
        result = value1 * value2;
        break;
      default:
        console.log('error');
    }
  }

  newGame.values = _.concat([result], values);
  return newGame;
}

// Validates the value is in the right scope
export const isInScope = (value: number): boolean => {
  if ((value > 99) && (value < 1000)) {
    return true;
  }
  return false;
}

