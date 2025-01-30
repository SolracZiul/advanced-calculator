# 🚀 Melhorando a Nossa Calculadora - Talento Tech

## 📌 Introdução

Este projeto aprimora a calculadora desenvolvida anteriormente no Seminário Integrador, adicionando novas funcionalidades matemáticas avançadas. As operações implementadas incluem:

- Raiz Quadrada (√x)
- Seno (sen(x))
- Exponenciação (x^y)
- Fatorial (x!)

Além disso, aprimoramos a interface, garantindo uma experiência melhor ao usuário.

## 📊 O que foi modificado no código?

### 🔹 1. Adição das Novas Funcionalidades
Implementamos quatro novas operações matemáticas utilizando a biblioteca dart:math e a avaliação de expressões com expressions.

#### 1.1 Raiz Quadrada (√x)

A função sqrt(x) foi adicionada para calcular a raiz quadrada de um número. O código busca sqrt(x) na expressão e substitui pela operação correspondente:

```
String _calcularRaizQuadrada(String expressao) {
  expressao = expressao.replaceAll('sqrt(', '').replaceAll(')', '');
  double numero = double.parse(expressao);
  double raizQuadrada = sqrt(numero);
  return raizQuadrada.toString();
}
```
#### 1.2 Seno (sen(x))

A função sen(x) calcula o seno de um número convertido para radianos, pois a função sin() do Dart trabalha com radianos:

```
String _calcularSeno(String expressao) {
  expressao = expressao.replaceAll('sen(', '').replaceAll(')', '');
  double numero = double.parse(expressao);
  double seno = sin(numero);
  return seno.toString();
}
```

#### 1.3 Exponenciação (x^y)

A função pow(x, y) foi utilizada para realizar operações de potência:

```
String _calcularExponenciacao(String expressao) {
  var partes = expressao.split('^');
  if (partes.length == 2) {
    double base = double.parse(partes[0]);
    double expoente = double.parse(partes[1]);
    num resultado = pow(base, expoente);
    return resultado.toString();
  }
  return expressao;
}
```

#### 1.4 Fatorial (x!)

Para implementar o fatorial, utilizamos uma função recursiva:

```
int _fatorial(int n) {
  if (n == 0 || n == 1) {
    return 1;
  }
  return n * _fatorial(n - 1);
}
```

Esta função é chamada quando fatorial(x) é detectado na expressão.

### 🎨 2. Melhorias na Interface

A interface foi reformulada para garantir maior clareza e organização: 

✔️ Nova disposição dos botões

✔️ Melhor espaçamento

✔️ Botões responsivos

✔️ Centralização da calculadora na tela

O código a seguir ajusta o tamanho e disposição dos botões na grade:

```
GridView.count(
  shrinkWrap: true,
  crossAxisCount: 4, // Define 4 colunas
  childAspectRatio: 1.2, // Ajusta a proporção dos botões
  mainAxisSpacing: 5,
  crossAxisSpacing: 5,
  children: [
    _botao('7'), _botao('8'), _botao('9'), _botao('÷'),
    _botao('4'), _botao('5'), _botao('6'), _botao('x'),
    _botao('1'), _botao('2'), _botao('3'), _botao('-'),
    _botao('0'), _botao('.'), _botao('='), _botao('+'),
    _botao('^'), _botao('sen('), _botao('sqrt('), _botao('fatorial('),
  ],
),
```

### 🔬 3. Testes Práticos

Abaixo está uma bateria de testes para validar as novas funcionalidades:

#### ✅ Testes Unitários

| Expressão	| Resultado Esperado |
| --- | --- |
| sqrt(9) |	3.0 |
| sen(3.14) |	0.00159 (aprox.) |
| 2^3 |	8 |
| fatorial(5) |	120 |

Para rodar os testes, basta inserir as expressões na calculadora e conferir os resultados.

## 🎤 Conclusão
✔️ Implementamos novas funcionalidades matemáticas
✔️ Melhoramos a interface da calculadora
✔️ Criamos testes práticos para validar os cálculos

Com essas melhorias, a calculadora se tornou mais funcional e intuitiva. 🚀

📌 Dúvidas ou sugestões? Contribua com este repositório!

🔗 Repositório: [github.com/usuario/calculadora-avancada](https://github.com/SolracZiul/advanced-calculator)
