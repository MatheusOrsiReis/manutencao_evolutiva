-- Logistica Express: dados fictícios de demonstração.
-- CPF, CNH e senha em AES CryptoJS. CHAVE_SECRETA usada nos controllers: segredo.
CREATE DATABASE IF NOT EXISTS db_logistica CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE db_logistica;

CREATE TABLE IF NOT EXISTS funcionarios (
    codFuncionario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    senha VARCHAR(255) NOT NULL
);
CREATE TABLE IF NOT EXISTS motoristas (
    codMotorista INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    cnh VARCHAR(255) NOT NULL,
    cpf VARCHAR(255) NOT NULL,
    telefone VARCHAR(255) NOT NULL
);
CREATE TABLE IF NOT EXISTS cargas (
    codCarga INT AUTO_INCREMENT PRIMARY KEY,
    descricao VARCHAR(255) NOT NULL,
    peso DECIMAL(10,2) NOT NULL,
    volume DECIMAL(10,2) NOT NULL,
    codigoRastreio VARCHAR(255) NOT NULL,
    idMotorista INT NOT NULL,
    FOREIGN KEY (idMotorista) REFERENCES motoristas(codMotorista) ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE TABLE IF NOT EXISTS entregas (
    codEntrega INT AUTO_INCREMENT PRIMARY KEY,
    cidadeDestino VARCHAR(255) NOT NULL,
    status ENUM('ENTREGUE','TRANSITO') NOT NULL,
    data DATE NOT NULL,
    hora TIME NOT NULL,
    idCarga INT NOT NULL,
    FOREIGN KEY (idCarga) REFERENCES cargas(codCarga) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT IGNORE INTO funcionarios (codFuncionario,nome,email,senha) VALUES
(1, 'Ana Souza', 'ana@logistica.local', 'U2FsdGVkX1+7WUOogGOG9RGnpLD1kOPjA5I6NMn7qv8='),
(2, 'Bruno Lima', 'bruno@logistica.local', 'U2FsdGVkX19QpYeCHingc+5Krm28rrBwQOWqg54xaXQ='),
(3, 'Carla Alves', 'carla@logistica.local', 'U2FsdGVkX19oGhgmXydNd+5vUoV9QHdaHXfvHz/RRjE=');
INSERT IGNORE INTO motoristas (codMotorista,nome,cnh,cpf,telefone) VALUES
(1, 'Carlos Silva', 'U2FsdGVkX18GLzSj3rJm+jJhBjaawZ52ZG123kjlT4c=', 'U2FsdGVkX18ViOj/+dfbgNXm220pz2eqH0NYrvjJgRs=', '11999990000'),
(2, 'Maria Santos', 'U2FsdGVkX1/6+s0TPFkLjKjQ504WFtyi5OA7B9pWGaU=', 'U2FsdGVkX1/+MMKmwK8uVKxKQz50uK65pvomkqmrsrg=', '11999990001'),
(3, 'Paulo Oliveira', 'U2FsdGVkX1+zaSOosRmFEuh7ywcKdwWgDUCme7ndxsY=', 'U2FsdGVkX18QXm+X/FVWLOjnMOmgW+uJbBAAIbKopYI=', '11999990002');
INSERT IGNORE INTO cargas (codCarga,descricao,peso,volume,codigoRastreio,idMotorista) VALUES
(1,'Livros',120.50,1.20,'100001',1),
(2,'Roupas',80.00,0.80,'100002',2),
(3,'Equipamentos',200.00,2.50,'100003',3);
INSERT IGNORE INTO entregas (codEntrega,cidadeDestino,status,data,hora,idCarga) VALUES
(1,'São Paulo','TRANSITO','2026-10-26','08:00:00',1),
(2,'Campinas','ENTREGUE','2026-10-25','14:30:00',2),
(3,'Santos','TRANSITO','2026-10-27','10:00:00',3);
