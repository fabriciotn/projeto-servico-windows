/**
 * AlunoOperationService.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package operations.classes;

public interface AlunoOperationService extends javax.xml.rpc.Service {
    public java.lang.String getAlunoOperationAddress();

    public operations.classes.AlunoOperation getAlunoOperation() throws javax.xml.rpc.ServiceException;

    public operations.classes.AlunoOperation getAlunoOperation(java.net.URL portAddress) throws javax.xml.rpc.ServiceException;
}
