function exibirCertificado() {
    // Verifica se o usuário está logado
    if (!usuarioLogado) {
        // Esconde o botão de logout
        document.getElementById("botao-logout").style.display = "none";
        document.getElementById("botao-perfil").style.display = "none";
        document.getElementById("saida").innerHTML =
            "<p>O usuário não está logado. Clique para efetuar o <a href='./login.html'>login</a>.</p>";
    } else {
        // Configuração da requisição
        const url = `${urlbase}/questao`;

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
                console.log(data);
                //verifica se existe algum erro
                if (data.erro) {
                    alert(data.erro);
                }
                if (data.idquestionario) {
                    document.getElementById("exibirCertificado").innerHTML = `
                        <div>                    
                            <h2>Certificado </h2>
                            <p>Acesse seu certificado </p>
                            <br>
                        </div>
                        <a href="certificado.html"><button class="texto-botao">Acessar Certificado</button></a>
                    `;
                } else {
                    document.getElementById("exibirCertificado").style.display = "block";
                }
            })
            .catch((error) => {
                console.error("Erro:", error);
            });
    }
}
