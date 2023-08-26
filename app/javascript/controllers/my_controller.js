// controllers/my_controller.js

import { Controller } from "stimulus";

export default class extends Controller {
  handleClick(event) {
    event.preventDefault();
    
    alert("¡Has hecho clic en el enlace 'Mis Compras'!");
    
    // Aquí puedes agregar más acciones si es necesario
  }
}
