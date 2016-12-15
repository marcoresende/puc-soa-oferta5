(:: pragma bea:global-element-parameter parameter="$parametrosCreditoGeralRequest1" element="ns0:parametrosCreditoGeralRequest" location="../../../../EBS/Credito/wsdl/CreditoGeralService.wsdl" ::)
(:: pragma bea:global-element-return element="ns1:parametrosVerificaCreditoExterno" location="../../../../EBS/Credito/xsd/ParametrosCredito.xsd" ::)

declare namespace ns0 = "http://pucminas.br/SN/CreditoGeralService/MarcoResende";
declare namespace ns2 = "http://pucminas.br/MC/SOA/MarcoResende";
declare namespace ns1 = "http://pucminas.br/SN/Credito";
declare namespace xf = "http://tempuri.org/OSB_MarcoResende/ServicosNegocio/Credito/Resources/Transformations/parametroCreditoRequestGeralToVerificaCreditoExterno/";

declare function xf:parametroCreditoRequestGeralToVerificaCreditoExterno($parametrosCreditoGeralRequest1 as element(ns0:parametrosCreditoGeralRequest))
    as element(ns1:parametrosVerificaCreditoExterno) {
        <ns1:parametrosVerificaCreditoExterno>
            {
                let $pessoa := $parametrosCreditoGeralRequest1/pessoa
                return
                    <ns1:pessoa>
                        <ns2:id>{ data($pessoa/ns2:id) }</ns2:id>
                        <ns2:nome>{ data($pessoa/ns2:nome) }</ns2:nome>
                        <ns2:dataNascimento>{ data($pessoa/ns2:dataNascimento) }</ns2:dataNascimento>
                        <ns2:cnpj>{ data($pessoa/ns2:cnpj) }</ns2:cnpj>
                        <ns2:telefone>{ data($pessoa/ns2:telefone) }</ns2:telefone>
                    </ns1:pessoa>
            }
        </ns1:parametrosVerificaCreditoExterno>
};

declare variable $parametrosCreditoGeralRequest1 as element(ns0:parametrosCreditoGeralRequest) external;

xf:parametroCreditoRequestGeralToVerificaCreditoExterno($parametrosCreditoGeralRequest1)
