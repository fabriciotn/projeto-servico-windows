
package br.gov.client1;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


/**
 * <p>Classe Java de reacoes complex type.
 * 
 * <p>O seguinte fragmento do esquema especifica o conteúdo esperado contido dentro desta classe.
 * 
 * <pre>
 * &lt;complexType name="reacoes">
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;sequence>
 *         &lt;element name="dataProcedimento" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="id" type="{http://www.w3.org/2001/XMLSchema}int"/>
 *         &lt;element name="idPaciente" type="{http://www.w3.org/2001/XMLSchema}int"/>
 *         &lt;element name="idUtilizacao" type="{http://www.w3.org/2001/XMLSchema}int"/>
 *         &lt;element name="nomePaciente" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="reacao" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *       &lt;/sequence>
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "reacoes", propOrder = {
    "dataProcedimento",
    "id",
    "idPaciente",
    "idUtilizacao",
    "nomePaciente",
    "reacao"
})
public class Reacoes {

    protected String dataProcedimento;
    protected int id;
    protected int idPaciente;
    protected int idUtilizacao;
    protected String nomePaciente;
    protected String reacao;

    /**
     * Obtém o valor da propriedade dataProcedimento.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getDataProcedimento() {
        return dataProcedimento;
    }

    /**
     * Define o valor da propriedade dataProcedimento.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setDataProcedimento(String value) {
        this.dataProcedimento = value;
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
     * Obtém o valor da propriedade idPaciente.
     * 
     */
    public int getIdPaciente() {
        return idPaciente;
    }

    /**
     * Define o valor da propriedade idPaciente.
     * 
     */
    public void setIdPaciente(int value) {
        this.idPaciente = value;
    }

    /**
     * Obtém o valor da propriedade idUtilizacao.
     * 
     */
    public int getIdUtilizacao() {
        return idUtilizacao;
    }

    /**
     * Define o valor da propriedade idUtilizacao.
     * 
     */
    public void setIdUtilizacao(int value) {
        this.idUtilizacao = value;
    }

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

    /**
     * Obtém o valor da propriedade reacao.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getReacao() {
        return reacao;
    }

    /**
     * Define o valor da propriedade reacao.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setReacao(String value) {
        this.reacao = value;
    }

}
