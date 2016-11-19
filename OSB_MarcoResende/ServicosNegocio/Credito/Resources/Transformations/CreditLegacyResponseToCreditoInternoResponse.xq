(:: pragma bea:global-element-parameter parameter="$resultadoCreditLegacy1" element="ns0:ResultadoCreditLegacy" location="../Interfaces/Schemas/CreditLegacy.xsd" ::)
(:: pragma bea:global-element-return element="ns1:resultadoVerificaCreditoInterno" location="../../../../EBS/Credito/xsd/ParametrosCredito.xsd" ::)

declare namespace ns0 = "http://creditlegacy.com.br/SN/CreditLegacy";
declare namespace ns2 = "http://pucminas.br/MC/SOA/MarcoResende";
declare namespace ns1 = "http://pucminas.br/SN/Credito";
declare namespace xf = "http://tempuri.org/OSB_MarcoResende/ServicosNegocio/Credito/Resources/Transformations/CreditLegacyResponseToCreditoInternoResponse/";

declare function xf:CreditLegacyResponseToCreditoInternoResponse($resultadoCreditLegacy1 as element(ns0:ResultadoCreditLegacy))
    as element(ns1:resultadoVerificaCreditoInterno) {
        <ns1:resultadoVerificaCreditoInterno>
            <ns1:credito>
                <ns2:pessoa>
                    <ns2:cnpj>{ data($resultadoCreditLegacy1/ns0:cpf) }</ns2:cnpj>
                </ns2:pessoa>
            </ns1:credito>
        </ns1:resultadoVerificaCreditoInterno>
};

declare variable $resultadoCreditLegacy1 as element(ns0:ResultadoCreditLegacy) external;

xf:CreditLegacyResponseToCreditoInternoResponse($resultadoCreditLegacy1)
