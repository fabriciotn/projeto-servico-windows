
package br.gov.client1;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


/**
 * <p>Classe Java de RecebeDadosHemocomponente complex type.
 * 
 * <p>O seguinte fragmento do esquema especifica o conteúdo esperado contido dentro desta classe.
 * 
 * <pre>
 * &lt;complexType name="RecebeDadosHemocomponente">
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;sequence>
 *         &lt;element name="numeroBolsa" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *       &lt;/sequence>
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "RecebeDadosHemocomponente", propOrder = {
    "numeroBolsa"
})
public class RecebeDadosHemocomponente {

    protected String numeroBolsa;

    /**
     * Obtém o valor da propriedade numeroBolsa.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getNumeroBolsa() {
        return numeroBolsa;
    }

    /**
     * Define o valor da propriedade numeroBolsa.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setNumeroBolsa(String value) {
        this.numeroBolsa = value;
    }

}
