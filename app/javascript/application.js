// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "trix"
import "@rails/actiontext"
import "@fortawesome/fontawesome-free"

// new Code.

import './components/alert/alerta-registro.js';
import './components/alert/alerta-inicio-sesion.js';
import './components/alert/alerta-vender.js';
import './components/alert/alerta-vender-dos.js';
import './components/alert/creado-exitosamente.js';
import './components/alert/menu-nav-opciones.js';
import './components/info/footer-component.js';
import './components/info/productos-para-ti.js'
import './components/alert/alerta-notificara-vendedor.js';
import './components/alert/nuevo-cliente.js';
import './components/alert/nuevo-cliente-dos.js';
import './components/alert/nueva-tarjeta.js';
import './components/alert/evita-robos.js';
import './components/alert/alerta-pin.js';
import './components/alert/card-producto.js';


//Cargar los elementos de las categorias
let categorias = document.querySelector('#categorias-box');
(function insertarItemsEnCategorias() {
    let categoriasHtml = '';
    let ItemsCategoriasArray = [
        {
            item: './assets/images/Contenido/Odín/Vehículos.svg',
        },
        {
            item: './assets/images/Contenido/Odín/Inmuebles.svg',
        },
        {
            item: './assets/images/Contenido/Odín/Alquiler.svg',
        },
        {
            item: './assets/images/Contenido/Odín/Servicios.svg',
        },
        {
            item: './assets/images/Contenido/Odín/Electrónica.svg',
        },
        {
            item: './assets/images/Contenido/Odín/Tecnología.svg',
        },
        {
            item: './assets/images/Contenido/Odín/Muebles.svg',
        },
        {
            item: './assets/images/Contenido/Odín/Deportes.svg',
        },
        {
            item: './assets/images/Contenido/Odín/Belleza.svg',
        },
        {
            item: './assets/images/Contenido/Odín/Niños.svg',
        },
        {
            item: './assets/images/Contenido/Odín/Libros.svg',
        },
        {
            item: './assets/images/Contenido/Odín/Mascotas.svg',
        },
        {
            item: './assets/images/Contenido/Odín/Empleos.svg',
        },

    ]
    ItemsCategoriasArray.forEach(element => {
        categoriasHtml += `
        <div class="categorias-item-box">
            <div class="categorias-item">
                <img src=${element.item}>
            </div>
        </div>
    `
    });

    categorias.insertAdjacentHTML('beforeend', categoriasHtml);
})()

//Fin cargar los elementos de las categorias


//Cargar productos destacados
let destacados = document.querySelector('#contenido-destacados');
(function insertarItemsEnCategorias() {
    let destacadosHtml = '';
    let ItemsCategoriasArray = [
        {
            item: ''
        },
        {
            item: ''
        },
        {
            item: ''
        },
        {
            item: ''
        },
        {
            item: ''
        },
        {
            item: ''
        },
        {
            item: ''
        },
        {
            item: ''
        },
        {
            item: ''
        },
        {
            item: ''
        },
        {
            item: ''
        },
        {
            item: ''
        },
        {
            item: ''
        }
    ]
    ItemsCategoriasArray.forEach((element, index) => {
        destacadosHtml += `
    <div class="producto-item">
    <div class="header-item">
    <i class="icon-heart" id="${index}"></i>
        Hervidor de agua
    </div>
    <div class="imagen">
        <img src="https://falabella.scene7.com/is/image/FalabellaCO/881653694_1?wid=800&hei=800&qlt=70" alt="">
    </div>
    <div class="resenas">
        <i class="icon-star-empty"></i>
        <i class="icon-star-empty"></i>
        <i class="icon-star-empty"></i>
        <i class="icon-star-empty"></i>
        <i class="icon-star-empty"></i>
        <span>546 reseñas</span>
    </div>
    <div class="precio-info">

        <span>59.000</span>
        <button>
            Más información
        </button>
    </div>
</div>
    `
    });

    destacados.insertAdjacentHTML('afterbegin', destacadosHtml);
})()
//Fin cargar productos destacados


//Cargar grandes ofertas
let grandesOfertas = document.querySelector('#contenido-ofertas');
(function insertarItemsEnCategorias() {
    let ofertasHtml = '';
    let ItemsCategoriasArray = [
        {
            item: ''
        },
        {
            item: ''
        },
        {
            item: ''
        },
        {
            item: ''
        },
        {
            item: ''
        },
        {
            item: ''
        },
        {
            item: ''
        },
        {
            item: ''
        },
        {
            item: ''
        },
        {
            item: ''
        },
        {
            item: ''
        },
        {
            item: ''
        },
        {
            item: ''
        }
    ]
    ItemsCategoriasArray.forEach((element, index)=> {
        ofertasHtml += `
    <div class="producto-item">
    <div class="header-item">
    <i class="icon-heart" id="${index}a"></i>
        Hervidor de agua
    </div>
    <div class="imagen">
        <img src="https://falabella.scene7.com/is/image/FalabellaCO/881653694_1?wid=800&hei=800&qlt=70" alt="">
    </div>
    <div class="resenas">
            <i class="icon-star-empty"></i>
            <i class="icon-star-empty"></i>
            <i class="icon-star-empty"></i>
            <i class="icon-star-empty"></i>
            <i class="icon-star-empty"></i>

            <div class="items-sobrepuestos">
            <i class="icon-star"></i>
            <i class="icon-star"></i>
            <i class="icon-star"></i>
            <i class="icon-star"></i>
            <i class="icon-star"></i>
            </div>

        <span>546 reseñas</span>
    </div>
    <div class="precio-info">
        <span>59.000</span>
        <button>
            Más información
        </button>
    </div>
</div>
    `
    });

    grandesOfertas.insertAdjacentHTML('afterbegin', ofertasHtml);
})()
//Fin cargar grandes ofertas



// Variable del tamaño de la sección
let maxHeightDestacados = 380;
//'Ver más' grandes ofertas
const verMasDestacadosBoton = document.querySelector('#destacados-ver-mas');
const contenidoDestacados = document.querySelector('#contenido-destacados');
verMasDestacadosBoton.addEventListener('click', (e)=>{
    //Aquí debería ir la lógica de una petición, y si no se encuentra más
    //contenido dejar de aumentar el max-height
    if(window.innerWidth < 992){
        maxHeightDestacados += 1900
    }else{
        maxHeightDestacados += 380;
    }
    contenidoDestacados.style.setProperty("max-height", `${maxHeightDestacados}px`);
})


// Variable del tamaño de la sección
let maxHeightOfertas = 380;
//'Ver más' productos destacados
const verMasOfertasBoton = document.querySelector('#ofertas-ver-mas');
const contenidoOfertas = document.querySelector('#contenido-ofertas');
verMasOfertasBoton.addEventListener('click', (e)=>{    
    //Aquí debería ir la lógica de una petición, y si no se encuentra más
    //contenido dejar de aumentar el max-height
    if(window.innerWidth < 992){
        maxHeightOfertas += 1900
    }else{
        maxHeightOfertas += 380;
    }
    contenidoOfertas.style.setProperty("max-height", `${maxHeightOfertas}px`);
})

//íconos de corazón
const iconosCorazon = document.querySelectorAll('.icon-heart');
iconosCorazon.forEach(element => {
    let item = false;
    element.addEventListener('click', (e)=>{
        item = !item
        if(item){
            element.style.color = 'red'
        }else{
            element.style.color = 'gray'
        }
    })
});


//Botón de registro
const botonRegistrarse = document.querySelector('#registrarse-boton');
botonRegistrarse.addEventListener('click', (e)=>{
    let alertaRegistro = `<alerta-registro></alerta-registro>`
    let parser = new DOMParser();
    let fragmentoAInsertar = parser.parseFromString(alertaRegistro, "text/html");
    // Extrae el contenido de la plantilla
    let contenido = fragmentoAInsertar.body.firstChild;

    document.body.appendChild(contenido)
})

//Botón de iniciar sesión
const botonIniciarSesion = document.querySelector('#iniciar-sesion-boton');
botonIniciarSesion.addEventListener('click', (e)=>{
    let alertaInicioSesion = `<alerta-inicio-sesion></alerta-inicio-sesion>`
    let parser = new DOMParser();
    let fragmentoAInsertar = parser.parseFromString(alertaInicioSesion, "text/html");
    // Extrae el contenido de la plantilla
    let contenido = fragmentoAInsertar.body.firstChild;

    document.body.appendChild(contenido)
})

//Botón de vender

/* const botonQuieroVender = document.querySelector('#quiero-vender-boton');
botonQuieroVender.addEventListener('click', (e)=>{
    let alertaQuieroVender = `<alerta-vender></alerta-vender>`
    let parser = new DOMParser();
    let fragmentoAInsertar = parser.parseFromString(alertaQuieroVender, "text/html");
    // Extrae el contenido de la plantilla
    let contenido = fragmentoAInsertar.body.firstChild;

    document.body.appendChild(contenido)
}) */
