#INCLUDE 'TOTVS.CH'

/*/{Protheus.doc} GetCodPag
    Função que grava o código da forma de pagamento em campos personalizados na tela de títulos a pagar.
    @type  Function
    @author Ruan Pereira
    @since 08/09/2023
    /*/
User Function GetCodPag()

    local cFornece := PARAMIXB[1]
    local cMsg1 := "Não existe forma de pagamento cadastrada para o fornecedor "
    local cMsg2 := ". O registro estará em branco."
    DbSelectArea("SA2")
    SA2->(DbSetOrder(1))

    if DbSeek(FWxFilial("SA2") + cFornece)

        if Empty(SA2->A2_ZZCODPG)
            MsgStop(cMsg1 + alltrim(SA2->A2_NOME) + cMsg2, "Atenção!")
        else
            SE2->E2_ZZCODPG := SA2->A2_ZZCODPG
            SE2->E2_ZZDSCPG := SA2->A2_ZZDSCPG 
        endif            

    endif

Return 
