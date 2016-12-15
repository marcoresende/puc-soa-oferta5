(:: pragma bea:global-element-parameter parameter="$parametrosVerificaCreditoExterno" element="ns1:parametrosVerificaCreditoExterno" location="../../../../EBS/Credito/xsd/ParametrosCredito.xsd" ::)
(:: pragma bea:global-element-return element="ns0:ParametrosSerasa" location="../Interfaces/Schemas/Serasa.xsd" ::)

declare namespace ns0 = "http://serasa.com.br/SN/Serasa";
declare namespace ns2 = "http://pucminas.br/MC/SOA/MarcoResende";
declare namespace ns1 = "http://pucminas.br/SN/Credito";
declare namespace xf = "http://tempuri.org/OSB_MarcoResende/ServicosNegocio/Credito/Resources/Transformations/parametrosVerificaCreditoExternoToParametrosSerasa/";

declare function xf:parametrosVerificaCreditoExternoToParametrosSerasa($parametrosVerificaCreditoExterno as element(ns1:parametrosVerificaCreditoExterno))
    as element(ns0:ParametrosSerasa) {
        <ns0:ParametrosSerasa>
            <ns0:num_documento>{ data($parametrosVerificaCreditoExterno/ns1:pessoa/ns2:cnpj) }</ns0:num_documento>
            <ns0:dt_nascimento>{ data($parametrosVerificaCreditoExterno/ns1:pessoa/ns2:dataNascimento) }</ns0:dt_nascimento>
        </ns0:ParametrosSerasa>
};

declare variable $parametrosVerificaCreditoExterno as element(ns1:parametrosVerificaCreditoExterno) external;

xf:parametrosVerificaCreditoExternoToParametrosSerasa($parametrosVerificaCreditoExterno)
