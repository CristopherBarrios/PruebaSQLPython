# 1. Desarrolle una función en Python que imprima únicamente 
# los valores pares de la siguiente lista: [42, 16, 75, 33, 89, 50, 28, 5, 63, 11].

def imprimir_pares(miLista):
    miListaPares = []
    for n in miLista:
        if n%2 == 0:
            miListaPares.append(n)

    print("1. " + str(miListaPares))

miLista = [42, 16, 75, 33, 89, 50, 28, 5, 63, 11]
imprimir_pares(miLista)

# 2. El factorial es el producto de todos los enteros positivos desde 1 hasta un número n. Por ejemplo, el
# factorial de 5 (escrito como 5!) es igual a 5 × 4 × 3 × 2 × 1, que es igual a 120. Desarrolle una función en
# Python que obtenga el factorial de un número.

print("--------------------------------------------")


def factorial(insercionUsuario):
    resultado = 1
    while insercionUsuario > 0:
        resultado = resultado * insercionUsuario
        insercionUsuario -= 1

    print("   Resultado: " + str(resultado))

PreguntaUsuario = int(input("2. Inserte un numero: "))
factorial(PreguntaUsuario)


# 3. La secuencia de Fibonacci es una serie en la que cada término es la suma de los dos términos anteriores.
# La secuencia comienza con 0 y 1, y luego cada término sucesivo es la suma de los dos términos anteriores.
# La secuencia comienza así: 0, 1, 1, 2, 3, 5, 8, 13, 21, 34, y así sucesivamente. Desarrolle una función que
# imprima todos los valores de la secuencia Fibonacci menores a un número indicado.

print("--------------------------------------------")

def fibonacci(n):
    a, b = 0, 1
    while a < n:
        print(a, end=" ")
        a, b = b, a + b

PreguntaUsuario = int(input("3. Inserte un numero: "))
fibonacci(PreguntaUsuario)


