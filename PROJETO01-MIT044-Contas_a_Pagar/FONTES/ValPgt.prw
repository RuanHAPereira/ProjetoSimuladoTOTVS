#INCLUDE 'TOTVS.CH'

/*/{Protheus.doc} ValPgt
    Rotina de validação de código de forma de pagamento da tabela Z05 na tela de cadastro de fornecedores.
    @type  Function
    @author Ruan Pereira
    @since 08/09/2023
/*/
User Function ValPgt()

    local lRet := .T.
    local cCod := M->A2_ZZCODPG

    if !ExistCPO("Z05", cCod)
        lRet := .F.
    endif

Return lRet
