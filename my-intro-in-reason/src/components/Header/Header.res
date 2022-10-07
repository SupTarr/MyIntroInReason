// Header.res
%%raw("import '../../input.css'")

@react.component
let make = (~name: option<string> = ?) => {
  let greeting = switch name {
  | Some(name) => "Hello, I am " ++ name ++ "!"
  | None => "Hello stranger!"
  }

  <section className="flex flex-wrap items-center justify-center flex-col md:justify-around md:flex-row max-w-[1000px] mx-auto my-4">
    <div className="my-4 transition text-center text-2xl font-bold hover:scale-x-110"> 
      {React.string(greeting)} 
    </div>
    <figure>
      <img className="max-w-[200px] mx-auto rounded-xl" src="../profile.jpg" alt="My Profile Picture" />
    </figure>
  </section>
}
