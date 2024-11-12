/*Relatório 1 - 
Lista dos empregados admitidos entre 2019-01-01 e 2022-03-31, 
trazendo as colunas (Nome Empregado, CPF Empregado, Data Admissão,  Salário, Departamento, Número de Telefone), 
 ordenado por data de admissão decrescente
 A dataAdm pedida no relatório foi modificada*/
 select emp.nome as "nome do funcionário", emp.cpf as "CPF", emp.dataAdm as "data de admissão",
 concat("R$ ", format(emp.salario, 2, 'de_DE')) as "salário", departamento.nome as "departamento", telefone.numero as "telefone empregado"
    from empregado as emp 
		left join telefone on cpf = Empregado_cpf
        inner join departamento on idDepartamento = emp.Departamento_idDepartamento
        where dataAdm between '2023-01-01' and '2023-10-31'
		order by dataAdm desc;
	
        
/*Relatório 2 - Lista dos empregados que ganham menos que a média salarial dos funcionários do Petshop,
 trazendo as colunas (Nome Empregado, CPF Empregado, Data Admissão,  Salário, Departamento, Número de Telefone), ordenado por nome do empregado;*/
 select emp.nome as "nome do funcionário", emp.cpf as "CPF", emp.dataAdm as "data de admissão",
 concat("R$ ", format(emp.salario, 2, 'de_DE')) as "salário", departamento.nome as "departamento", telefone.numero as "telefone empregado"
    from empregado as emp
		left join telefone on cpf = Empregado_cpf
        inner join departamento on idDepartamento = emp.Departamento_idDepartamento
        where salario < (select avg(salario) from empregado)
		order by emp.nome;
        
/*Relatório 3 - Lista dos departamentos com a quantidade de empregados total por cada departamento,
 trazendo também a média salarial dos funcionários do departamento e a média de comissão recebida pelos empregados do departamento, 
com as colunas (Departamento, Quantidade de Empregados, Média Salarial, Média da Comissão), ordenado por nome do departamento;*/
        
select dep.nome as "departamento", count(empregado.Departamento_idDepartamento) as "total de empregados"
from departamento as dep
inner join empregado on idDepartamento = empregado.Departamento_idDepartamento
group by dep.nome; -- quantidade de empregados por departamento

select dep.nome, (select avg(empregado.salario) 
 from empregado 
where empregado.Departamento_idDepartamento = idDepartamento) as "media salarial"
 from departamento as dep; -- media salarial de todos os departamentos

-- media salarial de cada departamento
select avg(salario) as "media salarial"  from empregado where Departamento_idDepartamento = 1;
select avg(salario) as "media salarial"from empregado where Departamento_idDepartamento = 2;   
select avg(salario) as "media salarial" from empregado where Departamento_idDepartamento = 3;  
-- média da comissão por departamento
select departamento.nome, avg(empregado.comissao)
 from departamento
 inner join  empregado on empregado.Departamento_idDepartamento = departamento.idDepartamento
 group by departamento.nome;
 
-- quantidade de funcionários, média salarial e média de comissão do departamento agrupados pelo nome do departamento
select departamento.nome as "departamento", count(empregado.Departamento_idDepartamento) as "Quantidade de funcionários",
format(avg(empregado.salario), 2, 'de_DE') as "média salarial", format(avg(empregado.comissao), 2, 'de_DE')as "média de comissão do departamento"
from empregado
inner join departamento on empregado.Departamento_idDepartamento = departamento.idDepartamento
group by departamento.nome
order by departamento.nome;

 /*Relatório 4 - Lista dos empregados com a quantidade total de vendas já realiza por cada Empregado,
 além da soma do valor total das vendas do empregado e a soma de suas comissões, trazendo as colunas 
 (Nome Empregado, CPF Empregado, Sexo, Salário, Quantidade Vendas, Total Valor Vendido, Total Comissão das Vendas), ordenado por quantidade total de vendas realizadas;*/
 select empregado.nome as "Funcionário", empregado.cpf as "CPF", empregado.sexo as "sexo", empregado.salario as "Salário", count(venda.Empregado_cpf) as "Quantidade de vendas", 
 format(sum(venda.valor), 2, 'de_DE') as "Valor total das vendas" , format(sum(venda.comissao), 2, 'de_DE') as "Valor total das comissões"
 from venda
 left join empregado on empregado.cpf = venda.Empregado_cpf
 group by empregado.nome;

-- valor indivudual das vendas e comissão que um funcionário específico fez
select empregado.nome, venda.idVenda, format(venda.valor, 2, 'de_DE')as "valor da venda", format(venda.comissao, 2, 'de_DE')as "valor da comissao"
from venda
right join empregado on empregado.cpf = venda.Empregado_cpf
where empregado.nome like 'Jorge Luis'
order by empregado.nome;
-- Error Code: 1055. Expression #2 of SELECT list is not in GROUP BY clause and contains nonaggregated column 'petshop.empregado.cpf' which is not functionally dependent on columns in GROUP BY clause; this is incompatible with sql_mode=only_full_group_by


/*Relatório 5 - Lista dos empregados que prestaram Serviço na venda computando a quantidade total de vendas realizadas com serviço por cada Empregado,
 além da soma do valor total apurado pelos serviços prestados nas vendas por empregado 
 e a soma de suas comissões, trazendo as colunas (Nome Empregado, CPF Empregado, Sexo, Salário, 
Quantidade Vendas com Serviço, Total Valor Vendido com Serviço, Total Comissão das Vendas com Serviço), ordenado por quantidade total de vendas realizadas;*/





 

        
    
    