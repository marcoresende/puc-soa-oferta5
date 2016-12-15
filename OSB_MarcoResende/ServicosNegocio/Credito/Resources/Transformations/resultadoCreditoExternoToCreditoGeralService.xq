(:: pragma bea:local-element-parameter parameter="$credito1" type="ns0:resultadoVerificaCreditoExterno/ns0:credito" location="../../../../EBS/Credito/xsd/ParametrosCredito.xsd" ::)

declare namespace ns0 = "http://pucminas.br/SN/Credito";
declare namespace ns1 = "http://pucminas.br/MC/SOA/MarcoResende";
declare namespace xf = "http://tempuri.org/OSB_MarcoResende/ServicosNegocio/Credito/Resources/Transformations/resultadoCreditoExternoToCreditoGeralService/";

declare function xf:resultadoCreditoExternoToCreditoGeralService($credito1 as element())
    as xs:integer {
        if ($credito1/ns1:situacao > 400) then
            (<score>200</score>)
        else 
            <score>0</score>
};

declare variable $credito1 as element() external;

xf:resultadoCreditoExternoToCreditoGeralService($credito1)
