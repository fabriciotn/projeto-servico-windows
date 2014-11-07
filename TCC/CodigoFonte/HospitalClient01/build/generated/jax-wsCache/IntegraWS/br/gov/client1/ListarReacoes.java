
package br.gov.client1;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


/**
 * <p>Classe Java de ListarReacoes complex type.
 * 
 * <p>O seguinte fragmento do esquema especifica o conteúdo esperado contido dentro desta classe.
 * 
 * <pre>
 * &lt;complexType name="ListarReacoes">
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;sequence>
 *         &lt;element name="nomePaciente" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *       &lt;/sequence>
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "ListarReacoes", propOrder = {
    "nomePaciente"
})
public class ListarReacoes {

    protected String nomePaciente;

    /**
     * Obtém o valor da propriedade nomePaciente.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getNomePaciente() {
        return nomePaciente;
    }

    /**
     * Define o valor da propriedade nomePaciente.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setNomePaciente(String value) {
        this.nomePaciente = value;
    }

}
