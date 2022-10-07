// Fact.res
%%raw("import '../../input.css'")

type myFact = {id: string, question: string, answer: string}
type colorRGB = {r: int, g: int, b: int}

let myFacts = [
  {id: "fact1", question: "My name is", answer: "Tata"},
  {id: "fact2", question: "My name is", answer: "Tata"},
  {id: "fact3", question: "My name is", answer: "Tata"},
  {id: "fact4", question: "My name is", answer: "Tata"},
  {id: "fact5", question: "My name is", answer: "Tata"},
  {id: "fact6", question: "My name is", answer: "Tata"},
  {id: "fact7", question: "My name is", answer: "Tata"},
  {id: "fact8", question: "My name is", answer: "Tata"},
  {id: "fact9", question: "My name is", answer: "Tata"},
]

@react.component
let make = () => {
  let componentToHex = c => {
    let hex = Js.Int.toStringWithRadix(c, ~radix=16)
    Js.String.length(hex) == 1 ? "0" ++ hex : hex
  }

  let rgbToHex = (r, g, b) => {
    "#" ++ componentToHex(r) ++ componentToHex(g) ++ componentToHex(b)
  }

  let generateRandomColor = (mix: colorRGB) => {
    let red = ref(Js.Math.random_int(0, 256))
    let green = ref(Js.Math.random_int(0, 256))
    let blue = ref(Js.Math.random_int(0, 256))

    // mix the color
    red := (red.contents + mix.r) / 2
    green := (green.contents + mix.g) / 2
    blue := (blue.contents + mix.b) / 2

    let color = rgbToHex(red.contents, green.contents, blue.contents)
    color
  }

  let items = myFacts->Js.Array2.mapi((fact, index) => {
    let randomHex = generateRandomColor({r: 255, g: 255, b: 255})
    <div style={ReactDOM.Style.make(~backgroundColor=`${randomHex}`, ())} className="transition mx-5 my-2 p-2 rounded-lg min-w-[250px] drop-shadow-md hover:drop-shadow-2xl hover:scale-110" id={fact.id}>
      <p>
        <strong> {("Question " ++ Belt.Int.toString(index + 1) ++ ": ")->React.string} </strong>
        {React.string(fact.question)}
      </p>
      <p> {React.string("Answer: " ++ fact.answer)} </p>
    </div>
  })

  <section className="max-w-[1000px] mx-auto">
    <h2 className="text-center text-2xl font-bold mt-5 mb-2"> {React.string("My Fact")} </h2>
    <div className="flex flex-wrap justify-center"> {items->React.array} </div>
  </section>
}
