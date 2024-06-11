function listarQuestionario() {
  // Verifica se o usuário está logado
  if (usuarioLogado) {
    console.log("usuarioLogado", usuarioLogado)
    const url = `${urlbase}/listarquestionario`;

    const options = {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify({ idusuario: usuarioLogado.idusuario }),
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
        if( data.questoes ){
          let questoes = "";
          for (i = 0; i < data.questoes.length; i++) {
            questoes += `<div class='questao'>
            <div class='linha-enunciado'>${[i+1]}) ${data.questoes[i].enunciado}</div>
            <div class='linha-alternativa'>
              <p class ='respondido'>Respondido: ${data.questoes[i].respondido}</p>
              <p>|</p>
              <p class = 'correto'> Correto: ${data.questoes[i].correto}</p>
            </div>
          </div>`;
          }
          document.getElementById("saida").innerHTML = `<h3>Questões</h3>${questoes}`;
        }

      })
      .catch((error) => {
        console.error("Erro:", error);
      });
  }
}
