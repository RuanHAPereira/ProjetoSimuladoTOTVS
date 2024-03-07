#INCLUDE "TOTVS.CH"

/*/{Protheus.doc} User Function MA103OPC
    Ponto de Entrada utilizado para adicionar itens no menu "Mais Opções"
    @type  Function
    @author TOTVS IP/TM
    @since 15/05/2023
/*/
User Function MA103OPC()
    local aRet := {}

    Aadd(aRet, {"Imprimir formulario", "U_FormDev()", 0, 6})
Return aRet
