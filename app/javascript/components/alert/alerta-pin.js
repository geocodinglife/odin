let pathName = new URL(import.meta.url).pathname;
let name = pathName.split("/").pop().replace(".js", "");

export default class AlertaPin extends HTMLElement {
    static async components() {
        return await (await fetch(pathName.replace(".js", ".html"))).text();
    }

    constructor() {
        super();
        this.attachShadow({ mode: "open" });
    }

    connectedCallback() {
        Promise.resolve(AlertaPin.components()).then(html => {
            this.shadowRoot.innerHTML = html;
            this.BotonCerrar = this.shadowRoot.querySelector("#x-cerrar-alerta");
            this.AlertaScreen = this.shadowRoot.querySelector("#screen-alert")

            this.BotonCerrar.addEventListener("click", e=>{
                this.AlertaScreen.style.display = 'none'
            })
        })
    }
}

customElements.define(name, AlertaPin);