
package br.gov.client1;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


/**
 * <p>Classe Java de GravaPaciente complex type.
 * 
 * <p>O seguinte fragmento do esquema especifica o conteúdo esperado contido dentro desta classe.
 * 
 * <pre>
 * &lt;complexType name="GravaPaciente">
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;sequence>
 *         &lt;element name="nome" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="cpf" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="rg" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="pai" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="mae" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="aboPac" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="rhPac" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="enderco" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *       &lt;/sequence>
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "GravaPaciente", propOrder = {
    "nome",
    "cpf",
    "rg",
    "pai",
    "mae",
    "aboPac",
    "rhPac",
    "enderco"
})
public class GravaPaciente {

    protected String nome;
    protected String cpf;
    protected String rg;
    protected String pai;
    protected String mae;
    protected String aboPac;
    protected String rhPac;
    protected String enderco;

    /**
     * Obtém o valor da propriedade nome.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getNome() {
        return nome;
    }

    /**
     * Define o valor da propriedade nome.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setNome(String value) {
        this.nome = value;
    }

    /**
     * Obtém o valor da propriedade cpf.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getCpf() {
        return cpf;
    }

    /**
     * Define o valor da propriedade cpf.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setCpf(String value) {
        this.cpf = value;
    }

    /**
     * Obtém o valor da propriedade rg.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getRg() {
        return rg;
    }

    /**
     * Define o valor da propriedade rg.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setRg(String value) {
        this.rg = value;
    }

    /**
     * Obtém o valor da propriedade pai.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getPai() {
        return pai;
    }

    /**
     * Define o valor da propriedade pai.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setPai(String value) {
        this.pai = value;
    }

    /**
     * Obtém o valor da propriedade mae.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getMae() {
        return mae;
    }

    /**
     * Define o valor da propriedade mae.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setMae(String value) {
        this.mae = value;
    }

    /**
     * Obtém o valor da propriedade aboPac.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getAboPac() {
        return aboPac;
    }

    /**
     * Define o valor da propriedade aboPac.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setAboPac(String value) {
        this.aboPac = value;
    }

    /**
     * Obtém o valor da propriedade rhPac.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getRhPac() {
        return rhPac;
    }

    /**
     * Define o valor da propriedade rhPac.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setRhPac(String value) {
        this.rhPac = value;
    }

    /**
     * Obtém o valor da propriedade enderco.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getEnderco() {
        return enderco;
    }

    /**
     * Define o valor da propriedade enderco.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setEnderco(String value) {
        this.enderco = value;
    }

}
