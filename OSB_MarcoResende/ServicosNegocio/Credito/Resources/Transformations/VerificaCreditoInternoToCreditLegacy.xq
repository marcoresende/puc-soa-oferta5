(:: pragma bea:global-element-parameter parameter="$parametrosVerificaCreditoInterno1" element="ns0:parametrosVerificaCreditoInterno" location="../../../../EBS/Credito/xsd/ParametrosCredito.xsd" ::)
(:: pragma bea:global-element-return element="ns1:ParametrosCreditLegacy" location="../Interfaces/Schemas/CreditLegacy.xsd" ::)

declare namespace ns0 = "http://pucminas.br/SN/Credito";
declare namespace ns2 = "http://pucminas.br/MC/SOA/MarcoResende";
declare namespace ns1 = "http://creditlegacy.com.br/SN/CreditLegacy";
declare namespace xf = "http://tempuri.org/OSB_MarcoResende/ServicosNegocio/Credito/Resources/Transformations/VerificaCreditoInternoToCreditLegacy/";

declare function xf:VerificaCreditoInternoToCreditLegacy($parametrosVerificaCreditoInterno1 as element(ns0:parametrosVerificaCreditoInterno))
    as element(ns1:ParametrosCreditLegacy) {
        <ns1:ParametrosCreditLegacy>
            <ns1:cpf>{ data($parametrosVerificaCreditoInterno1/ns0:pessoa/ns2:cnpj) }</ns1:cpf>
            <ns1:dt_solicitacao>{ fn:current-date() }</ns1:dt_solicitacao>
        </ns1:ParametrosCreditLegacy>
};

declare variable $parametrosVerificaCreditoInterno1 as element(ns0:parametrosVerificaCreditoInterno) external;

xf:VerificaCreditoInternoToCreditLegacy($parametrosVerificaCreditoInterno1)
