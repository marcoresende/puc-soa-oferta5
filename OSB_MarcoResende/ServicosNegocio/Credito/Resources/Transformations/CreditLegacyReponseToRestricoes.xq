(:: pragma bea:global-element-parameter parameter="$resultadoCreditLegacy1" element="ns0:ResultadoCreditLegacy" location="../Interfaces/Schemas/CreditLegacy.xsd" ::)
(:: pragma bea:schema-type-return type="ns1:Restricoes" location="../../../../ModeloCanonico/MC/Restricoes.xsd" ::)

declare namespace ns0 = "http://creditlegacy.com.br/SN/CreditLegacy";
declare namespace ns1 = "http://pucminas.br/MC/SOA/MarcoResende";
declare namespace xf = "http://tempuri.org/OSB_MarcoResende/ServicosNegocio/Credito/Resources/Transformations/CreditLegacyReponseToRestricoes/";

declare function xf:CreditLegacyReponseToRestricoes($resultadoCreditLegacy1 as element(ns0:ResultadoCreditLegacy))
    as element() {
        <ns1:Restricoes>
            <ns1:quantidade>{ fn:count($resultadoCreditLegacy1/ns0:restricoes/ns0:restricao) }</ns1:quantidade>
            <ns1:valorTotal>{ fn:sum($resultadoCreditLegacy1/ns0:restricoes/ns0:restricao/ns0:valor) }</ns1:valorTotal>
        </ns1:Restricoes>
};

declare variable $resultadoCreditLegacy1 as element(ns0:ResultadoCreditLegacy) external;

xf:CreditLegacyReponseToRestricoes($resultadoCreditLegacy1)
