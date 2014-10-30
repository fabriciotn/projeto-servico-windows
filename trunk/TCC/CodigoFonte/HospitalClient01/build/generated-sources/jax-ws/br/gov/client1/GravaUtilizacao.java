
package br.gov.client1;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


/**
 * <p>Classe Java de GravaUtilizacao complex type.
 * 
 * <p>O seguinte fragmento do esquema especifica o conteúdo esperado contido dentro desta classe.
 * 
 * <pre>
 * &lt;complexType name="GravaUtilizacao">
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;sequence>
 *         &lt;element name="codPaciente" type="{http://www.w3.org/2001/XMLSchema}int"/>
 *         &lt;element name="codHemocomponente" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="data" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="motivo" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="responsavel" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="obs" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="codInstituicao" type="{http://www.w3.org/2001/XMLSchema}int"/>
 *       &lt;/sequence>
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "GravaUtilizacao", propOrder = {
    "codPaciente",
    "codHemocomponente",
    "data",
    "motivo",
    "responsavel",
    "obs",
    "codInstituicao"
})
public class GravaUtilizacao {

    protected int codPaciente;
    protected String codHemocomponente;
    protected String data;
    protected String motivo;
    protected String responsavel;
    protected String obs;
    protected int codInstituicao;

    /**
     * Obtém o valor da propriedade codPaciente.
     * 
     */
    public int getCodPaciente() {
        return codPaciente;
    }

    /**
     * Define o valor da propriedade codPaciente.
     * 
     */
    public void setCodPaciente(int value) {
        this.codPaciente = value;
    }

    /**
     * Obtém o valor da propriedade codHemocomponente.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getCodHemocomponente() {
        return codHemocomponente;
    }

    /**
     * Define o valor da propriedade codHemocomponente.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setCodHemocomponente(String value) {
        this.codHemocomponente = value;
    }

    /**
     * Obtém o valor da propriedade data.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getData() {
        return data;
    }

    /**
     * Define o valor da propriedade data.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setData(String value) {
        this.data = value;
    }

    /**
     * Obtém o valor da propriedade motivo.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getMotivo() {
        return motivo;
    }

    /**
     * Define o valor da propriedade motivo.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setMotivo(String value) {
        this.motivo = value;
    }

    /**
     * Obtém o valor da propriedade responsavel.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getResponsavel() {
        return responsavel;
    }

    /**
     * Define o valor da propriedade responsavel.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setResponsavel(String value) {
        this.responsavel = value;
    }

    /**
     * Obtém o valor da propriedade obs.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getObs() {
        return obs;
    }

    /**
     * Define o valor da propriedade obs.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setObs(String value) {
        this.obs = value;
    }

    /**
     * Obtém o valor da propriedade codInstituicao.
     * 
     */
    public int getCodInstituicao() {
        return codInstituicao;
    }

    /**
     * Define o valor da propriedade codInstituicao.
     * 
     */
    public void setCodInstituicao(int value) {
        this.codInstituicao = value;
    }

}
