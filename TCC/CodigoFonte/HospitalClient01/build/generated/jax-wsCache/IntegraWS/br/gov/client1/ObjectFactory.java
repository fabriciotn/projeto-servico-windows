
package br.gov.client1;

import javax.xml.bind.JAXBElement;
import javax.xml.bind.annotation.XmlElementDecl;
import javax.xml.bind.annotation.XmlRegistry;
import javax.xml.namespace.QName;


/**
 * This object contains factory methods for each 
 * Java content interface and Java element interface 
 * generated in the br.gov.client1 package. 
 * <p>An ObjectFactory allows you to programatically 
 * construct new instances of the Java representation 
 * for XML content. The Java representation of XML 
 * content can consist of schema derived interfaces 
 * and classes representing the binding of schema 
 * type definitions, element declarations and model 
 * groups.  Factory methods for each of these are 
 * provided in this class.
 * 
 */
@XmlRegistry
public class ObjectFactory {

    private final static QName _RecebeDados_QNAME = new QName("http://Integrador.gov.br/", "RecebeDados");
    private final static QName _RecebeDadosResponse_QNAME = new QName("http://Integrador.gov.br/", "RecebeDadosResponse");

    /**
     * Create a new ObjectFactory that can be used to create new instances of schema derived classes for package: br.gov.client1
     * 
     */
    public ObjectFactory() {
    }

    /**
     * Create an instance of {@link RecebeDadosResponse }
     * 
     */
    public RecebeDadosResponse createRecebeDadosResponse() {
        return new RecebeDadosResponse();
    }

    /**
     * Create an instance of {@link RecebeDados }
     * 
     */
    public RecebeDados createRecebeDados() {
        return new RecebeDados();
    }

    /**
     * Create an instance of {@link Hemocomponente }
     * 
     */
    public Hemocomponente createHemocomponente() {
        return new Hemocomponente();
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link RecebeDados }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://Integrador.gov.br/", name = "RecebeDados")
    public JAXBElement<RecebeDados> createRecebeDados(RecebeDados value) {
        return new JAXBElement<RecebeDados>(_RecebeDados_QNAME, RecebeDados.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link RecebeDadosResponse }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://Integrador.gov.br/", name = "RecebeDadosResponse")
    public JAXBElement<RecebeDadosResponse> createRecebeDadosResponse(RecebeDadosResponse value) {
        return new JAXBElement<RecebeDadosResponse>(_RecebeDadosResponse_QNAME, RecebeDadosResponse.class, null, value);
    }

}
