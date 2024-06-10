document.addEventListener("DOMContentLoaded", () => {
    verificarStatusUsuario();
});

function verificarStatusUsuario() {
    let usuario = localStorage.getItem("usuario");
    if (usuario) {
        usuario = JSON.parse(usuario);
        if (usuario.idusuario) {
            // Configuração da requisição
            const urlbase = "http://localhost:3030";  // Replace with your actual API base URL
            const url = `${urlbase}/questao/status`;
            const options = {
                method: "POST",
                headers: {
                    "Content-Type": "application/json",
                },
                body: JSON.stringify({ idusuario: usuario.idusuario }),
            };

            fetch(url, options)
                .then(response => {
                    if (!response.ok) {
                        throw new Error("Erro na requisição");
                    }
                    return response.json();
                })
                .then(data => {
                    if (data.passed) {
                        // Usuário passou no questionário
                        document.getElementById("box-curso").classList.remove("hidden");
                        document.getElementById("box-certificado").classList.remove("hidden");
                    } else {
                        // Usuário não passou no questionário
                        document.getElementById("box-curso").classList.add("hidden");
                        document.getElementById("box-certificado").classList.add("hidden");
                        alert("Você precisa passar no questionário para acessar estas opções.");
                    }
                })
                .catch(error => {
                    console.error("Erro:", error);
                });
        } else {
            alert("Usuário não identificado. Efetue o login para continuar.");
        }
    } else {
        alert("Efetue o login para continuar.");
    }
}
