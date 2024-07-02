CREATE TABLE proyecto(
    codp INT,
    nomp VARCHAR2(26),
    duracion VARCHAR2(8),
    obs INT
);


-- To handle the insertion of records via keyboard input, you would typically need to use a programming language or script.
-- Below is a pseudo code example for inserting records into the 'proyecto' table based on keyboard input.

/*
PSEUDO CODE:
1. Prompt the user to enter the number of records.
2. For each record:
   a. Prompt the user to enter 'codp', 'nomp', 'duracion', and 'obs'.
   b. Insert the entered values into the 'proyecto' table.
*/

-- Example of how you might write this in an SQL environment that supports procedural code (like PL/SQL for Oracle):


-- Note: Replace the above pseudo code with actual code in the environment where you are running your SQL commands.

CREATE OR REPLACE PROCEDURE InsertProyecto(v_num_registro IN INT) IS
    v_codp INT;
    v_nomp VARCHAR2(26);
    v_duracion VARCHAR2(8);
    v_obs VARCHAR2(8);
    v_last_codp INT;
BEGIN
    -- Determine the last 'codp' used in the table
    SELECT NVL(MAX(codp), 0) INTO v_last_codp FROM proyecto;

    FOR i IN 1..v_num_registro LOOP
        v_codp := v_last_codp + i;  -- Increment 'codp' starting from the last used value
        IF MOD(v_codp, 2) != 0 THEN
            v_nomp := 'alfa';
            v_duracion := '5';
        ELSE
            v_nomp := 'Omega';
            v_duracion := '4';
        END IF;
        
        IF v_codp = 99 THEN
            v_obs := TO_CHAR(v_codp, 'FM000');
        ELSE
            v_obs := TO_CHAR(v_codp, 'FM00');
        END IF;
        
        INSERT INTO proyecto (codp, nomp, duracion, obs) VALUES (v_codp, v_nomp, v_duracion, v_obs);
    END LOOP;
    -- COMMIT;
    DBMS_OUTPUT.PUT_LINE(v_num_registro || ' registros insertados correctamente.');
END InsertProyecto;
/


CREATE OR REPLACE PROCEDURE ListProyectoContent IS
    CURSOR c_proyectos IS
        SELECT * FROM proyecto;
    r_proyecto c_proyectos%ROWTYPE;
BEGIN
    OPEN c_proyectos;
    LOOP
        FETCH c_proyectos INTO r_proyecto;
        EXIT WHEN c_proyectos%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('CodP: ' || r_proyecto.codp || ', Nomp: ' || r_proyecto.nomp || ', Duracion: ' || r_proyecto.duracion || ', Obs: ' || r_proyecto.obs);
    END LOOP;
    CLOSE c_proyectos;
END ListProyectoContent;
/

-- To execute the InsertProyecto procedure, you can use the following PL/SQL block:

BEGIN
    -- Replace 10 with the number of records you want to insert
    InsertProyecto(10);
END;
/
