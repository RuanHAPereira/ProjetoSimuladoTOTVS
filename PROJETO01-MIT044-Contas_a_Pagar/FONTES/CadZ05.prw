#INCLUDE "TOTVS.CH"
#INCLUDE "FWMVCDEF.CH"

/*/{Protheus.doc} CadZ05
    Rotina no padrão MVC tipo 1 para manutenção das formas de pagamento.
    @type  Function
    @author Ruan Pereira
    @since 06/09/2023
    @version 1.2
/*/
user function CadZ05()

    Local cAlias    := "Z05"
    local cTitle    := "Cadastro de Forma de Pagamento"
    local oBrowse   := FwMBrowse():New()

    oBrowse:SetAlias(cAlias)
    oBrowse:SetDescription(cTitle)

    oBrowse:DisableDetails()
    oBrowse:DisableReport()

    oBrowse:ACTIVATE()

return

Static Function MenuDef()

    local aButton := {} //? cria um array vazio para que sejam adcionadas botoes funcionais

    ADD OPTION aButton TITLE "Visualizar"   ACTION 'VIEWDEF.CADZ05' OPERATION 2 ACCESS 0
    ADD OPTION aButton TITLE "Incluir"      ACTION 'VIEWDEF.CADZ05' OPERATION 3 ACCESS 0
    ADD OPTION aButton TITLE "Alterar"      ACTION 'VIEWDEF.CADZ05' OPERATION 4 ACCESS 0
    ADD OPTION aButton TITLE "Excluir"      ACTION 'VIEWDEF.CADZ05' OPERATION 5 ACCESS 0

Return aButton

Static Function ModelDef()

    local oModel   := MpFormModel():New("CADZ05M")
    local oStruZ05 := FwFormStruct(1, "Z05")

    oModel:AddFields("Z05MASTER",, oStruZ05)
    oModel:SetPrimaryKey({"Z05_COD"})

    oStruZ05:SetProperty("Z05_COD", MODEL_FIELD_INIT, FwBuildFeature(STRUCT_FEATURE_INIPAD, 'GetSxENum("Z05", "Z05_COD")'))
    oStruZ05:SetProperty('Z05_COD', MODEL_FIELD_WHEN, FwBuildFeature(STRUCT_FEATURE_WHEN, 'INCLUI'))
    oStruZ05:SetProperty('Z05_COD', MODEL_FIELD_VALID, { |oModel| ExistPg(oModel)})

Return oModel

Static Function VIEWDEF()

    local oModel   := FwLoadModel("CADZ05")
    local oStruZ05 := FwFormStruct(2, "Z05")
    local oView    := FwFormView():New()

    oView:SetModel(oModel)
    oView:AddField("VIEW_Z05", oStruZ05, "Z05MASTER")
    oView:CreateHorizontalBox("PAGAMENTO", 50)
    oView:SetOwnerView("VIEW_Z05", "PAGAMENTO")
    oView:EnableTitleView("VIEW_Z05", "Cadastro de Forma de Pagamento")

Return oView

Static Function ExistPg(oModel)

    local lRet := .T.
    local cCod := M->Z05_COD

    if DbSeek(FwxFilial("Z05") + cCod)
        lRet := .F.

        Help(NIL, NIL, "Atenção!", NIL, "Já existe registro com essa numeração.", 1, 0, NIL, NIL, NIL, NIL, NIL, {"Verifique o código de entrada e tente novamente."})
    
    endif

Return lRet
