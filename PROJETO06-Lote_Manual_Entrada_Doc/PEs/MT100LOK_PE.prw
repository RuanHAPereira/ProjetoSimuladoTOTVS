#INCLUDE 'TOTVS.CH'

/*/{Protheus.doc} User Function MT100LOK
    Este ponto de entrada tem o objetivo de validar as informações preenchidas no aCols de cada item do documento de entrada.
    @type  Function
    @author Ruan Pereira
    @since 07/03/2024
/*/
User Function MT100LOK()

	Local lRet          := Paramixb[1]

	if ExistBlock('VlDocEnt')
		lRet := ExecBlock('VlDocEnt', .F., .F.)
	endif
    
Return lRet
