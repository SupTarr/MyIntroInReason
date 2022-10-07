let fizzBuzz = (stop: int) => {
    type result =
    | Fizz(string)
    | Buzz(string)
    | FizzBuzz(string)
    | Number(string)
    let result = [];
    for (i in 0 to stop) {
        switch (i) {
        if (mod(i, 3) == 0 && mod(i, 5) == 0) {
            Js.Array2.push(result, "FizzBuzz");
        } if (mod(i, 3) == 0) {
            Js.Array2.push(result, "Fizz");
        } else if (mod(i, 5) == 0) {
            Js.Array2.push(result, "Buzz");
        } else {
            Js.Array2.push(result, Belt.Int.toString(i));
        }
    }
    result
}

Js.log(fizzBuzz(100));