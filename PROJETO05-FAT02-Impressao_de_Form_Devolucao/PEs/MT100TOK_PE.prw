#INCLUDE 'TOTVS.CH'

/*/{Protheus.doc} User Function MT140LOK
    Este ponto de entrada tem o objetivo de validar as informações preenchidas no aCols de cada item do pré-documento de entrada.
    @type  Function
    @author Ruan Henrique
    @since 06/03/2024
*/

User Function MT100TOK()

    Local lRet := PARAMIXB[1]

    if MsgYesNo('Deseja imprimir o formulario de devolução?') 
        if ExistBlock('FormDev')
            ExecBlock('FormDev', .F., .F.)
        endif 
    endif
return lRet


