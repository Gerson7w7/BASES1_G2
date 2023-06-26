-- después de compilar una funcion o procedimiento, ejecuta esto y te mostrará los erorres (si hubiera)
SELECT line, position, text
FROM user_errors
WHERE name = 'EXISTEDOCENTE'; -- aquí pones el nombre de la func o proc.