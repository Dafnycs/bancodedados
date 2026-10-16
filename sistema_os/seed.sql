-- database: banco.db

PRAGMA foreign_keys = ON;

-- 1. CLIENTES
CREATE TABLE IF NOT EXISTS clientes (
    id_cliente INTEGER PRIMARY KEY,
    nome TEXT NOT NULL,
    telefone TEXT,
    email TEXT
);

INSERT OR IGNORE INTO clientes VALUES
(1, 'João da Silva', NULL, NULL),
(2, 'Maria Souza', NULL, NULL),
(3, 'Carlos Lima', NULL, NULL),
(4, 'Ana Paula', NULL, NULL),
(5, 'Roberto Alves', NULL, NULL);


-- 2. EQUIPAMENTOS
CREATE TABLE IF NOT EXISTS equipamentos (
    id_equipamento INTEGER PRIMARY KEY,
    nome TEXT NOT NULL
);

INSERT OR IGNORE INTO equipamentos VALUES
(1, 'Ar-condicionado'),
(2, 'Geladeira'),
(3, 'Máquina de lavar'),
(4, 'Freezer');


-- 3. TÉCNICOS
CREATE TABLE IF NOT EXISTS tecnicos (
    id_tecnico INTEGER PRIMARY KEY,
    nome TEXT NOT NULL,
    especialidade TEXT,
    contato TEXT
);

INSERT OR IGNORE INTO tecnicos VALUES
(1, 'Carlos Lima', NULL, NULL),
(2, 'Ana Paula', NULL, NULL),
(3, 'Roberto Alves', NULL, NULL),
(4, 'João Silva', NULL, NULL),
(5, 'Maria Santos', NULL, NULL);


-- 4. STATUS
CREATE TABLE IF NOT EXISTS status_os (
    id_status INTEGER PRIMARY KEY,
    descricao TEXT NOT NULL
);

INSERT OR IGNORE INTO status_os VALUES
(1, 'Em andamento'),
(2, 'Concluída'),
(3, 'Pendente');


-- 5. ORDENS DE SERVIÇO
CREATE TABLE IF NOT EXISTS ordens_servico (
    id_os INTEGER PRIMARY KEY,
    descricao_problema TEXT NOT NULL,
    data_os TEXT,
    id_cliente INTEGER,
    id_tecnico INTEGER,
    id_equipamento INTEGER,
    id_status INTEGER,

    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
    FOREIGN KEY (id_tecnico) REFERENCES tecnicos(id_tecnico),
    FOREIGN KEY (id_equipamento) REFERENCES equipamentos(id_equipamento),
    FOREIGN KEY (id_status) REFERENCES status_os(id_status)
);

INSERT OR IGNORE INTO ordens_servico VALUES
(1, 'Manutenção de ar-condicionado', '2026-09-16', 1, 1, 1, 1),
(2, 'Manutenção de geladeira', '2026-09-15', 2, 2, 2, 2),
(3, 'Manutenção de máquina de lavar', '2026-09-14', 3, 3, 3, 3),
(4, 'Manutenção de ar-condicionado', '2026-09-13', 4, 4, 1, 1),
(5, 'Manutenção de freezer', '2026-09-12', 5, 5, 4, 2);
