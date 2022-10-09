// Header.res
%%raw("import '../../input.css'")

@react.component
let make = (~name: option<string> = ?) => {
  let greeting = switch name {
  | Some(name) => "Hello, I am " ++ name ++ "!"
  | None => "Hello stranger!"
  }

  <section className="flex flex-wrap items-center justify-center flex-col md:justify-around md:flex-row max-w-[1000px] mx-auto my-5">
    <div className="my-4 transition text-center text-2xl font-bold hover:scale-110">
      {React.string(greeting)}
    </div>
    <figure>
      <img className="transition max-w-[200px] mx-auto rounded-xl drop-shadow-lg hover:scale-105 hover:drop-shadow-2xl" src="../profile.jpg" alt="My Profile Picture" />
    </figure>
  </section>
}
