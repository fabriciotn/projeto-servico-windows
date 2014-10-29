
package br.gov.client1;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlType;


/**
 * <p>Classe Java de RecebeDadosResponse complex type.
 * 
 * <p>O seguinte fragmento do esquema especifica o conteúdo esperado contido dentro desta classe.
 * 
 * <pre>
 * &lt;complexType name="RecebeDadosResponse">
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;sequence>
 *         &lt;element name="return" type="{http://Integrador.gov.br/}hemocomponente" minOccurs="0"/>
 *       &lt;/sequence>
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "RecebeDadosResponse", propOrder = {
    "_return"
})
public class RecebeDadosResponse {

    @XmlElement(name = "return")
    protected Hemocomponente _return;

    /**
     * Obtém o valor da propriedade return.
     * 
     * @return
     *     possible object is
     *     {@link Hemocomponente }
     *     
     */
    public Hemocomponente getReturn() {
        return _return;
    }

    /**
     * Define o valor da propriedade return.
     * 
     * @param value
     *     allowed object is
     *     {@link Hemocomponente }
     *     
     */
    public void setReturn(Hemocomponente value) {
        this._return = value;
    }

}
