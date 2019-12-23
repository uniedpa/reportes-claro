# reportes-claro
Extrae reportes individuales del archivo PDF de la factura de cuenta corporativa de Claro Panamá y los envía por correo electrónica a cada usuario en el contrato

Requiere:

- Sistema Unix/Linux, macOS, Windows con Cygwin o WSL

- Consola con Bash y el programa sendemail (Perl) https://github.com/zehm/sendEmail

- Archivo PDF de la factura del plan corporativo de Claro

- Archivo de texto con el nombre cuentas.txt, que incluye datos de cada usuario de las cuentas en el contrato, en formato CSV: 

```bash
<numero de linea celular>,<direccion de correo del usuario de la linea>

```

- Archivo de texto credenciales.txt con las credenciales de acceso GMail de la cuenta plan.corporativo.uniedpa@gmail.com , en formato:
```
correo=<correo electronico desde donde se envian las facturas>
clave=<clave de acceso a GMail>
```

