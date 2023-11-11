let pathName = new URL(import.meta.url).pathname;
let name = pathName.split("/").pop().replace(".js", "");

export default class menuNavOpciones extends HTMLElement {
    static async components() {
        return await (await fetch(pathName.replace(".js", ".html"))).text();
    }

    constructor() {
        super();
        this.attachShadow({ mode: "open" });
    }

    connectedCallback() {
        Promise.resolve(menuNavOpciones.components()).then(html => {
            this.shadowRoot.innerHTML = html;
            this.BotonCerrar = this.shadowRoot.querySelector("#x-cerrar-alerta");
            this.OpcionesMenu = this.shadowRoot.querySelector("#opciones-menu");

            this.MenuHamburguesa = this.shadowRoot.querySelector('#menu-hamburguesa');
            this.MenuHamburguesa.addEventListener("click", e=>{
                this.OpcionesMenu.style.display = 'flex'
            })

            this.BotonCerrar.addEventListener("click", e=>{
                this.OpcionesMenu.style.display = 'none'
            })
        })
    }
}

customElements.define(name, menuNavOpciones);