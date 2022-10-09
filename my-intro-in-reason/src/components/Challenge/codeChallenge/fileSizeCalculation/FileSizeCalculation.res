// FileSizeCalculation.res
%%raw("import '../../../../input.css'")

let files = `my.song.mp3 11b
greatSong.flac 1000b
not3.txt 5b
video.mp4 200b
game.exe 100b
mov!e.mkv 10000b`

let fileSizeCalculation = %raw(`
  function (fileList) {
    const lists = fileList.split("\n");
    const listName = [];
    const listSize = [];
    lists.forEach((list) => {
      const temp = list.split(" ");
      listName.push(temp[0]);
      listSize.push(temp[1]);
    });
    const resultType = [];
    const resultSize = [];
    for (let i = 0; i < listName.length; i++) {
      let type = listName[i].split(".");
      type = type[type.length - 1];
      let size = listSize[i].split("b");
      resultSize.push(size[0]);
      if (type === "mp3" || type === "aac" || type === "flac") {
        resultType.push("music");
      } else if (type === "jpg" || type === "bmp" || type === "gif") {
        resultType.push("images");
      } else if (type === "mp4" || type === "avi" || type === "mkv") {
        resultType.push("movies");
      } else {
        resultType.push("other");
      }
    }
    let musicSize = 0;
    let imagesSize = 0;
    let moviesSize = 0;
    let otherSize = 0;
    for (let i = 0; i < listName.length; i++) {
      if (resultType[i] === "music") {
        musicSize += parseInt(listSize[i]);
      } else if (resultType[i] === "images") {
        imagesSize += parseInt(listSize[i]);
      } else if (resultType[i] === "movies") {
        moviesSize += parseInt(listSize[i]);
      } else {
        otherSize += parseInt(listSize[i]);
      }
    }
    let result = [];
    result.push("music " + musicSize + "b");
    result.push("images " + imagesSize + "b");
    result.push("movies " + moviesSize + "b");
    result.push("other " + otherSize + "b");
    return result;
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

  let fileSizeCalitems = fileSizeCalculation(files)->Js.Array2.mapi((file, index) => {
    <li key={index->Belt.Int.toString}> {React.string(file)} </li>
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
          {React.string(`function (fileList) {
  const lists = fileList.split("\\n");
  const listName = [];
  const listSize = [];
  lists.forEach((list) => {
    const temp = list.split(" ");
    listName.push(temp[0]);
    listSize.push(temp[1]);
  });
  const resultType = [];
  const resultSize = [];
  for (let i = 0; i < listName.length; i++) {
    let type = listName[i].split(".");
    type = type[type.length - 1];
    let size = listSize[i].split("b");
    resultSize.push(size[0]);
    if (type === "mp3" || type === "aac" || type === "flac") {
      resultType.push("music");
    } else if (type === "jpg" || type === "bmp" || type === "gif") {
      resultType.push("images");
    } else if (type === "mp4" || type === "avi" || type === "mkv") {
      resultType.push("movies");
    } else {
      resultType.push("other");
    }
  }
  let musicSize = 0;
  let imagesSize = 0;
  let moviesSize = 0;
  let otherSize = 0;
  for (let i = 0; i < listName.length; i++) {
    if (resultType[i] === "music") {
      musicSize += parseInt(listSize[i]);
    } else if (resultType[i] === "images") {
      imagesSize += parseInt(listSize[i]);
    } else if (resultType[i] === "movies") {
      moviesSize += parseInt(listSize[i]);
    } else {
      otherSize += parseInt(listSize[i]);
    }
  }
  let result = [];
  result.push("music " + musicSize + "b");
  result.push("images " + imagesSize + "b");
  result.push("movies " + moviesSize + "b");
  result.push("other " + otherSize + "b");
  return result;
}
`)}
        </code>
      </pre>
      {fizzBuzzStop->Js.Int.toString->Js.String2.length != 0 && fizzBuzzStop != 0
        ? <div
            className="transition min-w-[150px] h-[300px] mx-5 mb-3 p-5 bg-red-200 rounded-xl overflow-y-scroll drop-shadow-lg hover:drop-shadow-2xl">
            {fileSizeCalitems->React.array}
          </div>
        : <> </>}
    </div>
  </section>
}
