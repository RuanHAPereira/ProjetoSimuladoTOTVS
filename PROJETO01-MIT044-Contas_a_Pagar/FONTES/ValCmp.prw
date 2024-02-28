#INCLUDE 'TOTVS.CH'

/*/{Protheus.doc} ValCmp
    Rotina de valida��o de c�digo de forma de pagamento da tabela Z05 na tela de cadastro de fornecedores.
    @type  Function
    @author Ruan Pereira
    @since 12/09/2023
/*/   
User Function ValCmp()

    local lRet := .T.
    local cCodigo := "SA2->A2_ZZCODPG"  // Substitua "ALIAS->Z05" pelo alias correto do campo

    If !ExistCPO(cCodigo)
        MsgInfo("Cliente existe!", "Aten��o")
        lRet := .F.
    Else
        MsgStop("Cliente n�o existe!", "Aten��o")
    EndIf

Return lRet
