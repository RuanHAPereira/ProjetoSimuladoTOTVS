#INCLUDE "TOTVS.CH"

/*/{Protheus.doc} User Function GatTIPO2
    Função utilizando If/Else padrao para retornar nome do Cliente/Fornecedor dependendo do que for selecionado.
    @type  Function
    @author Ruan Henrique 
    @since 21/09/2023
/*/
User Function GatTIPO2()

    local aArea := GetArea()
    local aAreaSA2 := SA2->(GetArea())
    local aAreaSA1 := SA1->(GetArea())
    local cRet := ""

    if M->C5_TIPO == 'B' .Or. M->C5_TIPO == 'D'
        cRet := POSICIONE("SA2", 1, xFilial("SA2")+M->C5_CLIENTE+M->C5_LOJACLI, "A2_NOME")
    else
        cRet := POSICIONE("SA1", 1, xFilial("SA1")+M->C5_CLIENTE+M->C5_LOJACLI, "A1_NOME")
    endif

    RestArea(aAreaSA1)
    RestArea(aAreaSA2)
    RestArea(aArea) 

Return cRet
