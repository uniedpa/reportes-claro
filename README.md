# reportes-claro
Extrae las facturas individuales del archivo PDF de la factura de cuentas corporativas de Claro Panamá y las envía por correo electrónico a cada usuario en el contrato.

Requiere:

- Sistema Unix/Linux, macOS, Windows con Cygwin o WSL
- Locale es_PA.uf8 disponible
- Cónsola con Bash
- QPDF http://qpdf.sourceforge.net/
- Pdfgrep https://pdfgrep.org/
- Sendemail https://github.com/zehm/sendEmail
- Archivo PDF de la factura del plan corporativo de Claro
- Archivo de texto con el nombre cuentas.txt, que incluye datos de cada usuario de las cuentas en el contrato, en formato CSV: 

```bash
<numero de linea celular>,<direccion de correo del usuario de la linea>

```

- Archivo de texto credenciales.txt con las credenciales de acceso GMail de la cuenta desde donde se envían las facturas individuales, en formato:
```
correo=<correo electronico desde donde se envian las facturas>
clave=<clave de acceso a GMail>
```

