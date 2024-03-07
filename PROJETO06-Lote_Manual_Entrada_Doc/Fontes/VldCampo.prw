#INCLUDE 'TOTVS.CH'

/*/{Protheus.doc} User Function VldCampo
    Função para verificar se os campos D1_LOTECTL e D1_DTVALID estão vazios, em caso afirmativo informar o erro
    @type  Function
    @author Ruan Henrique
    @since 06/03/2024
/*/
User Function VldCampo()

	local aArea    := GetArea()
	local lRet     := .T.
	local cHelp1   := "Campos Vazios"
	local cHelp2   := "É necessário informar o número e a validade do lote para lançar a pré-nota ou o documento de entrada."
	local cHelp3   := "Preencha corretamente os campos (D1_LOTECLT) E D1_DTVALID"
	local nPosLote := Ascan(Aheader,{|aAux| Alltrim(aAux[2]) == "D1_LOTECTL"})
	local nPosData := Ascan(Aheader,{|aAux| Alltrim(aAux[2]) == "D1_DTVALID"})

	//verifica se os campos Lote e validade estão vazios
	if empty(aCols[n][nPosLote]) .or. empty(aCols[n][nPosData])
		lRet := .F.
		Help(NIL, NIL, cHelp1, NIL, cHelp2, 1, 0, NIL, NIL, NIL, NIL, NIL, {cHelp3})
	endif

    RestArea(aArea)
return lRet 
