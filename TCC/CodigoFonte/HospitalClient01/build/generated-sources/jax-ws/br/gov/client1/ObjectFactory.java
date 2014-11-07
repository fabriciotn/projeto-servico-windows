
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

    private final static QName _ListarReacoesResponse_QNAME = new QName("http://Integrador.gov.br/", "ListarReacoesResponse");
    private final static QName _GravaUtilizacaoResponse_QNAME = new QName("http://Integrador.gov.br/", "GravaUtilizacaoResponse");
    private final static QName _RecebeDadosPacienteResponse_QNAME = new QName("http://Integrador.gov.br/", "RecebeDadosPacienteResponse");
    private final static QName _GravaPaciente_QNAME = new QName("http://Integrador.gov.br/", "GravaPaciente");
    private final static QName _GravaPacienteResponse_QNAME = new QName("http://Integrador.gov.br/", "GravaPacienteResponse");
    private final static QName _ListarReacoes_QNAME = new QName("http://Integrador.gov.br/", "ListarReacoes");
    private final static QName _RecebeDadosPaciente_QNAME = new QName("http://Integrador.gov.br/", "RecebeDadosPaciente");
    private final static QName _GravaUtilizacao_QNAME = new QName("http://Integrador.gov.br/", "GravaUtilizacao");
    private final static QName _GravarReacoes_QNAME = new QName("http://Integrador.gov.br/", "GravarReacoes");
    private final static QName _GravarReacoesResponse_QNAME = new QName("http://Integrador.gov.br/", "GravarReacoesResponse");
    private final static QName _RecebeDadosHemocomponente_QNAME = new QName("http://Integrador.gov.br/", "RecebeDadosHemocomponente");
    private final static QName _RecebeDadosHemocomponenteResponse_QNAME = new QName("http://Integrador.gov.br/", "RecebeDadosHemocomponenteResponse");

    /**
     * Create a new ObjectFactory that can be used to create new instances of schema derived classes for package: br.gov.client1
     * 
     */
    public ObjectFactory() {
    }

    /**
     * Create an instance of {@link RecebeDadosHemocomponenteResponse }
     * 
     */
    public RecebeDadosHemocomponenteResponse createRecebeDadosHemocomponenteResponse() {
        return new RecebeDadosHemocomponenteResponse();
    }

    /**
     * Create an instance of {@link RecebeDadosHemocomponente }
     * 
     */
    public RecebeDadosHemocomponente createRecebeDadosHemocomponente() {
        return new RecebeDadosHemocomponente();
    }

    /**
     * Create an instance of {@link GravarReacoesResponse }
     * 
     */
    public GravarReacoesResponse createGravarReacoesResponse() {
        return new GravarReacoesResponse();
    }

    /**
     * Create an instance of {@link GravarReacoes }
     * 
     */
    public GravarReacoes createGravarReacoes() {
        return new GravarReacoes();
    }

    /**
     * Create an instance of {@link GravaUtilizacao }
     * 
     */
    public GravaUtilizacao createGravaUtilizacao() {
        return new GravaUtilizacao();
    }

    /**
     * Create an instance of {@link RecebeDadosPaciente }
     * 
     */
    public RecebeDadosPaciente createRecebeDadosPaciente() {
        return new RecebeDadosPaciente();
    }

    /**
     * Create an instance of {@link ListarReacoes }
     * 
     */
    public ListarReacoes createListarReacoes() {
        return new ListarReacoes();
    }

    /**
     * Create an instance of {@link GravaPacienteResponse }
     * 
     */
    public GravaPacienteResponse createGravaPacienteResponse() {
        return new GravaPacienteResponse();
    }

    /**
     * Create an instance of {@link GravaPaciente }
     * 
     */
    public GravaPaciente createGravaPaciente() {
        return new GravaPaciente();
    }

    /**
     * Create an instance of {@link RecebeDadosPacienteResponse }
     * 
     */
    public RecebeDadosPacienteResponse createRecebeDadosPacienteResponse() {
        return new RecebeDadosPacienteResponse();
    }

    /**
     * Create an instance of {@link GravaUtilizacaoResponse }
     * 
     */
    public GravaUtilizacaoResponse createGravaUtilizacaoResponse() {
        return new GravaUtilizacaoResponse();
    }

    /**
     * Create an instance of {@link ListarReacoesResponse }
     * 
     */
    public ListarReacoesResponse createListarReacoesResponse() {
        return new ListarReacoesResponse();
    }

    /**
     * Create an instance of {@link Paciente }
     * 
     */
    public Paciente createPaciente() {
        return new Paciente();
    }

    /**
     * Create an instance of {@link Hemocomponente }
     * 
     */
    public Hemocomponente createHemocomponente() {
        return new Hemocomponente();
    }

    /**
     * Create an instance of {@link Reacoes }
     * 
     */
    public Reacoes createReacoes() {
        return new Reacoes();
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link ListarReacoesResponse }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://Integrador.gov.br/", name = "ListarReacoesResponse")
    public JAXBElement<ListarReacoesResponse> createListarReacoesResponse(ListarReacoesResponse value) {
        return new JAXBElement<ListarReacoesResponse>(_ListarReacoesResponse_QNAME, ListarReacoesResponse.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link GravaUtilizacaoResponse }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://Integrador.gov.br/", name = "GravaUtilizacaoResponse")
    public JAXBElement<GravaUtilizacaoResponse> createGravaUtilizacaoResponse(GravaUtilizacaoResponse value) {
        return new JAXBElement<GravaUtilizacaoResponse>(_GravaUtilizacaoResponse_QNAME, GravaUtilizacaoResponse.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link RecebeDadosPacienteResponse }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://Integrador.gov.br/", name = "RecebeDadosPacienteResponse")
    public JAXBElement<RecebeDadosPacienteResponse> createRecebeDadosPacienteResponse(RecebeDadosPacienteResponse value) {
        return new JAXBElement<RecebeDadosPacienteResponse>(_RecebeDadosPacienteResponse_QNAME, RecebeDadosPacienteResponse.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link GravaPaciente }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://Integrador.gov.br/", name = "GravaPaciente")
    public JAXBElement<GravaPaciente> createGravaPaciente(GravaPaciente value) {
        return new JAXBElement<GravaPaciente>(_GravaPaciente_QNAME, GravaPaciente.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link GravaPacienteResponse }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://Integrador.gov.br/", name = "GravaPacienteResponse")
    public JAXBElement<GravaPacienteResponse> createGravaPacienteResponse(GravaPacienteResponse value) {
        return new JAXBElement<GravaPacienteResponse>(_GravaPacienteResponse_QNAME, GravaPacienteResponse.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link ListarReacoes }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://Integrador.gov.br/", name = "ListarReacoes")
    public JAXBElement<ListarReacoes> createListarReacoes(ListarReacoes value) {
        return new JAXBElement<ListarReacoes>(_ListarReacoes_QNAME, ListarReacoes.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link RecebeDadosPaciente }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://Integrador.gov.br/", name = "RecebeDadosPaciente")
    public JAXBElement<RecebeDadosPaciente> createRecebeDadosPaciente(RecebeDadosPaciente value) {
        return new JAXBElement<RecebeDadosPaciente>(_RecebeDadosPaciente_QNAME, RecebeDadosPaciente.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link GravaUtilizacao }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://Integrador.gov.br/", name = "GravaUtilizacao")
    public JAXBElement<GravaUtilizacao> createGravaUtilizacao(GravaUtilizacao value) {
        return new JAXBElement<GravaUtilizacao>(_GravaUtilizacao_QNAME, GravaUtilizacao.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link GravarReacoes }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://Integrador.gov.br/", name = "GravarReacoes")
    public JAXBElement<GravarReacoes> createGravarReacoes(GravarReacoes value) {
        return new JAXBElement<GravarReacoes>(_GravarReacoes_QNAME, GravarReacoes.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link GravarReacoesResponse }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://Integrador.gov.br/", name = "GravarReacoesResponse")
    public JAXBElement<GravarReacoesResponse> createGravarReacoesResponse(GravarReacoesResponse value) {
        return new JAXBElement<GravarReacoesResponse>(_GravarReacoesResponse_QNAME, GravarReacoesResponse.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link RecebeDadosHemocomponente }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://Integrador.gov.br/", name = "RecebeDadosHemocomponente")
    public JAXBElement<RecebeDadosHemocomponente> createRecebeDadosHemocomponente(RecebeDadosHemocomponente value) {
        return new JAXBElement<RecebeDadosHemocomponente>(_RecebeDadosHemocomponente_QNAME, RecebeDadosHemocomponente.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link RecebeDadosHemocomponenteResponse }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://Integrador.gov.br/", name = "RecebeDadosHemocomponenteResponse")
    public JAXBElement<RecebeDadosHemocomponenteResponse> createRecebeDadosHemocomponenteResponse(RecebeDadosHemocomponenteResponse value) {
        return new JAXBElement<RecebeDadosHemocomponenteResponse>(_RecebeDadosHemocomponenteResponse_QNAME, RecebeDadosHemocomponenteResponse.class, null, value);
    }

}
