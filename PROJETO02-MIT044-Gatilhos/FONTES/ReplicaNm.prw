#INCLUDE "TOTVS.CH"
#INCLUDE "TOPCONN.CH"

/*/{Protheus.doc} User Function M460FIM
    Ponto de entrada para replicar o nome do cliente no documento de saída.
    @type  Function
    @author Ruan Henrique A. Pereira
    @since 26/09/2023
    /*/
User Function ReplicaNm()
    
    local aArea := GetArea()
    local aAreaSF2 := SF2->(GetArea())
    local aAreaSC5 := SC5->(GetArea())
        
        DbSelectArea("SF2")
           
        RecLock("SF2", .F.) //Valor logico para inclusao T ou alteração F
            SF2->F2_ZZNMCLI := SC5->C5_ZZNMCLI

        SF2->(MsUnlock())  
    
    RestArea(aAreaSC5)
    RestArea(aAreaSF2)
    RestArea(aArea)
    
Return

