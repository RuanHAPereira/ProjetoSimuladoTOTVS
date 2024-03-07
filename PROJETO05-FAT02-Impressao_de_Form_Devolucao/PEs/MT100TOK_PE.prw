#INCLUDE 'TOTVS.CH'

/*/{Protheus.doc} User Function MT140LOK
    Este ponto de entrada tem o objetivo de validar as informações preenchidas no aCols de cada item do pré-documento de entrada.
    @type  Function
    @author TOTVS IP/TM
    @since 09/05/2023
    @return lRet, Logico, retorna .t. se as informações foram preenchidas corretamente, e .F. se não.
*/

User Function MT100TOK()

    Local lRet := PARAMIXB[1]   //Local lRet     := .T.   //..Customização do cliente

    if MsgYesNo('Deseja imprimir o formulario de devolução?') 
        if ExistBlock('FormDev')
            ExecBlock('FormDev', .F., .F.)
        endif 
    endif
return lRet


