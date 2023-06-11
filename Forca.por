programa
{	
	//inserir as bibliotecas 
	inclua biblioteca Texto --> t
	inclua biblioteca Util --> u
	
	funcao inicio()
	{
		//Inserindo variáveis 
		inteiro i, j, sorteio, numeroLetras, contagem, vidas = 6, acertos, lugar, letra_invalido = 0, n_invalido = 0, cont = -1, erros = 0
		cadeia palavraSorteada, palavra[6] = {"melancia", "feliz", "roupa", "escola", "caderno", "abacate"}
		caracter letra, formacao[20], palavraSeparada[20], invalidos[20], letraErros[20], elemento, resposta = 's'
		logico acertou = falso, letraRepetida = falso
		
		enquanto(resposta != 'n'){
			vidas = 6
			letra_invalido = 0
			n_invalido = 0
			cont = -1
			erros = 0

			escreva("--------------------------------------------JOGO DA FORCA--------------------------------------------")
			escreva("\n Funcionamento do jogo:")
			escreva("\n Só é permitido inserir letras minúsculas, sendo descontado 1 vida caso contrário;")
			escreva("\n Não é permitido o uso de caracteres especiais no jogo, sendo descontado 1 vida caso seja utilizado.")
			escreva("\n-----------------------------------------------------------------------------------------------------\n")
			//Sortear um número
			sorteio = u.sorteia(0, 5)
		
			//Número sendo a posição da palavra dentro do vetor 
			palavraSorteada = palavra[sorteio]
		
			//Contando o número de letras
			numeroLetras = t.numero_caracteres(palavraSorteada)
	
			//Para iniciar o número de acertos com o mesmo número de letras para depois tirar de 1 em 1 quando o usuário acertar 
			acertos = numeroLetras
		
			//Palavra em vetor
			para(lugar = 0; lugar < numeroLetras; lugar++){
				palavraSeparada[lugar] = t.obter_caracter(palavraSorteada, lugar)
				formacao[lugar] = '_'
			}
	
			//Letras repetidas dentro da palavra sorteada
			para(i = 0; i < numeroLetras; i++){
				elemento = palavraSeparada[i]
				contagem = 0
				para(j = 0; j < numeroLetras; j++){
					se(palavraSeparada[j] == elemento){
						contagem++
					}
				}
				se(contagem > 1){
					acertos = (numeroLetras + 1) - contagem 
				}
			}
			
			enquanto(vidas > 0 e acertos > 0) {
				//Imprimindo a forca
				escolha(vidas){
		      		caso 6:
		        			escreva("\n______________")
		        			escreva("\n│............│")
		        			para(i = 0; i <= 4; i++){
		          			escreva("\n│:│     ")
		        			}
		        			escreva("\n\nVidas: ", vidas, " [♥ ♥ ♥ ♥ ♥ ♥]\n")
		     		pare
		
		      		caso 5:
		        			escreva("\n______________")
		        			escreva("\n│............│")
		        			escreva("\n│:│     :    ")
		        			escreva("\n│:│     O")
		        			para(i = 0; i <= 3; i++){
		          			escreva("\n│:│    ")
		        			}
		        			escreva("\n\nVidas: ", vidas," [♥ ♥ ♥ ♥ ♥]\n")
		      			pare
		
		      		caso 4: 
		        			escreva("\n______________")
		        			escreva("\n│............│")
		        			escreva("\n│:│     :     ")
		        			escreva("\n│:│     O    ")
		        			escreva("\n│:│     │  ")
		        			para(i = 0; i <= 2; i++){
		          			escreva("\n│:│      ")
		        			}
		        			escreva("\n\nVidas:", vidas, "[♥ ♥ ♥ ♥]\n")
		      		pare
		
		      		caso 3: 
		        			escreva("\n______________")
		        			escreva("\n│............│")
		        			escreva("\n│:│     :     ")
		        			escreva("\n│:│     O    ")
		        			escreva("\n│:│    /│  ")
		        			para(i = 0; i <= 2; i++){
		          			escreva("\n│:│      ")
		        			}
		        			escreva("\n\nVidas: ", vidas, " [♥ ♥ ♥]\n")
		      		pare
		
		      		caso 2: 
		        			escreva("\n______________")
		        			escreva("\n│............│")
		        			escreva("\n│:│     :     ")
		        			escreva("\n│:│     O    ")
		        			escreva("\n│:│    /│\\  ")
		        			para(i = 0; i <= 2; i++){
		          			escreva("\n│:│     ")
		        			}
		        			escreva("\n\nVidas: ", vidas, "[♥ ♥]\n")
		      		pare
		
		      		caso 1: 
		        			escreva("\n______________")
		        			escreva("\n│............│")
		        			escreva("\n│:│     :     ")
		        			escreva("\n│:│     O    ")
		        			escreva("\n│:│    /│\\  ")
		        			escreva("\n│:│    /     ")
		        			para(i = 0; i <= 2; i++){
		          			escreva("\n│:│      ")
		        			}
		        			escreva("\n\nVidas: ", vidas, " [♥]\n")
		      		pare
					}
	
				//Imprimindo as linhas
				para(lugar = 0; lugar < numeroLetras; lugar++){
					escreva(formacao[lugar], " ")
				}
				//Pedindo a letra 
				escreva("\nDigite uma letra minúscula de sua escolha: ")
				leia(letra)
	
				//Aceitar apenas letras minúsculas!!!
				se(letra >= 'a' e letra <= 'z') {
				}senao se(letra >= 'A' e letra <= 'Z'){
					letra_invalido++
					escreva("\nERRO! Você digitou uma letra maiúscula! Insira APENAS letras minúsculas!\n")
					
				}senao{
					n_invalido++
					escreva("\nERRO! Você digitou número ou caracter especial! Insira APENAS letras minúsculas!\n")
				}
				
				//Verificar se a letra é igual a da palavra ou se tem letra repetida
				acertou = falso
				letraRepetida = falso
				para(lugar = 0; lugar < numeroLetras; lugar++)
				{
					se(letra == palavraSeparada[lugar])
					{
						se(formacao[lugar] == letra)
						{
							letraRepetida = verdadeiro
						}
						senao se(letra != formacao[lugar])
						{
							acertou = verdadeiro
							formacao[lugar] = letra
						}
					}
				}
	
				//Imprimindo se está correta, errada ou repetida
				se(letraRepetida == verdadeiro){
					escreva("\nATENÇÃO! Você digitou uma letra repetida!")
				}senao se(acertou == verdadeiro){
					escreva("Acertou\n")
					acertos--
				}senao{
					escreva("Errou\n")
					erros++
					vidas--
					cont++
					letraErros[cont] = letra
				}
	
				se(erros > 0){
				//Imprimindo tudo que o usuário digitou errado
			        	escreva("\nERROS COMETIDOS: ")
			        	para(inteiro indice = 0; indice < cont + 1; indice++){
						escreva(letraErros[indice], " ")
					}
				}
				
				//Imprimindo as letras quando ganhar 
				se(acertos == 0){
					escreva("\n\nPalavra completa: " )
					para(lugar = 0; lugar < numeroLetras; lugar++){
						escreva( formacao[lugar], " ")
					}
					escreva("\n\nPARABÉNS!!! Acertou tudo! ")
				}
			}
				se(vidas == 0){
					escreva("\n")
					escreva("\n______________")
					escreva("\n│............│")
					escreva("\n│:│     :    ")
			        	escreva("\n│:│     O    ")
			        	escreva("\n│:│    /│\\  ")
			        	escreva("\n│:│    / \\    ")
			        	para(i = 0; i <= 2; i++){
			          	escreva("\n│:│      ")
			        	}
			        	escreva("\n     PERDEU! ")
	
					escreva("\n----------------------------------------------------------------------------------------------------------")
			        	//Quantidade dos números ou caracteres especiais caso sejam digitados
			        	se(n_invalido != 0) {
						escreva("\nDigitou ", n_invalido, " valor(es) inválido(s) como números ou caracteres especiais (ex. + - * / & , . % ] )")
			        	}
			        	//Quantidade de letras maiúsculas caso digite letras maisúsculas
			        	se(letra_invalido != 0) {
			        		escreva("\nDigitou ", letra_invalido, " letra(s) maiúscula(s).")
			        	}
			        	//Quantidade de letras corretas digitadas
			        	se(acertos < numeroLetras){
						escreva("\nInseriu ", numeroLetras - acertos, " letra(s) certa(s).")
			        	} senao {
			        	
			        		escreva("\nNão acertou nenhuma letra!")
			        		escreva("\nDICA!! Toda palavra tem vogal!! \nNa próxima vez comece digitando vogais!!!")
			        	}
					escreva("\n\nVocê consegue! \nTente novamente!\n")
				}
			escreva("\nDeseja continuar jogando? [s/n]")
			leia(resposta)
			limpa()
		}
	}		
}
