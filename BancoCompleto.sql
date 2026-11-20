-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 20-Nov-2026 às 01:04
-- Versão do servidor: 10.4.28-MariaDB
-- versão do PHP: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `escola`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `alunos`
--

CREATE TABLE `alunos` (
  `id_aluno` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `cpf` varchar(11) DEFAULT NULL,
  `nascimento` date DEFAULT NULL,
  `matricula` varchar(20) DEFAULT NULL,
  `id_curso` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `alunos`
--

INSERT INTO `alunos` (`id_aluno`, `nome`, `cpf`, `nascimento`, `matricula`, `id_curso`) VALUES
(3, 'Pedro', '15014846908', '2005-04-21', '12345', 2),
(4, 'Luiza', '15014846123', '1997-04-22', '12345', 3),
(7, 'Caroline', '15014842345', '1998-04-22', '12356', 3),
(8, 'Leticia', '15014842890', '1999-04-22', '12334', 2),
(9, 'Eduardo', '15014842845', '1989-04-22', '12344', 3),
(10, 'Eduarda', '15014842123', '2000-04-22', '12343', 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `cursos`
--

CREATE TABLE `cursos` (
  `id_curso` int(11) NOT NULL,
  `nome_curso` varchar(100) NOT NULL,
  `carga_horaria` int(11) DEFAULT NULL,
  `turno` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `cursos`
--

INSERT INTO `cursos` (`id_curso`, `nome_curso`, `carga_horaria`, `turno`) VALUES
(1, 'Informatica', 30, 'Dia'),
(2, 'Adm', 40, 'Noite'),
(3, 'Enfermagem', 60, 'Noite');

-- --------------------------------------------------------

--
-- Estrutura da tabela `disciplinas`
--

CREATE TABLE `disciplinas` (
  `id_disciplina` int(11) NOT NULL,
  `nome_disciplina` varchar(100) NOT NULL,
  `carga_horaria` int(11) DEFAULT NULL,
  `id_curso` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `disciplinas`
--

INSERT INTO `disciplinas` (`id_disciplina`, `nome_disciplina`, `carga_horaria`, `id_curso`) VALUES
(1, 'Lógica de Programação', 80, 1),
(2, 'Banco de Dados', 60, 1),
(3, 'Gestão Financeira', 60, 2),
(4, 'Marketing', 40, 2),
(5, 'Anatomia', 80, 3),
(6, 'Farmacologia', 60, 3),
(7, 'Lógica de Programação', 80, 1),
(8, 'Banco de Dados', 60, 1),
(9, 'Gestão Financeira', 60, 2),
(10, 'Marketing', 40, 2),
(11, 'Anatomia', 80, 3),
(12, 'Farmacologia', 60, 3),
(13, 'Lógica de Programação', 80, 1),
(14, 'Banco de Dados', 60, 1),
(15, 'Gestão Financeira', 60, 2),
(16, 'Marketing', 40, 2),
(17, 'Anatomia', 80, 3),
(18, 'Farmacologia', 60, 3),
(19, 'Lógica de Programação', 80, 1),
(20, 'Banco de Dados', 60, 1),
(21, 'Gestão Financeira', 60, 2),
(22, 'Marketing', 40, 2),
(23, 'Anatomia', 80, 3),
(24, 'Farmacologia', 60, 3);

-- --------------------------------------------------------

--
-- Estrutura da tabela `notas`
--

CREATE TABLE `notas` (
  `id_nota` int(11) NOT NULL,
  `nota` decimal(4,2) NOT NULL,
  `data_avaliacao` date DEFAULT NULL,
  `id_aluno` int(11) NOT NULL,
  `id_disciplina` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `notas`
--

INSERT INTO `notas` (`id_nota`, `nota`, `data_avaliacao`, `id_aluno`, `id_disciplina`) VALUES
(9, 8.00, '2026-06-30', 10, 1),
(10, 8.50, '2026-06-30', 10, 2),
(11, 7.50, '2026-06-30', 3, 3),
(13, 6.50, '2026-06-30', 8, 3),
(14, 9.00, '2026-06-30', 8, 4),
(17, 7.00, '2026-06-30', 7, 5),
(18, 6.00, '2026-06-30', 7, 6),
(20, 9.50, '2026-06-30', 9, 6);

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `alunos`
--
ALTER TABLE `alunos`
  ADD PRIMARY KEY (`id_aluno`),
  ADD UNIQUE KEY `cpf` (`cpf`),
  ADD KEY `fk_alunos_cursos` (`id_curso`);

--
-- Índices para tabela `cursos`
--
ALTER TABLE `cursos`
  ADD PRIMARY KEY (`id_curso`);

--
-- Índices para tabela `disciplinas`
--
ALTER TABLE `disciplinas`
  ADD PRIMARY KEY (`id_disciplina`),
  ADD KEY `fk_disciplinas_cursos` (`id_curso`);

--
-- Índices para tabela `notas`
--
ALTER TABLE `notas`
  ADD PRIMARY KEY (`id_nota`),
  ADD UNIQUE KEY `nota` (`nota`),
  ADD KEY `fk_notas_alunos` (`id_aluno`),
  ADD KEY `id_disciplina` (`id_disciplina`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `alunos`
--
ALTER TABLE `alunos`
  MODIFY `id_aluno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de tabela `cursos`
--
ALTER TABLE `cursos`
  MODIFY `id_curso` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `disciplinas`
--
ALTER TABLE `disciplinas`
  MODIFY `id_disciplina` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de tabela `notas`
--
ALTER TABLE `notas`
  MODIFY `id_nota` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `alunos`
--
ALTER TABLE `alunos`
  ADD CONSTRAINT `fk_alunos_cursos` FOREIGN KEY (`id_curso`) REFERENCES `cursos` (`id_curso`) ON UPDATE CASCADE;

--
-- Limitadores para a tabela `disciplinas`
--
ALTER TABLE `disciplinas`
  ADD CONSTRAINT `fk_disciplinas_cursos` FOREIGN KEY (`id_curso`) REFERENCES `cursos` (`id_curso`) ON UPDATE CASCADE;

--
-- Limitadores para a tabela `notas`
--
ALTER TABLE `notas`
  ADD CONSTRAINT `fk_notas_alunos` FOREIGN KEY (`id_aluno`) REFERENCES `alunos` (`id_aluno`),
  ADD CONSTRAINT `notas_ibfk_1` FOREIGN KEY (`id_disciplina`) REFERENCES `disciplinas` (`id_disciplina`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
