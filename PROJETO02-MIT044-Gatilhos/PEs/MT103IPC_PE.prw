#Include "Protheus.ch"

/*/{Protheus.doc} MT103IPC
    PE com fun��o de mostrar a descri��o de um produto criado a partir do Pedido de Compras.
    @type function
    @author Ruan Henrique
    @since 04/10/2023
/*/
User Function MT103IPC()

    local lRet := '' //variavel de retorno
        
    If ExistBlock('GetDesc') // fun��o para atribuir os dados de outra user function
        lRet := ExecBlock('GetDesc', .F., .F., NIL)
    Endif 
         
Return(lRet)

