SET SERVEROUTPUT ON

CREATE OR REPLACE PROCEDURE sp_legend_value(
    plegend VARCHAR, 
    pvalue VARCHAR DEFAULT 'Null',
    ppadding INTEGER DEFAULT 20
) 
AS
    vtext VARCHAR(100);
BEGIN
    vtext := plegend;
    WHILE LENGTH(vtext) < ppadding LOOP
        vtext := vtext || '.';
    END LOOP;
    vtext := vtext || ': ' || pvalue;
    DBMS_OUTPUT.PUT_LINE(vtext);
END;

BEGIN
    sp_legend_value('Id', '12345');
    sp_legend_value('Name', pvalue => 'Daniel');
    sp_legend_value('E-mail', ppadding => 30);
    sp_legend_value(pvalue => 'Developer', plegend => 'Job');
END;