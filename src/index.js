class HelloWorldElement extends HTMLElement {
  constructor() {
    super();
  }
  connectedCallback() {
    this.textContent = "Hello, World!";
  }
}

customElements.define("hello-world", HelloWorldElement);

const app = window.Elm.Main.init({
  flags: {},
  node: document.getElementById("elm")
});
