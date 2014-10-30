
package br.gov.client1;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


/**
 * <p>Classe Java de paciente complex type.
 * 
 * <p>O seguinte fragmento do esquema especifica o conteúdo esperado contido dentro desta classe.
 * 
 * <pre>
 * &lt;complexType name="paciente">
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;sequence>
 *         &lt;element name="abo" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="cpf" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="endereco" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="id" type="{http://www.w3.org/2001/XMLSchema}int"/>
 *         &lt;element name="nome" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="nomeDaMae" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="nomeDoPai" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="rg" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
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
@XmlType(name = "paciente", propOrder = {
    "abo",
    "cpf",
    "endereco",
    "id",
    "nome",
    "nomeDaMae",
    "nomeDoPai",
    "rg",
    "rh"
})
public class Paciente {

    protected String abo;
    protected String cpf;
    protected String endereco;
    protected int id;
    protected String nome;
    protected String nomeDaMae;
    protected String nomeDoPai;
    protected String rg;
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
     * Obtém o valor da propriedade endereco.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getEndereco() {
        return endereco;
    }

    /**
     * Define o valor da propriedade endereco.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setEndereco(String value) {
        this.endereco = value;
    }

    /**
     * Obtém o valor da propriedade id.
     * 
     */
    public int getId() {
        return id;
    }

    /**
     * Define o valor da propriedade id.
     * 
     */
    public void setId(int value) {
        this.id = value;
    }

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
     * Obtém o valor da propriedade nomeDaMae.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getNomeDaMae() {
        return nomeDaMae;
    }

    /**
     * Define o valor da propriedade nomeDaMae.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setNomeDaMae(String value) {
        this.nomeDaMae = value;
    }

    /**
     * Obtém o valor da propriedade nomeDoPai.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getNomeDoPai() {
        return nomeDoPai;
    }

    /**
     * Define o valor da propriedade nomeDoPai.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setNomeDoPai(String value) {
        this.nomeDoPai = value;
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
