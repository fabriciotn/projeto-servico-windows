package org.jee;

import java.rmi.RemoteException;

import javax.xml.rpc.ServiceException;

import entity.Aluno;
import operations.classes.AlunoOperation;
import operations.classes.AlunoOperationServiceLocator;

public class TestingWS {

	/**
	 * @param args
	 * @throws RemoteException 
	 * @throws ServiceException 
	 */
	public static void main(String[] args) throws RemoteException, ServiceException {
		AlunoOperation alunoWS = new AlunoOperationServiceLocator().getAlunoOperation();
		Aluno aluno = new Aluno();
		aluno.setCollege("PUC");
		aluno.setGrade(5.5f);
		aluno.setName("Jefferson Souza");
		
		System.out.println(alunoWS.saveAluno(aluno));
		
		Float oldGrade = aluno.getGrade();
		aluno = alunoWS.modifyAlunoGrade(aluno, 10f);
		Float diffNotas = aluno.getGrade() - oldGrade;
		System.out.println("O aluno  " + aluno.getName() + " teve sua nota alterada em " +
				diffNotas + " pontos.");
		

	}

}
