#INCLUDE 'TOTVS.CH'

/*/{Protheus.doc} User Function GatTIPO
    Função de usuario para ser utilizado como regra em gatilho, para retornar nome de fornecedor ou cliente
    de acordo com o tipo selecionado.
    @type  Function
    @author Ruan Pereira
    @since 21/09/2023
/*/
User Function GatTIPO()

    local aArea := GetArea()
    local aAreaSA2 := SA2->(GetArea())
    local aAreaSA1 := SA1->(GetArea())
    
    local cRet := ''

    cRet := IIF(M->C5_TIPO == 'B' .Or. M->C5_TIPO == 'D', POSICIONE("SA2", 1, xFilial("SA2")+M->C5_CLIENTE+M->C5_LOJACLI, "A2_NOME"), POSICIONE("SA1", 1, xFilial("SA1")+M->C5_CLIENTE+M->C5_LOJACLI, "A1_NOME"))


    RestArea(aAreaSA1)
    RestArea(aAreaSA2)
    RestArea(aArea)
Return cRet
