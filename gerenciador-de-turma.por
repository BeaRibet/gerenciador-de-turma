/*
  Objetivo: Desenvolver um sistema que manipule dados de alunos fictícios, utilizando exclusivamente memória RAM (sem persistência),
  permitindo cadastro, remoção e visualização de dados.  
*/

programa{
	inclua biblioteca Tipos
	inteiro cadastros = 0

	funcao logico valida_cadastro(){
		se(cadastros == 0){
			escreva("\nNão existem alunos cadastrados")
			retorne falso
		}
		retorne verdadeiro
	}
	
	funcao vazio cadastro_aluno(cadeia matriz[][]){
		logico fazer_cadastro = verdadeiro
		cadeia cpf
		
		escreva("Preencha as informações a seguir:\nCPF: ")
		leia(cpf)

		para(inteiro i = 0; i < cadastros; i++){
			se(matriz[i][2] == cpf){
				escreva("\nO CPF informado já existe!\n")
				fazer_cadastro = falso
				se(Tipos.cadeia_para_logico(matriz[i][4]) == falso){
					inteiro opcao
					escreva("Aluno desativado, deseja reativar?\n1 - Sim\n2 - Não\nOpção: ")
					leia(opcao)
					escolha(opcao){
						caso 1: 
							matriz[i][4] = "verdadeiro"
							escreva("Aluno ", matriz[i][0], " reativado com sucesso!\n")
						pare
						caso 2:
							escreva("Aluno ", matriz[i][0], " segue desativado\n")
						pare
						caso contrario:
							escreva("Opção inválida, retornando pro menu inicial.")
						pare
					}
					i = cadastros //para encerrar o loop do laço de repetição quando encontrar o cpf.
				}
			}
		}

		se(fazer_cadastro){
			matriz[cadastros][2] = cpf
			
			escreva("\nNome:")
			leia(matriz[cadastros][0])
			
			escreva("\nData de nascimento:")
			leia(matriz[cadastros][1])
			
			escreva("\nMédia:")
			leia(matriz[cadastros][3])
			
			matriz[cadastros][4] = "verdadeiro"
	
			escreva("\n Aluno ", matriz[cadastros][0], " cadastrado com sucesso!\n")	

			cadastros++
		}
	}

	funcao vazio listar_ativos(cadeia matriz[][]){
		se(valida_cadastro()){
			para(inteiro i = 0; i < cadastros; i++){
				se(Tipos.cadeia_para_logico(matriz[i][4])){
					escreva("\nNome: ", matriz[i][0], "\nData de nascimento: ", matriz[i][1])
					escreva("\nCPF: ", matriz[i][2], "\nMédia: ", matriz[i][3], "\n")
				}
			}
		}
	}

	funcao vazio remover_aluno(cadeia matriz[][]){
		cadeia cpf
		se(valida_cadastro()){
			escreva("\nInsira o CPF do aluno que você deseja remover: ")
			leia(cpf)	
			para(inteiro i= 0;i<cadastros; i++){
				se(matriz[i][2] == cpf){
					matriz[i][4] = "falso"
					i = cadastros //para encerrar o loop do laço de repetição quando encontrar o cpf.
				}
			}
			escreva("\nAluno removido com sucesso!")
		}
	}

	funcao vazio buscar_aluno(cadeia matriz[][]){
		cadeia cpf
		se(valida_cadastro()){
			escreva("\nInsira o CPF do aluno que você deseja encontrar: ")
			leia(cpf)
			para(inteiro i= 0;i<cadastros; i++){
				se(matriz[i][2] == cpf){
					escreva("\nNome: ", matriz[i][0], "\nData de Nascimento: ", matriz[i][1])
					escreva("\nCPF: ", matriz[i][2],"\nMédia: ", matriz[i][3])
					i = cadastros //para encerrar o loop do laço de repetição quando encontrar o cpf.
				}
			}
		}
	}

	funcao vazio media(cadeia matriz[][], inteiro opcao){
		se(valida_cadastro()){
			se(opcao == 5){
				escreva("\nAlunos aprovados: ")
				para(inteiro i= 0;i<cadastros; i++){
					se(Tipos.cadeia_para_inteiro(matriz[i][3],10) >= 7 e Tipos.cadeia_para_logico(matriz[i][4])){
				 		escreva("\n", matriz[i][0], "\n")
				 	}
				}
			}
			
			senao{
				escreva("\nAlunos Reprovados: ")
			 	para(inteiro i= 0; i<cadastros; i++){
			 		se(Tipos.cadeia_para_inteiro(matriz[i][3],10) < 7 e Tipos.cadeia_para_logico(matriz[i][4])){
			 			escreva("\n", matriz[i][0], "\n")
			 		}
			 	}
			}
		}
	}
	
	funcao inicio(){
		 cadeia matriz[100][5]
		 inteiro menu
		 
		 faca{
			 escreva("\n\n Menu Principal:\n1 - Cadastrar aluno\n2 - Remover Aluno\n3 - Buscar Aluno\n4 - Listar todos os Alunos"
			 , "\n5 - Listar Alunos Aprovados\n6 - Listar Alunos Reprovados\n7 - Sair\nOpção:")
			 leia(menu)

			 escolha(menu){
			 	caso 1: //cadastrar aluno
					cadastro_aluno(matriz)	
			 	pare
			 	caso 2: //remover aluno
			 		remover_aluno(matriz)
			 	pare
			 	caso 3: //buscar aluno
			 		buscar_aluno(matriz)
			 	pare
			 	caso 4://listar todos os alunos ativos
				 	listar_ativos(matriz)
			 	pare
			 	caso 5: //listar alunos aprovados
			 		media(matriz, 5)
			 	pare
			 	caso 6: //listar alunos reprovados
			 		media(matriz, 6)
			 	pare
			 	caso 7: //fechar programa
					escreva("\nPrograma encerrado!")
			 	pare
			 	caso contrario: 
			 		escreva("\nOpção inválida!")
			 	pare		 	
			}
		}enquanto (menu != 7 e cadastros < 100)
	}
}

/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 256; 
 * @DOBRAMENTO-CODIGO = [9, 17, 69, 80, 95, 110];
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */