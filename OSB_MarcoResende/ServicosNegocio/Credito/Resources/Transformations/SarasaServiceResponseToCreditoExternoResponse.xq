(:: pragma bea:global-element-parameter parameter="$resultadoSerasa1" element="ns0:ResultadoSerasa" location="../Interfaces/Schemas/Serasa.xsd" ::)
(:: pragma bea:global-element-return element="ns1:resultadoVerificaCreditoExterno" location="../../../../EBS/Credito/xsd/ParametrosCredito.xsd" ::)

declare namespace ns0 = "http://serasa.com.br/SN/Serasa";
declare namespace ns2 = "http://pucminas.br/MC/SOA/MarcoResende";
declare namespace ns1 = "http://pucminas.br/SN/Credito";
declare namespace xf = "http://tempuri.org/OSB_MarcoResende/ServicosNegocio/Credito/Resources/Transformations/SarasaServiceResponseToCreditoExternoResponse/";

declare function xf:SarasaServiceResponseToCreditoExternoResponse($resultadoSerasa1 as element(ns0:ResultadoSerasa))
    as element(ns1:resultadoVerificaCreditoExterno) {
        <ns1:resultadoVerificaCreditoExterno>
            <ns1:credito>
                <ns2:pessoa>
                    <ns2:cnpj>{ data($resultadoSerasa1/ns0:num_documento) }</ns2:cnpj>
                </ns2:pessoa>
                <ns2:indicaCreditoExterno>
                    {
                        if (data($resultadoSerasa1/ns0:valor_restricao) > 400.0) then
                            (xs:boolean("true"))
                        else 
                            xs:boolean("false")
                    }
</ns2:indicaCreditoExterno>
                <ns2:indicaCreditoInterno>{ xs:boolean("false") }</ns2:indicaCreditoInterno>
                <ns2:indicaWhiteList>{ xs:boolean("false") }</ns2:indicaWhiteList>
                <ns2:situacao>
                    {
                        if ($resultadoSerasa1/ns0:valor_restricao > 400.0) then
                            (200)
                        else 
                            0
                    }
</ns2:situacao>
            </ns1:credito>
        </ns1:resultadoVerificaCreditoExterno>
};

declare variable $resultadoSerasa1 as element(ns0:ResultadoSerasa) external;

xf:SarasaServiceResponseToCreditoExternoResponse($resultadoSerasa1)
