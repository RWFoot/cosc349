CREATE TABLE papers (
  paperCode varchar(7) NOT NULL,
  name varchar(50) NOT NULL,
  PRIMARY KEY (paperCode)
);

INSERT INTO papers (paperCode, name) VALUES ('COSC326','Computational Problem Solving');
INSERT INTO papers (paperCode, name) VALUES ('COSC349','Cloud Computing Architecture');
