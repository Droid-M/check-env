#!/bin/bash
# Verificando variáveis do env.example no .env

ENV_EXAMPLE=".env.example"
ENV_FILE=".env"

# Verificando se arquivos existem
if [ ! -f "$ENV_EXAMPLE" ]; then
    echo "Arquivo $ENV_EXAMPLE não encontrado."
    exit 1
fi

if [ ! -f "$ENV_FILE" ]; then
    echo "Arquivo $ENV_FILE não encontrado."
    exit 1
fi

# Pegando apenas os nomes das variáveis (antes do "=")
MISSING_VARS=()
while IFS='=' read -r var _ || [ -n "$var" ]; do
    # Ignorando linhas vazias e comentários
    [[ -z "$var" || "$var" =~ ^# ]] && continue

    if ! grep -q "^$var=" "$ENV_FILE"; then
        MISSING_VARS+=("$var")
    fi
done < "$ENV_EXAMPLE"

# Se encontrou variáveis faltando
if [ ${#MISSING_VARS[@]} -gt 0 ]; then
    echo "Variáveis ausentes no $ENV_FILE:"
    for var in "${MISSING_VARS[@]}"; do
        echo "   - $var"
    done
    exit 1
fi

echo "Todas as variáveis do $ENV_EXAMPLE estão presentes no $ENV_FILE."
