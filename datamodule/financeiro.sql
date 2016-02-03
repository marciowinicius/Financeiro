-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           5.7.10-log - MySQL Community Server (GPL)
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              9.3.0.4984
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Copiando estrutura do banco de dados para financeiro
CREATE DATABASE IF NOT EXISTS `financeiro` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `financeiro`;


-- Copiando estrutura para tabela financeiro.caixa
CREATE TABLE IF NOT EXISTS `caixa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `numero` varchar(20) NOT NULL,
  `descricao` varchar(200) DEFAULT NULL,
  `valor` decimal(18,2) NOT NULL,
  `tipo` char(1) NOT NULL,
  `dt_cadastro` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela financeiro.caixa: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `caixa` DISABLE KEYS */;
INSERT INTO `caixa` (`id`, `numero`, `descricao`, `valor`, `tipo`, `dt_cadastro`) VALUES
	(1, '01', 'conta de agua', 120.00, '1', '2016-02-02');
/*!40000 ALTER TABLE `caixa` ENABLE KEYS */;


-- Copiando estrutura para tabela financeiro.contas_pagar
CREATE TABLE IF NOT EXISTS `contas_pagar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `numero_doc` varchar(20) NOT NULL,
  `descricao` varchar(200) DEFAULT NULL,
  `parcela` int(11) NOT NULL,
  `vlr_parcela` decimal(18,2) NOT NULL,
  `vlr_compra` decimal(18,2) NOT NULL,
  `vlr_abatido` decimal(18,2) NOT NULL,
  `dt_compra` date NOT NULL,
  `dt_cadastro` date NOT NULL,
  `dt_vencimento` date NOT NULL,
  `dt_pagamento` date NOT NULL,
  `status` char(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela financeiro.contas_pagar: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `contas_pagar` DISABLE KEYS */;
/*!40000 ALTER TABLE `contas_pagar` ENABLE KEYS */;


-- Copiando estrutura para tabela financeiro.contas_receber
CREATE TABLE IF NOT EXISTS `contas_receber` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `documento` varchar(20) NOT NULL,
  `descricao` varchar(200) DEFAULT NULL,
  `parcela` int(11) NOT NULL,
  `vlr_parcela` decimal(18,2) NOT NULL,
  `vlr_compra` decimal(18,2) NOT NULL,
  `vlr_abatido` decimal(18,2) NOT NULL,
  `dt_compra` date NOT NULL,
  `dt_vencimento` date NOT NULL,
  `dt_cadastro` date NOT NULL,
  `status` char(10) NOT NULL,
  `dt_pagamento` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela financeiro.contas_receber: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `contas_receber` DISABLE KEYS */;
/*!40000 ALTER TABLE `contas_receber` ENABLE KEYS */;


-- Copiando estrutura para tabela financeiro.usuarios
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `login` varchar(20) NOT NULL,
  `senha` varchar(20) NOT NULL,
  `status` char(10) NOT NULL,
  `dt_cadastro` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela financeiro.usuarios: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
