#INCLUDE "TOTVS.CH"

/*/{Protheus.doc} User Function MA103OPC
    Ponto de Entrada utilizado para adicionar itens no menu "Mais Opções"
    @type  Function
    @author Ruan Henrique
    @since 06/03/2024
/*/
User Function MA103OPC()
    local aRet := {}

    Aadd(aRet, {"Imprimir formulario", "U_FormDev()", 0, 6})
Return aRet
