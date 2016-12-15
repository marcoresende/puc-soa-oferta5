(:: pragma bea:global-element-parameter parameter="$resultadoVerificaCreditoExterno1" element="ns0:resultadoVerificaCreditoExterno" location="../../../../EBS/Credito/xsd/ParametrosCredito.xsd" ::)
(:: pragma bea:global-element-return element="ns1:parametrosCreditoGeralResponse" location="../../../../EBS/Credito/wsdl/CreditoGeralService.wsdl" ::)

declare namespace ns0 = "http://pucminas.br/SN/Credito";
declare namespace ns2 = "http://pucminas.br/MC/SOA/MarcoResende";
declare namespace ns1 = "http://pucminas.br/SN/CreditoGeralService/MarcoResende";
declare namespace xf = "http://tempuri.org/OSB_MarcoResende/ServicosNegocio/Credito/Resources/Transformations/resultadoVerificaCreditoExternoToCreditoGeralService/";

declare function xf:resultadoVerificaCreditoExternoToCreditoGeralService($resultadoVerificaCreditoExterno1 as element(ns0:resultadoVerificaCreditoExterno))
    as element(ns1:parametrosCreditoGeralResponse) {
        <ns1:parametrosCreditoGeralResponse>
            <score>
                {
                    if ($resultadoVerificaCreditoExterno1/ns0:credito/ns2:situacao > 400) then
                        (200)
                    else 
                        0
                }
</score>
        </ns1:parametrosCreditoGeralResponse>
};

declare variable $resultadoVerificaCreditoExterno1 as element(ns0:resultadoVerificaCreditoExterno) external;

xf:resultadoVerificaCreditoExternoToCreditoGeralService($resultadoVerificaCreditoExterno1)
