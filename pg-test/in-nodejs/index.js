require("dotenv").config();
 
const db = require("./db");

// db.connect().then((client) => client.release());
async function start() {
    now = await db.selectNow();
    console.log('Agora:', now, '\n');
    // console.log('');

    res = await db.selectCadCli('SELECT * FROM CLIENTE');
    console.log('Tabela CADCLI:', res);

}

db.insert('CADCLI', {
        id: '30341446874',
        nome: 'CLAUDIO MARCIO STOCCO',
        endereco: 'CAIXA POSTAL',
        numero: 72,
        cep: '18769899',
        idmunicipio: 35,
        nascimento: "1982-04-23T03:00:00.000Z"
    }
)
// start();