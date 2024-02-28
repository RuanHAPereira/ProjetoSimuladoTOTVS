#include 'Totvs.ch'

User Function GetData()

    Local cTitle := "Retirada e Entrega"
    Local cTxtDtRet := "Data Retirada"
    Local cTxtHrRet := "Hora Retirada"
    Local cTxtDtEnt := "Data Entrega"
    Local cTxtHrEnt := "Hora Entrega"
    Local oDlg
    Private nDtRet := Date()
    Private cHrRet := Space(5)
    Private nDtEnt := Date()
    Private cHrEnt := Space(5)

    DEFINE MSDIALOG oDlg TITLE cTitle FROM 000,000 TO 250, 300 PIXEL

    @ 010, 010 SAY cTxtDtRet        SIZE 55, 07 OF oDlg PIXEL
    @ 030, 010 SAY cTxtHrRet        SIZE 55, 07 OF oDlg PIXEL
    @ 050, 010 SAY cTxtDtEnt        SIZE 55, 07 OF oDlg PIXEL
    @ 070, 010 SAY cTxtHrEnt        SIZE 55, 07 OF oDlg PIXEL

    @ 010, 070 MSGET nDtRet     SIZE 55, 11 OF oDlg PIXEL
    @ 030, 070 MSGET cHrRet     SIZE 55, 11 OF oDlg PIXEL 
    @ 050, 070 MSGET nDtEnt     SIZE 55, 11 OF oDlg PIXEL
    @ 070, 070 MSGET cHrEnt     SIZE 55, 11 OF oDlg PIXEL 
    @ 100, 010 BUTTON 'Confirmar' SIZE 55, 11 OF oDlg PIXEL;
     ACTION {Confirmar(nDtEnt,nDtRet,cHrEnt,cHrRet), oDlg:End()}
    @ 100, 070 BUTTON 'Cancelar' SIZE 55, 11 OF oDlg PIXEL;
     ACTION {Cancela(), oDlg:End()}
    
    ACTIVATE MSDIALOG oDlg CENTERED

return

Static Function Confirmar(nDtEnt,nDtRet,cHrEnt,cHrRet)
    Local aArea := GetArea()
    Local aAreaSF1 := SF1->(GetArea())
    Local lValid := .F. 

    DbSelectArea("SF1")
           
    Do While !lValid

        If Empty(cHrRet) .OR. Empty(cHrEnt)
            FwAlertError("Todos os campos são obrigatórios. Preencha todos os campos.", "Erro")

            If Empty(cHrRet)
                cHrRet := FwInputBox("Hora Retirada")
            ElseIf Empty(cHrEnt)
                cHrEnt := FwInputBox("Hora Entrega")
            EndIf

            lValid := .F.

        ElseIf nDtRet > nDtEnt
            FwAlertError("A data de retirada não pode ser posterior à data de entrega.", "Erro")
            lValid := .F.
        Else
            lValid := .T.
        EndIf
    EndDo

    RecLock("SF1", .F.) //?Valor logico para inclusao T ou alteração F
        SF1->F1_ZZDTRET := nDtRet
        SF1->F1_ZZHRRET := cHrRet
        SF1->F1_ZZDTENT := nDtEnt
        SF1->F1_ZZHRENT := cHrEnt
    SF1->(MsUnlock())  

    FwAlertSuccess("Registro de data e hora da retirada e entrega", "Sucesso")
    
    RestArea(aAreaSF1)
    RestArea(aArea)
Return


Static Function Cancela()

    FwAlertInfo("Operação cancelada pelo usuário.", "Cancelado")

Return
