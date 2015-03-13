-- MySQL Script generated by MySQL Workbench
-- 03/13/15 20:08:20
-- Model: New Model    Version: 1.0
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Dia_Semana`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Dia_Semana` (
  `idDia_Semana` INT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`idDia_Semana`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Endereço`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Endereço` (
  `idEndereço` INT NOT NULL AUTO_INCREMENT,
  `rua` VARCHAR(45) NOT NULL,
  `bairro` VARCHAR(45) NOT NULL,
  `cidade` VARCHAR(45) NOT NULL,
  `estado` VARCHAR(45) NOT NULL,
  `cep` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idEndereço`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Telefone`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Telefone` (
  `idTelefone` INT NOT NULL AUTO_INCREMENT,
  `telefoneFixo` VARCHAR(45) NULL,
  `telefoneCelular` VARCHAR(45) NULL,
  PRIMARY KEY (`idTelefone`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Professor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Professor` (
  `idProfessor` INT NOT NULL AUTO_INCREMENT,
  `idEndereço` INT NOT NULL,
  `idTelefone` INT NOT NULL,
  `nome` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  PRIMARY KEY (`idProfessor`),
  INDEX `fk_Professor_Endereço1_idx` (`idEndereço` ASC),
  INDEX `fk_Professor_Telefone1_idx` (`idTelefone` ASC),
  CONSTRAINT `fk_Professor_Endereço1`
    FOREIGN KEY (`idEndereço`)
    REFERENCES `mydb`.`Endereço` (`idEndereço`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Professor_Telefone1`
    FOREIGN KEY (`idTelefone`)
    REFERENCES `mydb`.`Telefone` (`idTelefone`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Semestre_letivo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Semestre_letivo` (
  `idSemestre_letivo` INT NOT NULL AUTO_INCREMENT,
  `idDia_Semana` INT NOT NULL,
  `idProfessor` INT NOT NULL,
  `semestre` VARCHAR(45) NOT NULL,
  `dataInicio` DATE NOT NULL,
  `dataFim` DATE NULL,
  PRIMARY KEY (`idSemestre_letivo`),
  INDEX `fk_Semestre_letivo_Dia_Semana1_idx` (`idDia_Semana` ASC),
  INDEX `fk_Semestre_letivo_Professor1_idx` (`idProfessor` ASC),
  CONSTRAINT `fk_Semestre_letivo_Dia_Semana1`
    FOREIGN KEY (`idDia_Semana`)
    REFERENCES `mydb`.`Dia_Semana` (`idDia_Semana`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Semestre_letivo_Professor1`
    FOREIGN KEY (`idProfessor`)
    REFERENCES `mydb`.`Professor` (`idProfessor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Disciplina`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Disciplina` (
  `idDisciplina` INT NOT NULL AUTO_INCREMENT,
  `idSemestre_letivo` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `qtdMinimaAlunos` INT NOT NULL,
  `qtdMaxAlunos` INT NOT NULL,
  `cargaHoraria` INT NOT NULL,
  `ementa` VARCHAR(45) NOT NULL,
  `optativa` TINYINT(1) NOT NULL,
  PRIMARY KEY (`idDisciplina`),
  INDEX `fk_Disciplina_Semestre_letivo1_idx` (`idSemestre_letivo` ASC),
  CONSTRAINT `fk_Disciplina_Semestre_letivo1`
    FOREIGN KEY (`idSemestre_letivo`)
    REFERENCES `mydb`.`Semestre_letivo` (`idSemestre_letivo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Instituição`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Instituição` (
  `idInstituição` INT NOT NULL AUTO_INCREMENT,
  `idEndereço` INT NOT NULL,
  `idTelefone` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `logo` VARCHAR(45) NULL,
  PRIMARY KEY (`idInstituição`),
  INDEX `fk_Instituição_Endereço1_idx` (`idEndereço` ASC),
  INDEX `fk_Instituição_Telefone1_idx` (`idTelefone` ASC),
  CONSTRAINT `fk_Instituição_Endereço1`
    FOREIGN KEY (`idEndereço`)
    REFERENCES `mydb`.`Endereço` (`idEndereço`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Instituição_Telefone1`
    FOREIGN KEY (`idTelefone`)
    REFERENCES `mydb`.`Telefone` (`idTelefone`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Departamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Departamento` (
  `idDepartamento` INT NOT NULL AUTO_INCREMENT,
  `idInstituição` INT NOT NULL,
  `nome` VARCHAR(45) NULL,
  `descricao` VARCHAR(45) NULL,
  PRIMARY KEY (`idDepartamento`),
  INDEX `fk_Departamento_Instituição1_idx` (`idInstituição` ASC),
  CONSTRAINT `fk_Departamento_Instituição1`
    FOREIGN KEY (`idInstituição`)
    REFERENCES `mydb`.`Instituição` (`idInstituição`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Aluno`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Aluno` (
  `idAluno` INT NOT NULL AUTO_INCREMENT,
  `idTelefone` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `rg` VARCHAR(45) NULL,
  `cpf` VARCHAR(45) NULL,
  `data_nasc` DATE NULL,
  `nomePai` VARCHAR(45) NULL,
  `nomeMae` VARCHAR(45) NULL,
  `matricula` INT NOT NULL,
  PRIMARY KEY (`idAluno`),
  INDEX `fk_Aluno_Telefone1_idx` (`idTelefone` ASC),
  CONSTRAINT `fk_Aluno_Telefone1`
    FOREIGN KEY (`idTelefone`)
    REFERENCES `mydb`.`Telefone` (`idTelefone`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Avaliação`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Avaliação` (
  `idAvaliação` INT NOT NULL AUTO_INCREMENT,
  `data` DATE NOT NULL,
  `decricao` VARCHAR(45) NOT NULL,
  `final` TINYINT(1) NOT NULL,
  PRIMARY KEY (`idAvaliação`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Registro_Aula`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Registro_Aula` (
  `idRegistro_Aula` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `data` DATE NOT NULL,
  `descricao` VARCHAR(45) NOT NULL,
  `qtdHorasAula` INT NOT NULL,
  `pratica` TINYINT(1) NOT NULL,
  PRIMARY KEY (`idRegistro_Aula`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Matricula_Disciplina`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Matricula_Disciplina` (
  `Id_Matricula_Disciplina` INT NOT NULL AUTO_INCREMENT,
  `Semestre_letivo_idSemestre_letivo` INT NOT NULL,
  `Aluno_idAluno` INT NOT NULL,
  INDEX `fk_Semestre_letivo_has_Aluno_Aluno1_idx` (`Aluno_idAluno` ASC),
  INDEX `fk_Semestre_letivo_has_Aluno_Semestre_letivo1_idx` (`Semestre_letivo_idSemestre_letivo` ASC),
  PRIMARY KEY (`Id_Matricula_Disciplina`),
  CONSTRAINT `fk_Semestre_letivo_has_Aluno_Semestre_letivo1`
    FOREIGN KEY (`Semestre_letivo_idSemestre_letivo`)
    REFERENCES `mydb`.`Semestre_letivo` (`idSemestre_letivo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Semestre_letivo_has_Aluno_Aluno1`
    FOREIGN KEY (`Aluno_idAluno`)
    REFERENCES `mydb`.`Aluno` (`idAluno`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Resultado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Resultado` (
  `idResultado` INT NOT NULL AUTO_INCREMENT,
  `Id_MatriculaDisciplina` INT NOT NULL,
  `mediaTrabalhoEscolar` DOUBLE NULL,
  `mediaFinal` DOUBLE NULL,
  `conceito` INT NULL,
  `aprovado` TINYINT(1) NULL,
  `necessarioFinal` TINYINT(1) NULL,
  `totalFaltas` INT NULL,
  PRIMARY KEY (`idResultado`),
  INDEX `fk_Resultado_Matricula_Disciplina1_idx` (`Id_MatriculaDisciplina` ASC),
  CONSTRAINT `fk_Resultado_Matricula_Disciplina1`
    FOREIGN KEY (`Id_MatriculaDisciplina`)
    REFERENCES `mydb`.`Matricula_Disciplina` (`Id_Matricula_Disciplina`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Nota`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Nota` (
  `Id_Matricula_Disciplina` INT NOT NULL,
  `idAvaliação` INT NOT NULL,
  `valor` DOUBLE NOT NULL,
  INDEX `fk_Matricula_Disciplina_has_Avaliação_Avaliação1_idx` (`idAvaliação` ASC),
  INDEX `fk_Matricula_Disciplina_has_Avaliação_Matricula_Disciplin_idx` (`Id_Matricula_Disciplina` ASC),
  CONSTRAINT `fk_Matricula_Disciplina_has_Avaliação_Matricula_Disciplina1`
    FOREIGN KEY (`Id_Matricula_Disciplina`)
    REFERENCES `mydb`.`Matricula_Disciplina` (`Id_Matricula_Disciplina`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Matricula_Disciplina_has_Avaliação_Avaliação1`
    FOREIGN KEY (`idAvaliação`)
    REFERENCES `mydb`.`Avaliação` (`idAvaliação`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Faltas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Faltas` (
  `id_MatriculaDisciplina` INT NOT NULL,
  `idRegistroAula` INT NOT NULL,
  `justificada` TINYINT(1) NOT NULL,
  `descricaoJustificada` VARCHAR(45) NULL,
  `qtd` INT NOT NULL,
  INDEX `fk_Matricula_Disciplina_has_Registro_Aula_Registro_Aula1_idx` (`idRegistroAula` ASC),
  INDEX `fk_Matricula_Disciplina_has_Registro_Aula_Matricula_Discipl_idx` (`id_MatriculaDisciplina` ASC),
  CONSTRAINT `fk_Matricula_Disciplina_has_Registro_Aula_Matricula_Disciplina1`
    FOREIGN KEY (`id_MatriculaDisciplina`)
    REFERENCES `mydb`.`Matricula_Disciplina` (`Id_Matricula_Disciplina`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Matricula_Disciplina_has_Registro_Aula_Registro_Aula1`
    FOREIGN KEY (`idRegistroAula`)
    REFERENCES `mydb`.`Registro_Aula` (`idRegistro_Aula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
