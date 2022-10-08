// Generated by ReScript, PLEASE EDIT WITH CARE

import * as Curry from "rescript/lib/es6/curry.js";
import * as React from "react";
import * as FizzBuzz from "./codeChallenge/fizzBuzz.bs.js";
import * as Js_string from "rescript/lib/es6/js_string.js";
import * as FileSizeCalculation from "./codeChallenge/fileSizeCalculation.bs.js";

import '../../input.css'
;

function Challenge(Props) {
  var match = React.useState(function () {
        return 0;
      });
  var setFizzBuzzStop = match[1];
  var fizzBuzzStop = match[0];
  var handleFizzBuzzStopChange = function ($$event) {
    var value = $$event.currentTarget.value;
    if (Js_string.charAt(0, value) === "0") {
      return Curry._1(setFizzBuzzStop, (function (param) {
                    return 0;
                  }));
    } else {
      return Curry._1(setFizzBuzzStop, (function (param) {
                    return value;
                  }));
    }
  };
  var fizzBuzzitems = FizzBuzz.fizzBuzz(fizzBuzzStop).map(function (fizz, index) {
        return React.createElement("li", {
                    key: String(index)
                  }, fizz);
      });
  var fileSizeCalitems = FileSizeCalculation.fileSizeCalculation(FileSizeCalculation.files).map(function (file, index) {
        return React.createElement("li", {
                    key: String(index)
                  }, file);
      });
  return React.createElement(React.Fragment, undefined, React.createElement("section", undefined, React.createElement("h2", {
                      className: "text-center text-xl font-bold mt-10 mb-2"
                    }, "Fizz-Buzz Challenge"), React.createElement("div", {
                      className: "flex flex-wrap max-w-[1000px] mx-auto justify-around"
                    }, React.createElement("div", {
                          className: "mx-5 mb-3"
                        }, React.createElement("h3", {
                              className: "max-w-[250px] mb-3"
                            }, "The task of Fizz-Buzz is: Print integers one-to-N, but print “Fizz” if an integer is divisible by three, “Buzz” if an integer is divisible by five, and “FizzBuzz” if an integer is divisible by both three and five."), React.createElement("p", undefined, "Input where you want to stop"), React.createElement("input", {
                              className: "max-w-[100px]",
                              id: "fizzBuzzInput",
                              min: "0",
                              type: "number",
                              value: String(fizzBuzzStop),
                              onChange: handleFizzBuzzStopChange
                            })), React.createElement("pre", {
                          className: "transition max-w-[500px] h-[300px] mx-5 mb-3 p-5 overflow-y-scroll bg-red-300 rounded-xl drop-shadow-md hover:drop-shadow-2xl hover:scale-105"
                        }, React.createElement("code", undefined, "function fizzBuzz (stop) {\r\n  let result = [];\r\n  for (var i = 1; i <= stop; i++) {\r\n    if (i % 15 === 0) {\r\n      result.push(\"FizzBuzz\");\r\n    } else if (i % 3 === 0) {\r\n      result.push(\"Fizz\");\r\n    } else if (i % 5 === 0) {\r\n      result.push(\"Buzz\");\r\n    } else {\r\n      result.push(i.toString());\r\n    }\r\n  }\r\n  return result\r\n}")), fizzBuzzStop.toString().length !== 0 && fizzBuzzStop !== 0 ? React.createElement("div", {
                            className: "transition min-w-[150px] h-[300px] mx-5 mb-3 p-5 bg-red-200 rounded-xl overflow-y-scroll drop-shadow-md hover:drop-shadow-2xl hover:scale-105"
                          }, fizzBuzzitems) : React.createElement(React.Fragment, undefined))), React.createElement("p", undefined, fileSizeCalitems));
}

var make = Challenge;

export {
  make ,
}
/*  Not a pure module */
