# Calculadora de Dosagem

Aplicativo web responsivo para calcular a dosagem de produtos por quilograma e o volume total necessário para um lote.

## Como usar

1. Baixe ou clone este repositório.
2. Abra o arquivo `index.html` em qualquer navegador moderno.
3. Informe o peso do lote, ajuste os produtos, a dose e a base.
4. O aplicativo calcula automaticamente a dosagem em `mL/kg` e o total em litros.

Os dados ficam salvos localmente no navegador por meio de `localStorage`; nenhum dado é enviado para um servidor.

## Baixar

No GitHub, selecione **Code > Download ZIP**. Depois de extrair o arquivo, abra `index.html`.

## Publicar como aplicativo web

O projeto é estático e pode ser publicado no GitHub Pages, Netlify, Vercel ou qualquer hospedagem de arquivos estáticos. Não há dependências nem etapa de compilação.

## Fórmulas

- **Dosagem:** `dose (L) × 1000 ÷ base (kg)` = `mL/kg`
- **Total:** `dosagem (mL/kg) × lote (kg) ÷ 1000` = `L`

## Estrutura

| Arquivo | Descrição |
|---|---|
| `index.html` | Aplicativo completo, incluindo HTML, CSS e JavaScript |
| `README.md` | Instruções de uso e publicação |

## Observação

Confira sempre as unidades e os valores antes de usar qualquer resultado em uma aplicação real. Este software é uma calculadora e não substitui orientação técnica ou profissional.
