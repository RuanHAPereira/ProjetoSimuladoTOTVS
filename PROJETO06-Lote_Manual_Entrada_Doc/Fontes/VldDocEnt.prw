#INCLUDE 'TOTVS.CH'

/*/{Protheus.doc} User Function VldDocEnt
    Fun��o com as valida��es dos itens do documento de entrada. 
    @type  Function
    @author Ruan Henrique
    @since 06/03/2024
/*/
User Function VlDocEnt()

    local lRet          := .T.
	local lTES          := .T.
	local lLote         := .T.
	local nPos          := Ascan(Aheader,{|aAux| Alltrim(aAux[2]) == "D1_COD"})
	local nARM          := Ascan(Aheader,{|aAux| Alltrim(aAux[2]) == "D1_LOCAL"})
	local cCode         := ''
	local cARMZ			:= ''
	Private cB1_Rastro  := ''

	//pegando o valor do campo do codigo do produto
	if !empty(aCols[n][nPos])
		cCode := aCols[n][nPos]
	endif

	//pegando o valor do campo do armazem
	if !empty(aCols[n][nARM])
		cARMZ := aCols[n][nARM]
	endif

	//Verifica��o se o produto controla lote
	if ExistBlock('VldLote')
		cB1_Rastro := ExecBlock('VldLote', .F., .F., cCode)
	endif

	//valida��o da TES
	if ExistBlock('VldTES')
		lTES := ExecBlock('VldTES', .F., .F., cARMZ)
	endif

	if cB1_Rastro == 'N'
		lLote := .T.
	else
		if ExistBlock('VldCampo')
			lLote := ExecBlock('VldCampo', .F., .F.)
		endif
	endif

	if (!lLote) .or. (!lTES)
		lRet := .F.
	endif

Return lRet
