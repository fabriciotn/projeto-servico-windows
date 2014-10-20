package operations.classes;

import entity.Aluno;
import operations.AlunoOperationI;

public class AlunoOperation implements AlunoOperationI {

	@Override
	public Aluno modifyAlunoGrade(Aluno aluno, Float grade) {
		aluno.setGrade(grade);
		return aluno;
	}

	@Override
	public String saveAluno(Aluno aluno) {
		return "O aluno "+ aluno.getName()+ " foi salvo com a nota " + 
					aluno.getGrade() +  " pertencente ao colégio " + aluno.getCollege();
	}

}
