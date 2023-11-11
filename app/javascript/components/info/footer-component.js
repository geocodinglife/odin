let pathName = new URL(import.meta.url).pathname;
let name = pathName.split("/").pop().replace(".js", "");

export default class FooterComponent extends HTMLElement {
    static async components() {
        return await (await fetch(pathName.replace(".js", ".html"))).text();
    }

    constructor() {
        super();
        this.attachShadow({ mode: "open" });
    }

    connectedCallback() {
        Promise.resolve(FooterComponent.components()).then(html => {
            this.shadowRoot.innerHTML = html;
        })
    }
}

customElements.define(name, FooterComponent);