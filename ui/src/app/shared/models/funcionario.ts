export interface Funcionario {
    id_funcionario: number,
    senha: string;
    nome: string,
    cpf: string,
    email: string,
    telefones: string[]
    tipo_funcionario: "biblitecario" | "assistente",
}
