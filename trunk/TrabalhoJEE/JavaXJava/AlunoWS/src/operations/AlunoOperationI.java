package operations;

import entity.Aluno;

public interface AlunoOperationI {
	public Aluno modifyAlunoGrade(Aluno aluno, Float grade);
	
	public String saveAluno(Aluno aluno);
}
