function exibirCertificado(){
    let usuario = localStorage.getItem("usuario");
    if (!usuario) {
      document.getElementById("mostrarCertificado").style.display ="none"
      document.getElementById("saidaCertificado").innerHTML =
      "<p>Seu certificado ainda não está disponível.</p>";
    }
}

function processarEnvioRespostas(objeto) {
    // Configuração da requisição
    const url = `${urlbase}/questionario`;
  
    const options = {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify(objeto),
    };
  
    // Submete a requisição
    fetch(url, options)
      .then((response) => {
        if (!response.ok) {
          alert("Erro na requisição");
        }
        return response.json();
      })
      .then((data) => {
        if (data.nota) {
          alert(`Parabéns! Você foi aprovado com a nota ${data.nota}`);
          document.getElementById("mostrarCertificado").style.display = block;
        } else {
          alert(data.erro);
        }
      })
      .catch((error) => {
        alert(error);
      });
  }
  
  