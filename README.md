# check-env

Um script simples em Bash para validar se todas as variáveis listadas em `.env.example` existem no arquivo `.env`.  
Ideal para uso em projetos que dependem de variáveis de ambiente e precisam garantir que o `.env` esteja completo antes de rodar.

## 🚀 Funcionalidades
- Verifica se `.env.example` e `.env` existem.
- Lista variáveis que estão no `.env.example` mas não estão no `.env`.
- Retorna erro (`exit 1`) se encontrar variáveis ausentes.
- Compatível com pipelines de CI/CD (interrompe o fluxo em caso de erro).

## 📦 Instalação
Clone o repositório e dê permissão de execução:
```bash
git clone https://github.com/seu-usuario/check-env.git
cd check-env
chmod +x check-env.sh
