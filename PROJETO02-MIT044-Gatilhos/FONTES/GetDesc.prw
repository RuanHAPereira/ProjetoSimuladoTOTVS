#INCLUDE "TOTVS.CH"

/*/{Protheus.doc} GetDesc
    User Function que trata e adquiri os dados a serem passados para o PE MT103IPC
    @type function
    @author Ruan Henrique
    @since 04/10/2023
/*/
User Function GetDesc()

    Local aArea     := GetArea()
    Local aAreaSD1   := SD1->(GetArea())
    Local aAreaSC7   := SC7->(GetArea())
    //Local nPosCod   := aScan(aHeader,{|x| AllTrim(Upper(x[2]))=="D1_COD" })
    //! função aScan informa em qual posiçao do grid (aCols) o campo esta posicionado
    Local nPosCampo := aScan(aHeader,{|x| AllTrim(Upper(x[2]))=="D1_ZZDESCR" })
    Local nPosPed   := aScan(aHeader,{|x| AllTrim(Upper(x[2]))=="D1_PEDIDO" })
    Local nPosItPC  := aScan(aHeader,{|x| AllTrim(Upper(x[2]))=="D1_ITEMPC" })

    Local nAtual    := 0 //! contador
    Local lRet      :=  .t.
    Local cDescrPrd := "" //! variavel que receberá um valor, definida como nula ("")

    //Percorrendo os aCols
    For nAtual := 1 To Len(aCols)

        //! Usada funçao POSICIONE para encontrar o valor de aCols numero do pedido de compra e do item pedido de compra
        cDescrPrd   := Posicione('SC7', 1, FWxFilial('SC7')+aCols[nAtual][nPosPed]+aCols[nAtual][nPosItPC], "C7_DESCRI")
        aCols[nAtual][nPosCampo] := cDescrPrd //!atribuindo dados obtidos acima na variavel 

    Next
     
    RestArea(aAreaSC7)
    RestArea(aAreaSD1)
    RestArea(aArea)

Return(lRet)
