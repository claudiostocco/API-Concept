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

async function startInsert() {
    const res = await db.insert('CLIENTE', {
            id: '00000000191',
            nome: 'NOVO CLIENTE',
            endereco: 'CAIXA POSTAL',
            numero: 70,
            cep: '18769899',
            idmunicipio: 35,
            nascimento: "1980-01-13T00:00:00.000Z"
        }
    )
    console.log(res);
}

// startInsert();
start();
