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
      if (list) {
        const temp = list.split(" ");
        if (temp) {
          listName.push(temp[0]);
          listSize.push(temp[1]);
        }
      }
    });
    const resultType = [];
    const resultSize = [];
    for (let i = 0; i < listName.length; i++) {
      if (listName[i]) {
        let type = listName[i].split(".");
        console.log(type);
        if (type.length > 1) {
          type = type[type.length - 1];
          if (listSize[i]) {
            let size = listSize[i].split("b");
            if (size.length > 1) {
              resultSize.push(size[0]);
            }
          }
        }
        if (type === "mp3" || type === "aac" || type === "flac") {
          resultType.push("music");
        } else if (type === "jpg" || type === "bmp" || type === "gif") {
          resultType.push("images");
        } else if (type === "mp4" || type === "avi" || type === "mkv") {
          resultType.push("movies");
        } else {
          resultType.push("other");
        }
      } else {
        listName.pop(i);
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
  let (filesList, setfilesList) = React.useState(_ => files)
  let handleFilesListChange = event => {
    let value = ReactEvent.Form.currentTarget(event)["value"]
    setfilesList(_ => value)
  }

  let fileSizeCalitems = fileSizeCalculation(filesList)->Js.Array2.mapi((file, index) => {
    <li key={index->Belt.Int.toString}> {React.string(file)} </li>
  })

  <section>
    <h2 className="text-center text-xl font-bold mt-10 mb-2">
      {React.string("File Size Calculation Challenge")}
    </h2>
    <div className="flex flex-wrap max-w-[1200px] mx-auto justify-around">
      <div className="mx-5 mb-3">
        <h3 className="max-w-[350px]">
          {React.string(
            "You want to know how many bytes of memory each file type is consuming. Each file has a name, and the part of the name after the last dot is called the file extension, which identifies what type of file it is. We distinguish four broad types of file:",
          )}
        </h3>
        <ul className="max-w-[300px] mb-3">
          <li> {React.string("• music (only extensions: mp3, aac, flac)")} </li>
          <li> {React.string("• Image (only extensions: jpg, bmp.gif)")} </li>
          <li> {React.string("• movie (only extensions: mp4, avi, mkv)")} </li>
          <li> {React.string("• other (all other extensions; for example: 7z, txt, zip)")} </li>
        </ul>
        <p className="pb-2"> {React.string("Input a list of files")} </p>
        <textarea
          style={ReactDOM.Style.make(~resize="none", ())}
          className="p-2 rounded-lg"
          value={filesList}
          rows=5
          cols=20
          id="filesListInput"
          onChange={handleFilesListChange}
        />
      </div>
      <pre
        className="transition max-w-[500px] h-[400px] mx-5 mb-3 p-5 overflow-scroll bg-red-300 rounded-xl drop-shadow-lg hover:drop-shadow-2xl">
        <code>
          {React.string(`function (fileList) {
  const lists = fileList.split("\\n");
  const listName = [];
  const listSize = [];
  lists.forEach((list) => {
    if (list) {
      const temp = list.split(" ");
      if (temp) {
        listName.push(temp[0]);
        listSize.push(temp[1]);
      }
    }
  });
  const resultType = [];
  const resultSize = [];
  for (let i = 0; i < listName.length; i++) {
    if (listName[i]) {
      let type = listName[i].split(".");
      console.log(type);
      if (type.length > 1) {
        type = type[type.length - 1];
        if (listSize[i]) {
          let size = listSize[i].split("b");
          if (size.length > 1) {
            resultSize.push(size[0]);
          }
        }
      }
      if (type === "mp3" || type === "aac" || type === "flac") {
        resultType.push("music");
      } else if (type === "jpg" || type === "bmp" || type === "gif") {
        resultType.push("images");
      } else if (type === "mp4" || type === "avi" || type === "mkv") {
        resultType.push("movies");
      } else {
        resultType.push("other");
      }
    } else {
      listName.pop(i);
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
      {fileSizeCalitems->Js.Array2.length != 0
        ? <div
            className="transition min-w-[150px] h-[150px] mx-5 mb-3 p-5 bg-red-200 rounded-xl overflow-y-scroll drop-shadow-lg hover:drop-shadow-2xl">
            {fileSizeCalitems->React.array}
          </div>
        : <> </>}
    </div>
  </section>
}
