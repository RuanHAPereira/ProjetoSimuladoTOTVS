#INCLUDE 'TOTVS.CH'

/*/{Protheus.doc} User Function MT140LOK
    Este ponto de entrada tem o objetivo de validar as informações preenchidas no aCols de cada item do pré-documento de entrada.
    @type  Function
    @author Ruan Henrique 
    @since 07/03/2024
/*/
User Function MT140LOK()

    Local lRet       := Paramixb[1]
    Local nPos       := Ascan(Aheader,{|x| Alltrim(x[2]) == "D1_COD"})
    Local cCodigo    := ''
    Local cB1_Rastro := ''
   
    if !empty(aCols[n][nPos])
        cCodigo := aCols[n][nPos]
    endif 

    if ExistBlock('VldLote')
		cB1_Rastro := ExecBlock('VldLote', .F., .F., cCodigo)
	endif	
   
    if cB1_Rastro == 'N'
        lRet := .T.
    else 
       if ExistBlock('VldCampo')
            lRet := ExecBlock('VldCampo', .F., .F.)
        endif 
    endif 

Return lRet
