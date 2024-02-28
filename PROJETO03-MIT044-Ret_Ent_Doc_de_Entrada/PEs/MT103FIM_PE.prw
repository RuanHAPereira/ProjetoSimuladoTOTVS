#include "totvs.ch"

User Function MT103FIM() 
    Local nOpcao := PARAMIXB[1]   // Opção Escolhida pelo usuario no aRotina 
    Local nConfirma := PARAMIXB[2]   // Se o usuario confirmou a operação de gravação da NFECODIGO DE APLICAÇÃO DO USUARIO
    local lRet := ''
        
    if nConfirma == 1
        If ExistBlock('GetData') 
            lRet := ExecBlock('GetData', .F., .F., nOpcao)
        Endif
    endif 

   // alert("cheguei aqui!!")
Return (lRet)
