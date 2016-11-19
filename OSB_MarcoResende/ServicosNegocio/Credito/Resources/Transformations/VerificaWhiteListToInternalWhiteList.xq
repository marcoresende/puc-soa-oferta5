(:: pragma bea:global-element-parameter parameter="$parametrosVerificaWhiteList1" element="ns0:parametrosVerificaWhiteList" location="../../../../EBS/Credito/xsd/ParametrosCredito.xsd" ::)
(:: pragma bea:global-element-return element="ns1:ParametrosWhiteList" location="../Interfaces/Schemas/InternalWhiteList.xsd" ::)

declare namespace ns0 = "http://pucminas.br/SN/Credito";
declare namespace ns2 = "http://pucminas.br/MC/SOA/MarcoResende";
declare namespace ns1 = "http://whitelist.com.br/SN/WhiteList";
declare namespace xf = "http://tempuri.org/OSB_MarcoResende/ServicosNegocio/Credito/Resources/Transformations/VerificaWhiteListToInternalWhiteList/";

declare function xf:VerificaWhiteListToInternalWhiteList($parametrosVerificaWhiteList1 as element(ns0:parametrosVerificaWhiteList))
    as element(ns1:ParametrosWhiteList) {
        <ns1:ParametrosWhiteList>
            <ns1:num_documento>{ data($parametrosVerificaWhiteList1/ns0:pessoa/ns2:cnpj) }</ns1:num_documento>
            <ns1:dt_nascimento>{ data($parametrosVerificaWhiteList1/ns0:pessoa/ns2:dataNascimento) }</ns1:dt_nascimento>
        </ns1:ParametrosWhiteList>
};

declare variable $parametrosVerificaWhiteList1 as element(ns0:parametrosVerificaWhiteList) external;

xf:VerificaWhiteListToInternalWhiteList($parametrosVerificaWhiteList1)
