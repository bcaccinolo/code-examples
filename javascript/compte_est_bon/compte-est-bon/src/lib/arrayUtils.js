// @flow

import _ from 'lodash';

export const startingValues: Array<number> = [
  1, 2, 3, 4, 5, 6, 7, 8, 9, 10,
  1, 2, 3, 4, 5, 6, 7, 8, 9, 10,
  25, 50, 75, 100
]

// From an array, get one value of it and return the array without the value.
//
// Example: ([1,2,3,2,4]) => [2, [1,3,2,4]]
//
// Tests:
//  ([1,2,3,2,4]) => [2, [1,3,2,4]]
export const pickOne = (numbers: Array<number>) => {
  const index: number = _.random(0, numbers.length - 1);
  const part1: Array<number> = _.slice(numbers, 0, index);
  const part2: Array<number> = _.slice(numbers, index + 1, numbers.length);

  const num: number = _.nth(numbers, index);
  const new_numbers: Array<number> = _.concat(part1, part2);
  return [num, new_numbers];
}

// Outputs random numbers from the array of integers given
//
// Example: [9, 5, 3, 1, 5]
//
export const generateValues = (): Array<number> => {
  const times = 6;
  let result;
  let res = [];
  let values: Array<number> = startingValues;

  _.times(times, () => {
    [result, values] = pickOne(values);
    res.push(result);
  })
  return res;
}

// Select the next operation to use
// ['plus', 'minus', 'times', 'divide']
//
export const pickOperation = (): string => {
  const operations = ['plus', 'minus', 'times', 'divide']
  const index = _.random(0, 3);
  return operations[index]
}

