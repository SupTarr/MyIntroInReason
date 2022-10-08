let fizzBuzz = %raw(`
  function (stop) {
    let result = [];
    for (var i = 1; i < stop; i++) {
      if (i % 15 == 0) {
        result.push("FizzBuzz");
      } else if (i % 3 == 0) {
        result.push("Fizz");
      } else if (i % 5 == 0) {
        result.push("Buzz");
      } else {
        result.push(i.toString());
      }
    }
    return result
  }
`)
type result = Fizz | Buzz | FizzBuzz | Number

let fizzBuzzRes = (stop: int) => {
  let result = [];
  for i in 0 to stop {
    switch result {
      | Fizz => result.push("Fizz");
      | Buzz => result.push("Buzz");
      | FizzBuzz => result.push("FizzBuzz");

    }
    if (mod(i, 15) == 0) {
      result->Js.Array2.push("FizzBuzz");
    } else if (mod(i, 3) == 0) {
      result->Js.Array2.push("Fizz");
    } else if (mod(i, 5) == 0) {
      result->Js.Array2.push("Buzz");
    } else {
      result->Js.Array2.push(Belt.Int.toString(i));
    }
  }
  result
}

Js.log(fizzBuzz(100))
