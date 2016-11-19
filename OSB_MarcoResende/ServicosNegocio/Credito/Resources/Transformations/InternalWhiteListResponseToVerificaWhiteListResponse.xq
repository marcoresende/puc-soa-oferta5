(:: pragma bea:global-element-parameter parameter="$resultadoWhiteList1" element="ns1:ResultadoWhiteList" location="../Interfaces/Schemas/InternalWhiteList.xsd" ::)
(:: pragma bea:global-element-return element="ns0:resultadoVerificaWhiteList" location="../../../../EBS/Credito/xsd/ParametrosCredito.xsd" ::)

declare namespace ns0 = "http://pucminas.br/SN/Credito";
declare namespace ns2 = "http://pucminas.br/MC/SOA/MarcoResende";
declare namespace ns1 = "http://whitelist.com.br/SN/WhiteList";
declare namespace xf = "http://tempuri.org/OSB_MarcoResende/ServicosNegocio/Credito/Resources/Transformations/InternalWhiteListResponseToVerificaWhiteListResponse/";

declare function xf:InternalWhiteListResponseToVerificaWhiteListResponse($resultadoWhiteList1 as element(ns1:ResultadoWhiteList))
    as element(ns0:resultadoVerificaWhiteList) {
        <ns0:resultadoVerificaWhiteList>
            <ns0:mensagemRetorno>
                <ns2:codigo>1</ns2:codigo>
                <ns2:descricao>{ data($resultadoWhiteList1/ns1:num_documento) }</ns2:descricao>
                <ns2:isAtivo>{ data($resultadoWhiteList1/ns1:indica_white_list) }</ns2:isAtivo>
            </ns0:mensagemRetorno>
        </ns0:resultadoVerificaWhiteList>
};

declare variable $resultadoWhiteList1 as element(ns1:ResultadoWhiteList) external;

xf:InternalWhiteListResponseToVerificaWhiteListResponse($resultadoWhiteList1)
