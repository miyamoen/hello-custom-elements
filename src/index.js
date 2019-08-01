import HelloWorldElement from "./HelloWorldElement";
import NonStringSelectElement from "./NonStringSelectElement";

HelloWorldElement.setup();
NonStringSelectElement.setup();

const app = window.Elm.Main.init({
  flags: {},
  node: document.getElementById("elm")
});

const log = e => console.log(e) && e;
