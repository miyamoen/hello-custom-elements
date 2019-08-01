class NonStringSelectElement extends HTMLElement {
  constructor() {
    super();
  }
  connectedCallback() {
    this.root = this.attachShadow({ mode: "open" });
    // requestAnimationFrame(() => render(this, this.root));
  }

  static get observedAttributes() {
    return ["change-key"];
  }
  attributeChangedCallback(name, oldValue, newValue) {
    if (name === "change-key") {
      requestAnimationFrame(() => render(this, this.root));
    }
  }
}

export default {
  setup() {
    customElements.define("non-string-select", NonStringSelectElement);
  }
};

const render = (host, root) => {
  console.log("きたわよ");

  const options = host.querySelectorAll("option");
  root.textContent = "ここにすばらしいセレクトボックスが表示される";

  console.log(options);
  console.log(options[0].value);

  root.append(options);
};
