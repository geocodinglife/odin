let pathName = new URL(import.meta.url).pathname;
let name = pathName.split("/").pop().replace(".js", "");

export default class AlertaVender extends HTMLElement {
    static async components() {
        return await (await fetch(pathName.replace(".js", ".html"))).text();
    }

    constructor() {
        super();
        this.attachShadow({ mode: "open" });
    }

    connectedCallback() {
        Promise.resolve(AlertaVender.components()).then(html => {
            this.shadowRoot.innerHTML = html;

            this.DescripcionTextArea = this.shadowRoot.querySelector("#descripcion")
            this.contadorDescripcion = this.shadowRoot.querySelector("#contador-descripcion")
            this.DescripcionTextArea.addEventListener('input', (e)=>{
                let contador = e.target.value
                this.contadorDescripcion.innerHTML = `${contador.length}`
            })
            this.BotonCerrar = this.shadowRoot.querySelector("#x-cerrar-alerta");
            this.AlertScreen = this.shadowRoot.querySelector("#screen-alert");
            this.BotonCerrar.addEventListener("click", e=>{
                this.AlertScreen.remove()
            })
        })
    }
}

customElements.define(name, AlertaVender);