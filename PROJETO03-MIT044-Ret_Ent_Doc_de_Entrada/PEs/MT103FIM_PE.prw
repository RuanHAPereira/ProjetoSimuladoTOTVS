#include "totvs.ch"

User Function MT103FIM() 
    Local nOpcao := PARAMIXB[1]   // Op��o Escolhida pelo usuario no aRotina 
    Local nConfirma := PARAMIXB[2]   // Se o usuario confirmou a opera��o de grava��o da NFECODIGO DE APLICA��O DO USUARIO
    local lRet := ''
        
    if nConfirma == 1
        If ExistBlock('GetData') 
            lRet := ExecBlock('GetData', .F., .F., nOpcao)
        Endif
    endif 

   // alert("cheguei aqui!!")
Return (lRet)
