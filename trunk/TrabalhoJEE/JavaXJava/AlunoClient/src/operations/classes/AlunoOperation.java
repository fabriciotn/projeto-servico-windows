/**
 * AlunoOperation.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package operations.classes;

public interface AlunoOperation extends java.rmi.Remote {
    public entity.Aluno modifyAlunoGrade(entity.Aluno aluno, float grade) throws java.rmi.RemoteException;
    public java.lang.String saveAluno(entity.Aluno aluno) throws java.rmi.RemoteException;
}
