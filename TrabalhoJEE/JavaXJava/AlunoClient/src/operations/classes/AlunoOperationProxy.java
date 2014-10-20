package operations.classes;

public class AlunoOperationProxy implements operations.classes.AlunoOperation {
  private String _endpoint = null;
  private operations.classes.AlunoOperation alunoOperation = null;
  
  public AlunoOperationProxy() {
    _initAlunoOperationProxy();
  }
  
  public AlunoOperationProxy(String endpoint) {
    _endpoint = endpoint;
    _initAlunoOperationProxy();
  }
  
  private void _initAlunoOperationProxy() {
    try {
      alunoOperation = (new operations.classes.AlunoOperationServiceLocator()).getAlunoOperation();
      if (alunoOperation != null) {
        if (_endpoint != null)
          ((javax.xml.rpc.Stub)alunoOperation)._setProperty("javax.xml.rpc.service.endpoint.address", _endpoint);
        else
          _endpoint = (String)((javax.xml.rpc.Stub)alunoOperation)._getProperty("javax.xml.rpc.service.endpoint.address");
      }
      
    }
    catch (javax.xml.rpc.ServiceException serviceException) {}
  }
  
  public String getEndpoint() {
    return _endpoint;
  }
  
  public void setEndpoint(String endpoint) {
    _endpoint = endpoint;
    if (alunoOperation != null)
      ((javax.xml.rpc.Stub)alunoOperation)._setProperty("javax.xml.rpc.service.endpoint.address", _endpoint);
    
  }
  
  public operations.classes.AlunoOperation getAlunoOperation() {
    if (alunoOperation == null)
      _initAlunoOperationProxy();
    return alunoOperation;
  }
  
  public entity.Aluno modifyAlunoGrade(entity.Aluno aluno, float grade) throws java.rmi.RemoteException{
    if (alunoOperation == null)
      _initAlunoOperationProxy();
    return alunoOperation.modifyAlunoGrade(aluno, grade);
  }
  
  public java.lang.String saveAluno(entity.Aluno aluno) throws java.rmi.RemoteException{
    if (alunoOperation == null)
      _initAlunoOperationProxy();
    return alunoOperation.saveAluno(aluno);
  }
  
  
}