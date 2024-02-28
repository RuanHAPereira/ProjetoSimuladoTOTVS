#INCLUDE "TOTVS.CH"

/*/{Protheus.doc} User Function M460FIM
    Ponto de entrada para replicar o nome do cliente no documento de saída.
    @type  Function
    @author Ruan Pereira
    @since 05/10/2023
/*/
User Function M460FIM()

    local lRet := '' //variavel de retorno
        
    If ExistBlock('ReplicaNm') // função para atribuir os dados de outra user function
        lRet := ExecBlock('ReplicaNm', .F., .F., NIL)
    Endif 
         
Return(lRet)
