// src/Test.res
@react.component
let make = () => {
  <div> {React.string("Hello World")} </div>
}

/* let element = <h1> {React.string("Hello World")} </h1>

let wrapChildren = (children: React.element) => {
  <div>
    <h1> {React.string("Overview")} </h1>
    children
  </div>
}

wrapChildren(<div> {React.string("Let's use React with ReScript")} </div>)

let greeting = React.string("Hello ")
let name = React.string("Stranger");

// element is also of type React.element
let element = <div className="myElement"> greeting name </div>

React.string("Hello") // new element representing "Hello"
React.int(1) // new element representing "1"
React.float(1.0) // new element representing "1.0"

let element = React.array([
  React.string("element 1"),
  React.string("element 2"),
  React.string("element 3")
])

switch(ReactDOM.querySelector("#root")){
| Some(root) => ReactDOM.render(<div> {React.string("Hello Andrea")} </div>, root)
| None => () // do nothing
} */