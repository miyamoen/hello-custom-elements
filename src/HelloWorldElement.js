class HelloWorldElement extends HTMLElement {
  constructor() {
    super();
  }
  connectedCallback() {
    const shadow = this.attachShadow({ mode: "open" });
    shadow.textContent = "Hello, World!";
  }

  static get observedAttributes() {
    return [];
  }
  attributeChangedCallback(name, oldValue, newValue) {}
}

export default {
  setup() {
    customElements.define("hello-world", HelloWorldElement);
  }
};
