#INCLUDE "TOTVS.CH"

/*/{Protheus.doc} User Function GetNome
    Função utilizando If/Else padrao para retornar nome do Cliente/Fornecedor dependendo do que for selecionado.
    @type  Function
    @author Ruan Henrique 
    @since 21/09/2023
    /*/
User Function GetNome()

    local cRet := ""

    if SF1->F1_TIPO == 'B' .Or. SF1->F1_TIPO == 'D'
        cRet := POSICIONE("SA1", 1, xFilial("SA1")+SF1->F1_FORNECE+SF1->F1_LOJA, "A1_NOME")
    else
        cRet := POSICIONE("SA2", 1, xFilial("SA2")+SF1->F1_FORNECE+SF1->F1_LOJA, "A2_NOME")
    endif 

Return cRet
