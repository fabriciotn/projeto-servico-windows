
package br.gov.client1;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


/**
 * <p>Classe Java de GravarReacoes complex type.
 * 
 * <p>O seguinte fragmento do esquema especifica o conteúdo esperado contido dentro desta classe.
 * 
 * <pre>
 * &lt;complexType name="GravarReacoes">
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;sequence>
 *         &lt;element name="reacao" type="{http://Integrador.gov.br/}reacoes" minOccurs="0"/>
 *       &lt;/sequence>
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "GravarReacoes", propOrder = {
    "reacao"
})
public class GravarReacoes {

    protected Reacoes reacao;

    /**
     * Obtém o valor da propriedade reacao.
     * 
     * @return
     *     possible object is
     *     {@link Reacoes }
     *     
     */
    public Reacoes getReacao() {
        return reacao;
    }

    /**
     * Define o valor da propriedade reacao.
     * 
     * @param value
     *     allowed object is
     *     {@link Reacoes }
     *     
     */
    public void setReacao(Reacoes value) {
        this.reacao = value;
    }

}
