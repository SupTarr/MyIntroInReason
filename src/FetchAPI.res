let v2_base = "https://pokeapi.co/api/v2/pokemon/"

open Promise

let _ =
  Fetch.get(v2_base ++ "pikachu")
  ->then(response => response->Fetch.Response.text)
  ->then(data => data->Js.log->resolve)
  ->catch(err => {
    switch err {
    | JsError(obj) =>
      obj->Js.Exn.message->Belt.Option.getWithDefault("Must be some non-error value")->Js.log
    | _ => Js.log("Some unknown error")
    }
    resolve()
  })
