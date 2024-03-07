#include "protheus.ch"
#INCLUDE 'FWPRINTSETUP.CH'
#INCLUDE 'RPTDEF.CH'

#DEFINE PRETO RGB(000, 000, 000)

/*/{Protheus.doc} User Function nomeFunction
    Fonte para impressao de Formulario de Devolucao caso solicitado 
    @type  Function 
    @author TOTVS IP/TM
    @since 09/05/2023
    /*/
User Function FormDev()
    Processa({|| Print()}, 'Aguarde...', 'O formulario está sendo gerado', .F.)//! regua de processamento
Return 

Static function Print()

    local cPasta   := GetTempPath()
    local cArquivo := 'Formulario_Devolucao.pdf'

    //! TFont():New(cNomeFont,/Compat./, nFontSize, /Compat./, lBold,/Compat./,/Compat./,/Compat./,/Compat./, lUnderline, lItalic)
    Private oFont10  := TFont():New('Arial', /*Compat*/, 10, /*Compat*/, .F. /*Negrito*/, /*Compat*/, /*Compat*/, /*Compat*/, /*Compat*/, .F./*Sublinhado*/, .F./*Italico*/)
    Private oFont12  := TFont():New('Arial', /*Compat*/, 12, /*Compat*/, .F., /*Compat*/, /*Compat*/, /*Compat*/, /*Compat*/, .F., .F.)
    Private oFont12B := TFont():New('Arial', /*Compat*/, 12, /*Compat*/, .T., /*Compat*/, /*Compat*/, /*Compat*/, /*Compat*/, .F., .F.)
    Private oFont14  := TFont():New('Arial', /*Compat*/, 14, /*Compat*/, .T., /*Negrito*/,/*Compat*/,/*Compat*/,/*Compat*/,.F.,.F.)
    Private oFont16  := TFont():New('Arial', /*Compat*/, 16, /*Compat*/, .T., /*Compat*/, /*Compat*/, /*Compat*/, /*Compat*/, .F., .F.)
    Private oPrint

    oPrint:= FwMSPrinter():New(cArquivo, IMP_PDF, .F.,"", .T., , @oPrint, "", , , ,.T.) //!Estanciando o Objeto
    oPrint:cPathPDF := cPasta //!criando caminho de salvamento do arquivo 
    oPrint:SetPortrait()//!setando como retrato
    oPrint:SetPaperSize(9)//!atribuindo tamanho da folha... numero 9 indica folha A4
    oPrint:StartPage()//!inicio da pagina
    Cabecalho()
    oPrint:EndPage()//!Fim da pagina
    oPrint:Preview()//!objeto que chama função de previa, antes que o formulario seja enviado a impressora. 

Return

Static Function Cabecalho()//! Inicio Formulario

    oPrint:Say(45, 60, "UTILIZAR EM CASO DE DEVOLUÇÃO TOTAL DA NOTA FISCAL"                , oFont16, /*LargText*/ , PRETO)
    oPrint:Say(80, 60, "DADOS DO RESPONSÁVEL PELO RECEBIMENTO E CARIMBO DA FRANQUIA"       , oFont12B, /*LargText*/, PRETO)

    oPrint:Say(110, 405, "CARIMBO"                                                         , oFont12B, /*LargText*/, PRETO)

    oPrint:Say(130, 20, 'NOME:________________________________________________________'    , oFont12, /*LargText*/ , PRETO)
    oPrint:Say(150, 20, 'RG:__________________________________________________________'    , oFont12, /*LargText*/ , PRETO)
    oPrint:Say(170, 20, 'ASSINATURA:__________________________________________________'    , oFont12, /*LargText*/ , PRETO)

    oPrint:Say(210, 200, "DADOS DO MOTORISTA"                                              , oFont12B, /*LargText*/, PRETO)

    oPrint:Say(250, 20, 'NOME:________________________________________________________'    , oFont12, /*LargText*/ , PRETO)
    oPrint:Say(270, 20, 'RG:__________________________________________________________'    , oFont12, /*LargText*/ , PRETO)
    oPrint:Say(290, 20, 'ASSINATURA:__________________________________________________'    , oFont12, /*LargText*/ , PRETO)

    oPrint:Box(120,   350,    185,   500, "-2")

    oPrint:Say(315, 20, 'Favor assinalar o motivo da devolução: '                           , oFont12, /*LargText*/, PRETO)

    //!Boxes coluna esquerda
    oPrint:Box(335,   20,    355,   45, "-2")
    oPrint:Box(375,   20,    395,   45, "-2")
    oPrint:Box(415,   20,    435,   45, "-2")
    oPrint:Box(455,   20,    475,   45, "-2")
    oPrint:Box(495,   20,    515,   45, "-2")
    oPrint:Box(535,   20,    555,   45, "-2")
    oPrint:Box(575,   20,    595,   45, "-2")

    //!Boxes coluna central
    oPrint:Box(335,   325,   355,   300, "-2")
    oPrint:Box(375,   325,   395,   300, "-2")
    oPrint:Box(415,   325,   435,   300, "-2")
    oPrint:Box(455,   325,   475,   300, "-2")
    oPrint:Box(495,   325,   515,   300, "-2")
    oPrint:Box(535,   325,   555,   300, "-2")
    oPrint:Box(575,   325,   595,   300, "-2")

    //!Textos referentes aos boxes da esquerda
    oPrint:Say(346,   50, "Falta de produto"                            , oFont12, /*LargText*/, PRETO)
    oPrint:Say(387,   50, "Produto avariado"                            , oFont12, /*LargText*/, PRETO)
    oPrint:Say(430,   50, "Produto vencido ou proximo ao vencimento"    , oFont12, /*LargText*/, PRETO)
    oPrint:Say(470,   50, "Quantidade divergente"                       , oFont12, /*LargText*/, PRETO)
    oPrint:Say(508,   50, "Inversão de produto"                         , oFont12, /*LargText*/, PRETO)
    oPrint:Say(549,   50, "Não fez pedido"                              , oFont12, /*LargText*/, PRETO)
    oPrint:Say(590,   50, "Pedido duplicado"                            , oFont12, /*LargText*/, PRETO)

    //?Textos referentes aos boxes centrais
    oPrint:Say(346,   330, "Preço divergente"                           , oFont12, /*LargText*/, PRETO)
    oPrint:Say(387,   330, "Sem espaço"                                 , oFont12, /*LargText*/, PRETO)
    oPrint:Say(430,   330, "Excesso de produto"                         , oFont12, /*LargText*/, PRETO)
    oPrint:Say(470,   330, "Veículo chegou do dia ou da hora combinada" , oFont12, /*LargText*/, PRETO)
    oPrint:Say(508,   330, "Loja fechada"                               , oFont12, /*LargText*/, PRETO)
    oPrint:Say(549,   330, "Responsável ausente"                        , oFont12, /*LargText*/, PRETO)
    oPrint:Say(590,   330, "Outros"                                     , oFont12, /*LargText*/, PRETO)


    oPrint:Say(620, 20, "Observações:", oFont12, /*LargText*/, PRETO)

    oPrint:Say(800, 260, "Este documento é propriedade da TOTVS. Todos os direitos reservados. ")

Return



