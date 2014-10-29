
package br.gov.client1;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


/**
 * <p>Classe Java de hemocomponente complex type.
 * 
 * <p>O seguinte fragmento do esquema especifica o conteúdo esperado contido dentro desta classe.
 * 
 * <pre>
 * &lt;complexType name="hemocomponente">
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;sequence>
 *         &lt;element name="abo" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="codigo" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="descricao" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="rh" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *       &lt;/sequence>
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "hemocomponente", propOrder = {
    "abo",
    "codigo",
    "descricao",
    "rh"
})
public class Hemocomponente {

    protected String abo;
    protected String codigo;
    protected String descricao;
    protected String rh;

    /**
     * Obtém o valor da propriedade abo.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getAbo() {
        return abo;
    }

    /**
     * Define o valor da propriedade abo.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setAbo(String value) {
        this.abo = value;
    }

    /**
     * Obtém o valor da propriedade codigo.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getCodigo() {
        return codigo;
    }

    /**
     * Define o valor da propriedade codigo.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setCodigo(String value) {
        this.codigo = value;
    }

    /**
     * Obtém o valor da propriedade descricao.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getDescricao() {
        return descricao;
    }

    /**
     * Define o valor da propriedade descricao.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setDescricao(String value) {
        this.descricao = value;
    }

    /**
     * Obtém o valor da propriedade rh.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getRh() {
        return rh;
    }

    /**
     * Define o valor da propriedade rh.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setRh(String value) {
        this.rh = value;
    }

}
