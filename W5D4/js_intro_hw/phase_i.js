function madLib(verb, adj, noun) {
  console.log(`We shall ${verb.toUpperCase()} the ${adj.toUpperCase()} ${noun.toUpperCase()}.`);
}
madLib('Run', 'fuzzy', 'bear')

function isSubstring(searchString, subString) {
  console.log(searchString.includes(subString));
}
isSubstring("time to program", "time")
isSubstring("Jump for joy", "joys")

function fizzBuzz(arr) {
  const fbarr = [];

  arr.forEach(el => {
    if ((el % 3 === 0) ^ (el % 5 === 0)) { // had to peek at solution for the ^ operator
      fbarr.push(el);
    }
  });
   console.log(fbarr);
}

fizzBuzz([1,2,3,4,5,6,7,8,9,15,25])

function isPrime(num) {
  if (num < 2) return false;

  for (let i = 2; i < num; i++) {
    if (num % i === 0) {
      return false;
    }
  }

  return true;
}

console.log(isPrime(2))
console.log(isPrime(10))

function sumOfNPrimes(n) {
  let sum = 0;
  let countPrimes = 0;
  let i = 2;

  while (countPrimes < n) {
    if (isPrime(i)) {
      sum += i;
      countPrimes++;
    }
      i++
  }
  return sum;
}
console.log(sumOfNPrimes(0))
console.log(sumOfNPrimes(1))
console.log(sumOfNPrimes(4))
