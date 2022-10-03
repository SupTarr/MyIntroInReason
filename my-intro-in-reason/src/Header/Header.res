// Header.res
%%raw("import '../input.css'");

@react.component
let make = (~name: option<string>=?) => {
  let greeting = switch name {
    | Some(name) => "Hello, I am " ++ name ++ "!"
    | None => "Hello stranger!"
  }
  <section className="flex flex-wrap justify-around"> 
    <div className="font-mono text-blue-400 hover:text-lg">
      {React.string(greeting)} 
    </div>
    <figure>
      <img className="max-w-[200px]" src="../profile.jpg" alt="My Profile Picture" />
    </figure>
  </section>
}