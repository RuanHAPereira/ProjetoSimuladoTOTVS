#INCLUDE 'TOTVS.CH'
#INCLUDE 'TOPCONN.CH'

/*/{Protheus.doc} User Function VldLote
    Função para verificar o campo B1_RASTRO do produto, verificar se o produto tem controle de lote ou não
    @type  Function
    @author Ruan Henrique
    @since 06/03/2024
/*/
User Function VldLote()

	local aArea      := GetArea()
	local cAlias     := GetNextAlias()
	local cCodigo    := Paramixb
	local cQuery     := ''
	local cB1_Rastro := ''

	cQuery := 'SELECT SD1.*, B1.B1_RASTRO ' + CRLF
	cQuery += 'FROM ' + RetSqlName('SD1') + ' SD1' + CRLF
	cQuery += 'INNER JOIN ' + RetSqlName('SB1') + ' B1 ON B1_COD = D1_COD' + CRLF
	cQuery += "WHERE D1_COD ='" + cCodigo + "' "

	TCQUERY cQuery ALIAS &(cAlias) NEW

	while &(cAlias)->(!EOF())
		cB1_Rastro := &(cAlias)->(B1_RASTRO)


		&(cAlias)->(DbSkip())
	enddo

	RestArea(aArea)
Return cB1_Rastro
