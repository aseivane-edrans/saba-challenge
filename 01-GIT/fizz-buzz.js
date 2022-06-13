// For numbers 1 through 100,

// if the number is divisible by 3 print Fizz;
// if the number is divisible by 5 print Buzz;
// if the number is divisible by 3 and 5 (15) print FizzBuzz;
// else, print the number.

for(let i = 0; i < 100; i++) {
    if(i % 3 === 0 && i % 5 === 0) {
        console.log('FizzBuzz');
    } else if(i % 3 === 0) {
        console.log('Fizz');
    } else if(i % 5 === 0) {
        console.log('Buzz');
    } else {
        console.log(i)
    }
}