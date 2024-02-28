#include 'protheus.ch'
#include 'parmtype.ch'

User Function MT100GE2()
     
     Local nOpc  := PARAMIXB[2]
     local cForn := SE2->E2_FORNECE+SE2->E2_LOJA
   
     //.....Exemplo de customização

     If nOpc == 1 //.. inclusao
         
          If ExistBlock('GetCodPag')
               lRet := ExecBlock('GetCodPag', .F., .F., {cForn})
          Endif 
         
     Endif

Return(Nil)
