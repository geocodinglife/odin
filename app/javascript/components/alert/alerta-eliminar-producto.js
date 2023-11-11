let pathName = new URL(import.meta.url).pathname;
let name = pathName.split("/").pop().replace(".js", "");

export default class AlertaEliminarProducto extends HTMLElement {
    static async components() {
        return await (await fetch(pathName.replace(".js", ".html"))).text();
    }

    constructor() {
        super();
        this.attachShadow({ mode: "open" });
    }

    connectedCallback() {
        Promise.resolve(AlertaEliminarProducto.components()).then(html => {
            this.shadowRoot.innerHTML = html;
            this.BotonCerrar = this.shadowRoot.querySelector("#x-cerrar-alerta");
            this.AlertScreen = this.shadowRoot.querySelector("#screen-alert");
            this.BotonRojoCerrar =this.shadowRoot.querySelector('#boton-cerrar');

            this.BotonCerrar.addEventListener("click", e=>{
                this.AlertScreen.remove()
            })

            this.BotonRojoCerrar.addEventListener("click", e=>{
                this.AlertScreen.remove()
            })
        })
    }
}

customElements.define(name, AlertaEliminarProducto);