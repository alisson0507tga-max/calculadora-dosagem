# Calculadora de Dosagem

Aplicativo Android e web responsivo para calcular a dosagem de produtos por quilograma e o volume total necessário para um lote. A versão Android inclui o ícone personalizado enviado, tema claro/escuro e espaçamento adequado abaixo da barra de notificações.

## Baixar e instalar o APK

Baixe o instalador Android diretamente na página de releases:

**[Baixar CalculadoraDosagem.apk](https://github.com/alisson0507tga-max/calculadora-dosagem/releases/latest/download/CalculadoraDosagem.apk)**

No celular Android:

1. Toque no link acima e baixe o arquivo APK.
2. Abra o arquivo baixado.
3. Se o Android solicitar, permita a instalação pelo navegador ou pelo gerenciador de arquivos.
4. Toque em **Instalar**.
5. Abra o aplicativo **Calculadora de Dosagem**.

Se o Android bloquear a instalação, acesse **Configurações > Segurança/Privacidade > Instalar apps desconhecidos** e permita temporariamente para o aplicativo usado para abrir o APK.

## Como usar a versão web

O arquivo `index.html` também pode ser aberto diretamente em qualquer navegador moderno. Informe o peso do lote, ajuste os produtos, a dose e a base. O aplicativo calcula automaticamente a dosagem em `mL/kg` e o total em litros.

Os dados ficam salvos localmente no navegador por meio de `localStorage`; nenhum dado é enviado para um servidor.

## Fórmulas

- **Dosagem:** `dose (L) × 1000 ÷ base (kg)` = `mL/kg`
- **Total:** `dosagem (mL/kg) × lote (kg) ÷ 1000` = `L`

## Estrutura

| Arquivo | Descrição |
|---|---|
| `index.html` | Aplicativo web completo, incluindo HTML, CSS e JavaScript |
| `CalculadoraDosagem.apk` | Instalador Android atualizado para uso no celular |
| `android/` | Projeto Android que empacota o aplicativo web em um APK offline |
| `README.md` | Instruções de uso, instalação e publicação |

## Compilação do APK

O APK foi compilado com Gradle e Android SDK. Para gerar uma nova versão, abra a pasta `android` e execute `gradle assembleDebug`. O resultado será criado em `android/app/build/outputs/apk/debug/app-debug.apk`.

## Observação

Confira sempre as unidades e os valores antes de usar qualquer resultado em uma aplicação real. Este software é uma calculadora e não substitui orientação técnica ou profissional.
