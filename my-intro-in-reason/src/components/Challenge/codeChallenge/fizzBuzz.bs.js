// Generated by ReScript, PLEASE EDIT WITH CARE


var fizzBuzz = (function (stop) {
    let result = [];
    for (var i = 1; i <= stop; i++) {
      if (i % 15 === 0) {
        result.push("FizzBuzz");
      } else if (i % 3 === 0) {
        result.push("Fizz");
      } else if (i % 5 === 0) {
        result.push("Buzz");
      } else {
        result.push(i.toString());
      }
    }
    return result
  });

export {
  fizzBuzz ,
}
/* No side effect */
