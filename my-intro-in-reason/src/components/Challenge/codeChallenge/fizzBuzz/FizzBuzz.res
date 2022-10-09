// FizzBuzz.res
%%raw("import '../../../../input.css'")

let fizzBuzz = %raw(`

  function (stop) {

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

  }

`)

@react.component
let make = () => {
  let (fizzBuzzStop, setFizzBuzzStop) = React.useState(_ => 0)
  let handleFizzBuzzStopChange = event => {
    let value = ReactEvent.Form.currentTarget(event)["value"]
    if Js.String.charAt(0, value) == "0" {
      setFizzBuzzStop(_ => 0)
    } else {
      setFizzBuzzStop(_ => value)
    }
  }

  let fizzBuzzitems = fizzBuzz(fizzBuzzStop)->Js.Array2.mapi((fizz, index) => {
    <li key={index->Belt.Int.toString}> {React.string(fizz)} </li>
  })

  <section>
    <h2 className="text-center text-xl font-bold mt-10 mb-2">
      {React.string("Fizz-Buzz Challenge")}
    </h2>
    <div className="flex flex-wrap max-w-[1000px] mx-auto justify-around">
      <div className="mx-5 mb-3">
        <h3 className="max-w-[250px] mb-3">
          {React.string(
            "The task of Fizz-Buzz is: Print integers one-to-N, but print “Fizz” if an integer is divisible by three, “Buzz” if an integer is divisible by five, and “FizzBuzz” if an integer is divisible by both three and five.",
          )}
        </h3>
        <p> {React.string("Input where you want to stop")} </p>
        <input
          type_="number"
          className="max-w-[100px]"
          value={fizzBuzzStop->Belt.Int.toString}
          min="0"
          id="fizzBuzzInput"
          onChange={handleFizzBuzzStopChange}
        />
      </div>
      <pre
        className="transition max-w-[500px] h-[300px] mx-5 mb-3 p-5 overflow-y-scroll bg-red-300 rounded-xl drop-shadow-lg hover:drop-shadow-2xl">
        <code>
          {React.string(`function fizzBuzz (stop) {
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
}`)}
        </code>
      </pre>
      {fizzBuzzStop->Js.Int.toString->Js.String2.length != 0 && fizzBuzzStop != 0
        ? <div
            className="transition min-w-[150px] h-[300px] mx-5 mb-3 p-5 bg-red-200 rounded-xl overflow-y-scroll drop-shadow-lg hover:drop-shadow-2xl">
            {fizzBuzzitems->React.array}
          </div>
        : <> </>}
    </div>
  </section>
}
