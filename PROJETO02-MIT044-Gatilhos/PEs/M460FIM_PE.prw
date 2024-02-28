#INCLUDE "TOTVS.CH"

/*/{Protheus.doc} User Function M460FIM
    Ponto de entrada para replicar o nome do cliente no documento de sa�da.
    @type  Function
    @author Ruan Pereira
    @since 05/10/2023
/*/
User Function M460FIM()

    local lRet := '' //variavel de retorno
        
    If ExistBlock('ReplicaNm') // fun��o para atribuir os dados de outra user function
        lRet := ExecBlock('ReplicaNm', .F., .F., NIL)
    Endif 
         
Return(lRet)
