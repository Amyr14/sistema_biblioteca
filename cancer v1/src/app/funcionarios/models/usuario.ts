
export interface Usuario {
    nome: string,
    cpf: string,
    email: string,
    endereco: string,
    /**
     * 1 -> Aluno Graduação
     * 
     * 2 -> Aluno Pos
     * 
     * 3 -> Professor
     * 
     * 4 -> Professor Pos
     */
    id_categoria: 1 | 2 | 3 | 4,
    telefones: string[]
}