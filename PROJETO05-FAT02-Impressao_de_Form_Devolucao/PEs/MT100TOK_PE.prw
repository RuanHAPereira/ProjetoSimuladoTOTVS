#INCLUDE 'TOTVS.CH'

/*/{Protheus.doc} User Function MT140LOK
    Este ponto de entrada tem o objetivo de validar as informa��es preenchidas no aCols de cada item do pr�-documento de entrada.
    @type  Function
    @author TOTVS IP/TM
    @since 09/05/2023
    @return lRet, Logico, retorna .t. se as informa��es foram preenchidas corretamente, e .F. se n�o.
*/

User Function MT100TOK()

    Local lRet := PARAMIXB[1]   //Local lRet     := .T.   //..Customiza��o do cliente

    if MsgYesNo('Deseja imprimir o formulario de devolu��o?') 
        if ExistBlock('FormDev')
            ExecBlock('FormDev', .F., .F.)
        endif 
    endif
return lRet


