// Challenge.res
%%raw("import '../../input.css'")

@react.component
let make = () => {
  let fizzBuzzitems = FizzBuzz.fizzBuzz(100)->Js.Array2.map(fizz => {
    <p> {React.string(fizz)} </p>
  })

  let fileSizeCalitems = FileSizeCalculation.fileSizeCalculation(
    FileSizeCalculation.files,
  )->Js.Array2.map(file => {
    <p> {React.string(file)} </p>
  })

  <>
    <p> {fizzBuzzitems->React.array} </p>
    <p> {fileSizeCalitems->React.array} </p>
  </>
}
