import 'package:expressions/expressions.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class Calculadora extends StatefulWidget {
  const Calculadora({super.key});

  @override
  State<Calculadora> createState() => _CalculadoraState();
}

class _CalculadoraState extends State<Calculadora> {
  final String _limpar = 'Limpar';
  final String _apagar = '←';
  String _expressao = '';
  String _resultado = '';

  void _pressionarBotao(String valor) {
    setState(() {
      if (valor == _limpar) {
        _expressao = '';
        _resultado = '';
      } else if (valor == _apagar) {
        _expressao = _expressao.isNotEmpty
            ? _expressao.substring(0, _expressao.length - 1)
            : _expressao;
      } else if (valor == '=') {
        _calcularResultado();
      } else {
        _expressao += valor;
      }
    });
  }

  void _calcularResultado() {
    try {
      _resultado = _avaliarExpressao(_expressao).toString();
    } catch (e) {
      _resultado = 'Não é possível calcular';
    }
  }

  double _avaliarExpressao(String expressao) {
    // Substituindo as operações de multiplicação e divisão
    expressao = expressao.replaceAll('x', '*');
    expressao = expressao.replaceAll('÷', '/');
    
    // Verificando e manipulando a operação seno
    if (expressao.contains('sen(')) {
      expressao = _calcularSeno(expressao);
    }

    // Verificando e manipulando a operação de raiz quadrada
    if (expressao.contains('sqrt(')) {
      expressao = _calcularRaizQuadrada(expressao);
    }

    // Verificando e manipulando a operação de exponenciação
    if (expressao.contains('^')) {
      expressao = _calcularExponenciacao(expressao);
    }

    // Verificando e manipulando a operação fatorial
    if (expressao.contains('fatorial(')) {
      expressao = _calcularFatoracao(expressao);
    }

    // Avaliar a expressão com a biblioteca expressions
    ExpressionEvaluator avaliador = const ExpressionEvaluator();
    double resultado = avaliador.eval(Expression.parse(expressao), {});
    return resultado;
  }

  // Função para calcular seno
  String _calcularSeno(String expressao) {
    // Remove a parte 'sen(' e ')'
    expressao = expressao.replaceAll('sen(', '').replaceAll(')', '');
    double numero = double.parse(expressao);
    // Converte para radianos e calcula o seno
    double seno = sin(numero);
    return seno.toString(); // Retorna o valor do seno
  }

  // Função para calcular raiz quadrada
  String _calcularRaizQuadrada(String expressao) {
    // Remove a parte 'sqrt(' e ')'
    expressao = expressao.replaceAll('sqrt(', '').replaceAll(')', '');
    double numero = double.parse(expressao);
    double raizQuadrada = sqrt(numero);
    return raizQuadrada.toString(); // Retorna o valor da raiz quadrada
  }

  // Função para exponenciação
  String _calcularExponenciacao(String expressao) {
    // Substituindo o ^ por um operador de exponenciação
    var partes = expressao.split('^');
    if (partes.length == 2) {
      double base = double.parse(partes[0]);
      double expoente = double.parse(partes[1]);
      num resultado = pow(base, expoente);
      return resultado.toString(); // Retorna o resultado da exponenciação
    }
    return expressao;
  }

  // Função para fatoração
  String _calcularFatoracao(String expressao) {
    // Remove a parte 'fatorial(' e ')'
    expressao = expressao.replaceAll('fatorial(', '').replaceAll(')', '');
    int numero = int.parse(expressao);
    String resultado = _fatorial(numero).toString();
    return resultado; // Retorna o fatorial do número
  }

  // Função auxiliar para calcular o fatorial de um número
  int _fatorial(int n) {
    if (n == 0 || n == 1) {
      return 1;
    }
    return n * _fatorial(n - 1);
  }

  Widget _botao(String valor) {
    return TextButton(
      child: Text(
        valor,
        style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
      ),
      onPressed: () => _pressionarBotao(valor),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Resultado da expressão
        Container(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Text(
            _expressao,
            style: const TextStyle(fontSize: 24),
          ),
        ),
        // Resultado final
        Container(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Text(
            _resultado,
            style: const TextStyle(fontSize: 24),
          ),
        ),
        // Linhas de operações especiais
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _botao('sen('), // Seno
            _botao('sqrt('), // Raiz quadrada
            _botao('^'), // Exponenciação
            _botao('fatorial('), // Fatorial
          ],
        ),
        // Linhas de números e operadores
        Expanded(
          flex: 3,
          child: GridView.count(
            crossAxisCount: 4,
            childAspectRatio: 2,
            children: [
              _botao('7'),
              _botao('8'),
              _botao('9'),
              _botao('÷'),
              _botao('4'),
              _botao('5'),
              _botao('6'),
              _botao('x'),
              _botao('1'),
              _botao('2'),
              _botao('3'),
              _botao('-'),
              _botao('0'),
              _botao('.'),
              _botao('='),
              _botao('+'),
            ],
          ),
        ),
        // Linha para apagar um caractere ou limpar tudo
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _botao(_apagar), // Apagar um caractere
            _botao(_limpar), // Limpar tudo
          ],
        ),
      ],
    );
  }
}
