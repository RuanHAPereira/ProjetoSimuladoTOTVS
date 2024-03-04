//Bibliotecas
#Include "Totvs.ch"
#Include "FWMVCDef.ch"

//Variveis Estaticas
Static cTitulo    := "CADASTRO DE METAS DE VENDA"
Static cCamposChv := "Z13_COMPET;"
Static cCampoGrid := "Z13_SEQUEN; Z13_VEND; Z13_GRUPO; Z13_DSCGRU; Z13_PRODUTO; Z13_DSCPRO; Z13_CODIGO; Z13_DESCRI;  Z13_DSCVEN;   Z13_QUANT; Z13_QUANT2;Z13_STATUS; Z13_VLMALV; Z13_TOTALV;"
Static cAlias     := "Z13"

/*/{Protheus.doc} User Function CadVenda
@author Ruan Pereira
@since 02/03/2024
@version 1.0
@type function
/*/

User Function CadVenda()
	Local aArea   := FWGetArea()
	Local oBrowse
	Private aRotina := {}

	//Definicao do menu
	aRotina := MenuDef()

	//Instanciando o browse
	oBrowse := FWMBrowse():New()
	oBrowse:SetAlias(cAlias)
	oBrowse:SetDescription(cTitulo)

	//Ativa a Browse
	oBrowse:Activate()

	FWRestArea(aArea)
Return Nil

/*/{Protheus.doc} MenuDef
Menu de opcoes na funcao CadVenda
@author Ruan Pereira
@since 02/03/2024
@version 1.0
@type function
/*/

Static Function MenuDef()

	Local aRotina := {}

	//Adicionando opcoes do menu
	ADD OPTION aRotina TITLE "Visualizar" ACTION "VIEWDEF.CadVenda" OPERATION 1 ACCESS 0
	ADD OPTION aRotina TITLE "Incluir"    ACTION "VIEWDEF.CadVenda" OPERATION 3 ACCESS 0
	ADD OPTION aRotina TITLE "Alterar"    ACTION "VIEWDEF.CadVenda" OPERATION 4 ACCESS 0
	ADD OPTION aRotina TITLE "Excluir"    ACTION "VIEWDEF.CadVenda" OPERATION 5 ACCESS 0

Return aRotina

/*/{Protheus.doc} ModelDef
Modelo de dados na funcao CadVenda
@author Ruan Pereira
@since 02/03/2024
@version 1.0
@type function
/*/

Static Function ModelDef()

	Local oStruPai   := FWFormStruct(1, cAlias, {|cCampo| Alltrim(cCampo) $ cCamposChv})
	Local oStruFilho := FWFormStruct(1, cAlias, {|cCampo| Alltrim(cCampo) $ cCampoGrid})
	Local aRelation  := {}
	Local oModel

	//Cria o modelo de dados para cadastro
	oModel := MPFormModel():New("CadVendM", /*bPre*/, /*bPos*/, /*bCommit*/, /*bCancel*/)
	oModel:AddFields("Z13MASTER", /*cOwner*/, oStruPai)
	oModel:AddGrid("Z13DETAIL","Z13MASTER",oStruFilho,/*bLinePre*/, /*bLinePost*/,/*bPre - Grid Inteiro*/,/*bPos - Grid Inteiro*/,/*bLoad - Carga do modelo manualmente*/)
	oModel:SetDescription("Modelo de dados - " + cTitulo)
	oModel:GetModel("Z13MASTER"):SetDescription( "Dados de - " + cTitulo)
	oModel:GetModel("Z13DETAIL"):SetDescription( "Grid de - " + cTitulo)
	oModel:SetPrimaryKey({"Z13_FILIAL", "Z13_COMPET"})

	//Fazendo o relacionamento
	aAdd(aRelation, {"Z13_FILIAL", "FWxFilial('Z13')"} )
	aAdd(aRelation, {"Z13_COMPET", "Z13_COMPET"})
	oModel:SetRelation("Z13DETAIL", aRelation, Z13->(IndexKey(1)))
	
	//Definindo campos unicos da linha
	oModel:GetModel("Z13DETAIL"):SetUniqueLine({'Z13_VEND', 'Z13_SEQUEN', 'Z13_STATUS', 'Z13_VLMALV', 'Z13_TOTALV'})

Return oModel

/*/{Protheus.doc} ViewDef
Visualizacao de dados na funcao CadVenda
@author Ruan Pereira
@since 02/03/2024
@version 1.0
@type function
/*/

Static Function ViewDef()
	Local oModel     := FWLoadModel("CadVenda")
	Local oStruPai   := FWFormStruct(2, cAlias, {|cCampo| Alltrim(cCampo) $ cCamposChv})
	Local oStruFilho := FWFormStruct(2, cAlias, {|cCampo| Alltrim(cCampo) $ cCampoGrid})
	Local oView

	//Cria a visualizacao do cadastro
	oView := FWFormView():New()
	oView:SetModel(oModel)
	oView:AddField("VIEW_Z13", oStruPai, "Z13MASTER")
	oView:AddGrid("GRID_Z13", oStruFilho, "Z13DETAIL")

	//Partes da tela
	oView:CreateHorizontalBox("CABEC", 20)
	oView:CreateHorizontalBox("GRID", 80)
	oView:SetOwnerView("VIEW_Z13", "CABEC")
	oView:SetOwnerView("GRID_Z13", "GRID")

	//Titulos
	oView:EnableTitleView("VIEW_Z13", "Cabecalho - Z13")
	oView:EnableTitleView("GRID_Z13", "Grid - Z13")

	//Adicionando campo incremental na grid
	oView:AddIncrementField("GRID_Z13", "Z13_SEQUEN")

Return oView
