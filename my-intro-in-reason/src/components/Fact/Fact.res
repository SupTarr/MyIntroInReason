// Fact.res
%%raw("import '../../input.css'")

type myFact = {id: string, question: string, answer: string}

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
  /*
  Belt.Array.map
  (
    myFacts,
    (fact) => {
      <div className="bg-red-400 max-w-[100px]" id={fact.id}>
        <p> {React.string(fact.question)} </p>
        <p> {React.string(fact.answer)} </p>
      </div>
    },
  )
  */
  <div> </div>
}

