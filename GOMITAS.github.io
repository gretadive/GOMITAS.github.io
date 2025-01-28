<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Gomitas Dulces</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      margin: 0;
      padding: 0;
      background-color: #FFDDC1; /* Color suave de fondo */
    }
    header {
      background-color: #FF6F61; /* Rosa vibrante */
      color: white;
      text-align: center;
      padding: 20px;
      border-bottom: 5px solid #D5E8D4; /* Línea creativa en verde suave */
    }
    h1 {
      margin: 0;
      font-size: 36px;
      letter-spacing: 2px;
    }
    p {
      font-size: 18px;
    }
    main {
      padding: 20px;
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
      gap: 20px;
      justify-content: center;
    }
    .producto {
      background: #ffffff; /* Blanco para los productos */
      border-radius: 8px;
      padding: 15px;
      box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
      text-align: center;
      transition: transform 0.3s ease-in-out;
    }
    .producto:hover {
      transform: scale(1.05); /* Efecto al pasar el mouse */
    }
    .producto img {
      width: 100%;
      height: auto;
      border-radius: 8px;
    }
    .nombre {
      font-size: 18px;
      font-weight: bold;
      margin-top: 10px;
      color: #FF6F61; /* Rosa vibrante */
    }
    .descripcion {
      font-size: 14px;
      color: #555;
      margin: 5px 0;
    }
    .seleccion {
      margin-top: 10px;
      font-size: 16px;
    }
    .cantidad {
      text-align: center;
      margin-top: 20px;
      font-size: 18px;
    }
    select {
      padding: 5px;
      font-size: 16px;
      width: 50%;
      margin-top: 10px;
      border-radius: 5px;
      background-color: #D5E8D4; /* Verde suave */
    }
    #total {
      font-weight: bold;
      color: #d32f2f;
    }
    button {
      background-color: #FF6F61;
      color: white;
      border: none;
      padding: 10px;
      font-size: 16px;
      cursor: pointer;
      width: 100%;
      margin-top: 10px;
      border-radius: 5px;
      transition: background-color 0.3s ease;
    }
    button:hover {
      background-color: #e65c54; /* Cambio de color al pasar el mouse */
    }
  </style>
</head>
<body>
  <header>
    <h1>Gomitas Dulces</h1>
    <p>Selecciona tus gomitas favoritas y luego elige la cantidad</p>
  </header>
  <main>
    <div class="producto">
      <img src="ruta-imagen-ambrosoli.jpg" alt="Gomitas Ambrosoli">
      <div class="nombre">Gomitas Ambrosoli</div>
      <div class="descripcion">Gomitas de gelatina sabor a fresa y frambuesa</div>
      <label class="seleccion">
        <input type="checkbox" class="gomita" value="Ambrosoli"> Elegir
      </label>
    </div>

    <div class="producto">
      <img src="ruta-imagen-ambrosito.jpg" alt="Ambrosito">
      <div class="nombre">Ambrosito</div>
      <div class="descripcion">Gomitas de gelatina sabores surtidos a fresa, naranja, limón, piña, manzana y cereza</div>
      <label class="seleccion">
        <input type="checkbox" class="gomita" value="Ambrosito"> Elegir
      </label>
    </div>

    <div class="producto">
      <img src="ruta-imagen-frugele.jpg" alt="Frugelé">
      <div class="nombre">Frugelé</div>
      <div class="descripcion">Gomas de gelatina sabor a fresa y/o frutilla, durazno, limón, manzana, naranja y piña</div>
      <label class="seleccion">
        <input type="checkbox" class="gomita" value="Frugelé"> Elegir
      </label>
    </div>

    <div class="producto">
      <img src="ruta-imagen-flipy.jpg" alt="Gomitas Flipy">
      <div class="nombre">Gomitas Flipy</div>
      <div class="descripcion">Gomas de gelatina con sabor a cereza.</div>
      <label class="seleccion">
        <input type="checkbox" class="gomita" value="Flipy"> Elegir
      </label>
    </div>

    <div class="producto">
      <img src="ruta-imagen-caliptus.jpg" alt="Gomitas Caliptus Cherry">
      <div class="nombre">Gomitas Caliptus Cherry</div>
      <div class="descripcion">Gomas de gelatina cubiertas con azúcar sabor cherry mentolado.</div>
      <label class="seleccion">
        <input type="checkbox" class="gomita" value="Caliptus Cherry"> Elegir
      </label>
    </div>
  </main>

  <div class="cantidad">
    <p>Selecciona la cantidad total en gramos:</p>
    <select id="gramos">
      <option value="50">50g</option>
      <option value="100">100g</option>
      <option value="500">500g</option>
      <option value="1000">1kg</option>
    </select>
    <p>Total: S/ <span id="total">0.00</span></p>
    <button onclick="realizarPago()">Pagar con Yape</button>
  </div>

  <script>
    function actualizarTotal() {
      let cantidad = parseInt(document.getElementById("gramos").value);
      let precioPorGramo = 0.05;
      let total = cantidad * precioPorGramo;
      document.getElementById("total").innerText = total.toFixed(2);
    }

    function realizarPago() {
      let seleccionadas = [];
      document.querySelectorAll(".gomita:checked").forEach(gomita => {
        seleccionadas.push(gomita.value);
      });

      if (seleccionadas.length === 0) {
        alert("Por favor, selecciona al menos una gomita.");
        return;
      }

      let cantidad = document.getElementById("gramos").value;
      let total = document.getElementById("total").innerText;

      let mensaje = `Hola, quiero comprar:\n\n` +
                    `🍬 ${seleccionadas.join(", ")}\n` +
                    `📦 Cantidad total: ${cantidad}g\n` +
                    `💰 Total: S/ ${total}\n\n` +
                    `¿Cómo puedo pagar con Yape?`;

      let enlaceYape = `https://wa.me/51987654321?text=${encodeURIComponent(mensaje)}`;
      window.location.href = enlaceYape;
    }

    document.getElementById("gramos").addEventListener("change", actualizarTotal);
    actualizarTotal();
  </script>
</body>
</html>
