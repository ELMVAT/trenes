console.log("hola mundo");

const apiUrl = "http://localhost:8082";

const login = async () => {
	const username = document.getElementById("username").value;
	const password = document.getElementById("password").value;
	console.log(username, password);
	const config = {
		method: "POST",
		headers: {
			"Content-type": "application/json",
		},
		body: JSON.stringify({
			userName: username,
			password: password,
		}),
	};
	const request = await fetch(`${apiUrl}/login`, config);
	const response = await request.json();
	console.log(response);
	if (!response.success) {
		alert("Usuario o contraseña incorrectos");
		return;
	}
	const { token } = response;
	localStorage.setItem("token", token);
	window.location.href = "./loggedin.html";
};
let tren;
const getTrains = async () => {
	const request = await fetch(`${apiUrl}/tren`);
	const response = await request.json();
	const { results } = response;
	let html = "";
	tren = results;
	results.forEach((tren) => {
		html += `<option value="${tren.ID_TREN - 1}">Tren ${tren.ID_TREN}</option>`;
	});
	document.getElementById("trainsSelect").innerHTML += html;
	console.log(response);
};

const updateSits = (id) => {
    if(id === 'seleccione'){
        return document.getElementById("asientos").innerText = ``;
    }
	console.log(id);
	document.getElementById("asientos").innerText = `Asientos disponibles: ${tren[id].ASIENTOS_TREN - tren[id].VENDIDOS}`;
};

if (window.location.href.includes("loggedin.html")) {
	getTrains();
}